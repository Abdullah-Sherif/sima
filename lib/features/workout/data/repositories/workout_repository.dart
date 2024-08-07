import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';
import 'package:sqflite/sqflite.dart';

final workoutRepositoryProvider = Provider<WorkoutRepository>((ref) {
  final db = ref.watch(databaseServiceProvider).db;
  final repository = WorkoutRepository(db: db!);
  ref.onDispose(() {
    repository.dispose();
  });
  return repository;
});

class WorkoutRepository {
  WorkoutRepository({required this.db}) {
    _currentCycleController = StreamController<CycleEntity>.broadcast(
      onListen: _fetchCurrentCycle,
    );
    _allExercisesController = StreamController<List<ExerciseEntity>>.broadcast(
      onListen: _fetchAllExercises,
    );
  }

  final Database db;
  late final StreamController<CycleEntity> _currentCycleController;
  late final StreamController<List<ExerciseEntity>> _allExercisesController;

  Stream<CycleEntity> get currentCycleStream => _currentCycleController.stream;
  Stream<List<ExerciseEntity>> get allExercisesStream => _allExercisesController.stream;

  void initCycles() async {
    final List<Map<String, dynamic>> rawCycles = await db.query('past_cycles', orderBy: 'id ASC');
    if (rawCycles.isEmpty) {
      final cycle = CycleEntity(key: '1', startDate: DateTime.now());
      final cycleJson = cycle.toJson();
      await db.insert('past_cycles', cycleJson);
    }
  }

  Future<Either<Failure, List<CycleEntity>>> fetchPastCycles() async {
    try {
      final List<Map<String, dynamic>> rawCycles = await db.query('past_cycles', orderBy: 'id ASC');

      final List<CycleEntity> pastCycles = List.generate(rawCycles.length, (i) {
        final Map<String, dynamic> rawCycle = rawCycles[i];
        return CycleEntity.fromJson(rawCycle);
      });

      return Right(pastCycles);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  void _fetchCurrentCycle() async {
    final List<Map<String, dynamic>> rawCycles = await db.query('past_cycles', orderBy: 'id ASC');

    if (rawCycles.isNotEmpty) {
      final List<Map<String, dynamic>> rawWorkouts = await db.query('workouts', orderBy: 'id ASC');
      Map<String, WorkoutEntity> workouts = {for (var e in rawWorkouts) e['id'].toString(): WorkoutEntity.fromJson(e)};

      for (int i = 0; i < workouts.length; i++) {
        final workout = workouts.values.elementAt(i);
        final List<Map<String, dynamic>> rawExercisesInWorkout = await db.rawQuery(
          'SELECT e.id AS id, eiw.force_completed AS forceCompleted, e.name AS name, e.description AS description, e.type AS type, e.max AS max, e.video_path AS videoPath, e.sets AS sets FROM exercises_in_workout AS eiw JOIN exercises AS e ON eiw.exercise_id = e.id WHERE eiw.workout_id = ?',
          [workout.key],
        );

        final Map<String, ExerciseEntity> exercises = {for (var e in rawExercisesInWorkout) e['id']: ExerciseEntity.fromJson(e)};

        workouts[workout.key] = workout.setExercises(exercises);
      }

      final Map<String, dynamic> rawCurrentCycle = rawCycles.last;
      final emptyCurrentCycle = CycleEntity.fromJson(rawCurrentCycle);
      final updatedCycle = emptyCurrentCycle.copyWith(workouts: workouts);
      _currentCycleController.add(updatedCycle);
    }
  }

  Future<Either<Failure, Success>> addExerciseToWorkout(String workoutId, String exerciseId) async {
    try {
      await db.insert(
        'exercises_in_workout',
        {
          'exercise_id': exerciseId,
          'workout_id': workoutId,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );

      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Success>> updateExerciseInWorkout(
      String workoutId, String exerciseId, ExerciseEntity newWorkoutExercise) async {
    final Map<String, dynamic> newJson = newWorkoutExercise.toJson();

    final forceComplete = newJson['force_complete'];
    final exerciseData = Map<String, dynamic>.from(newJson)..remove('force_complete');

    await db.update(
      'exercises_in_workout',
      {'force_complete': forceComplete},
      where: 'workout_id = ? AND exercise_id = ?',
      whereArgs: [workoutId, exerciseId],
    );

    await db.update(
      'exercises',
      exerciseData,
      where: 'id = ?',
      whereArgs: [exerciseId],
    );

    final List<Map<String, dynamic>> rawUpdatedExercise = await db.rawQuery(
      'SELECT e.id AS id, eiw.force_complete AS force_complete, e.name AS name, e.description AS description, e.type AS type, e.max AS max, e.video_path AS videoPath, e.sets AS sets FROM exercises_in_workout AS eiw JOIN exercises AS e ON eiw.exercise_id = e.id WHERE eiw.workout_id = ? AND e.id = ?',
      [workoutId, exerciseId],
    );

    if (rawUpdatedExercise.isNotEmpty) {
      final updatedExercise = ExerciseEntity.fromJson(rawUpdatedExercise.first);

      final currentCycle = await _currentCycleController.stream.first;

      final updatedWorkouts = Map<String, WorkoutEntity>.from(currentCycle.workouts);
      final updatedWorkout = updatedWorkouts[workoutId]?.updateExercise(updatedExercise);

      if (updatedWorkout != null) {
        updatedWorkouts[workoutId] = updatedWorkout;

        final updatedCycle = currentCycle.copyWith(workouts: updatedWorkouts);

        _currentCycleController.add(updatedCycle);
      }

      _fetchAllExercises();
      return const Right(Success());
    } else {
      return const Left(Failure('Failed to update exercise'));
    }
  }

  Future<Either<Failure, Success>> deleteExerciseFromWorkout(String workoutId, String exerciseId) async {
    try {
      await db.delete('exercises_in_workout', where: 'workout_id = ? AND exercise_id = ?', whereArgs: [workoutId, exerciseId]);
      _fetchCurrentCycle();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Success>> setExercisesToWorkout(String workoutId, List<String> exercises) async {
    try {
      await db.transaction((txn) async {
        await txn.delete('exercises_in_workout', where: 'workout_id = ?', whereArgs: [workoutId]);
        for (final exerciseId in exercises) {
          await txn.insert(
            'exercises_in_workout',
            {
              'exercise_id': exerciseId,
              'workout_id': workoutId,
            },
          );
        }
      });

      _fetchCurrentCycle();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Success>> addWorkout(WorkoutEntity workout) async {
    try {
      final workoutJson = workout.toJson();
      if (workoutJson.containsKey('exercises')) {
        workoutJson.remove('exercises');
      }
      await db.insert(
        'workouts',
        workoutJson,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      _fetchCurrentCycle();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Success>> updateWorkout(String workoutId, Map<String, dynamic> updates) async {
    try {
      if (updates.containsKey('exercises')) {
        updates.remove('exercises');
      }
      await db.update('workouts', updates, where: 'id = ?', whereArgs: [workoutId]);
      _fetchCurrentCycle();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Success>> deleteWorkout(String workoutId) async {
    try {
      await db.delete('workouts', where: 'id = ?', whereArgs: [workoutId]);
      _fetchCurrentCycle();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  void _fetchAllExercises() async {
    List<Map<String, dynamic>> rawExercises;
    rawExercises = await db.query('exercises', orderBy: 'id ASC');

    List<ExerciseEntity> exercises = List.generate(rawExercises.length, (i) {
      final Map<String, dynamic> rawExercise = rawExercises[i];
      return ExerciseEntity.fromJson(rawExercise);
    });

    _allExercisesController.add(exercises);
  }

  Future<Either<Failure, Success>> addExercise(ExerciseEntity exercise) async {
    try {
      final exerciseData = Map<String, dynamic>.from(exercise.toJson())..remove('force_complete');
      await db.insert('exercises', exerciseData);
      _fetchAllExercises();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Success>> updateExercise(String exerciseId, Map<String, dynamic> updates) async {
    try {
      updates.remove('force_complete');
      await db.update('exercises', updates, where: 'id = ?', whereArgs: [exerciseId]);

      _fetchAllExercises();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Success>> deleteExercise(String exerciseId) async {
    try {
      await db.delete('exercises', where: 'id = ?', whereArgs: [exerciseId]);
      _fetchAllExercises();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  void dispose() {
    _currentCycleController.close();
    _allExercisesController.close();
  }
}
