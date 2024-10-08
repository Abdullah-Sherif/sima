import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';
import 'package:sqflite/sqflite.dart';

final workoutRepositoryProvider = Provider<WorkoutRepository>((ref) {
  final dbService = ref.watch(databaseServiceProvider);
  final repository = WorkoutRepository(dbService: dbService);
  ref.onDispose(() {
    repository.dispose();
  });
  return repository;
});

class WorkoutRepository {
  WorkoutRepository({required this.dbService}) {
    _currentCycleController = StreamController<CycleEntity>.broadcast(
      onListen: _fetchCurrentCycle,
    );
    _allExercisesController = StreamController<List<ExerciseEntity>>.broadcast(
      onListen: _fetchAllExercises,
    );

    _workoutsSubscription = StreamController<Map<String, WorkoutEntity>>.broadcast(
      onListen: _fetchCurrentCycle,
    );

    db = dbService.db!;
  }

  final DatabaseService dbService;
  late final Database db;
  late final StreamController<CycleEntity> _currentCycleController;
  late final StreamController<List<ExerciseEntity>> _allExercisesController;
  late final StreamController<Map<String, WorkoutEntity>> _workoutsSubscription;

  Stream<CycleEntity> get currentCycleStream => _currentCycleController.stream;
  Stream<List<ExerciseEntity>> get allExercisesStream => _allExercisesController.stream;
  Stream<Map<String, WorkoutEntity>> get workoutsStream => _workoutsSubscription.stream;

  Future<void> initCycles() async {
    final List<Map<String, dynamic>> rawCycles = await db.query('past_cycles', orderBy: 'id ASC');
    if (rawCycles.isEmpty) {
      final cycle = CycleEntity(key: '1', startDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
      final cycleJson = cycle.toJson();
      await db.insert('past_cycles', cycleJson);
    }
  }

  Future<Either<Failure, List<CycleEntity>>> fetchPastCycles() async {
    try {
      final List<Map<String, dynamic>> rawCycles = await db.query('past_cycles', orderBy: 'id ASC');

      if (rawCycles.isEmpty || rawCycles.length == 1) {
        return const Right([]);
      }

      final List<CycleEntity> pastCycles = List.generate(rawCycles.length - 1, (i) {
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
          'SELECT e.id AS id, eiw.force_completed AS force_complete, e.name AS name, e.description AS description, e.type AS type, e.max AS max, e.video_path AS video_path, e.sets AS sets FROM exercises_in_workout AS eiw JOIN exercises AS e ON eiw.exercise_id = e.id WHERE eiw.workout_id = ?',
          [workout.key],
        );

        final Map<String, ExerciseEntity> exercises = {
          for (var e in rawExercisesInWorkout) e['id'].toString(): ExerciseEntity.fromJson(e)
        };

        workouts[workout.key] = workout.setExercises(exercises);
      }

      final Map<String, dynamic> rawCurrentCycle = rawCycles.last;
      final emptyCurrentCycle = CycleEntity.fromJson(rawCurrentCycle);
      final Map<String, WorkoutEntity> existingWorkouts = emptyCurrentCycle.workouts;
      final Map<String, WorkoutEntity> mergedWorkouts = {};

      existingWorkouts.forEach((key, value) {
        mergedWorkouts[key] = value;
      });
      workouts.forEach((key, value) {
        if (!mergedWorkouts.containsKey(key)) {
          mergedWorkouts[key] = value;
        }
      });

      final updatedCycle = emptyCurrentCycle.copyWith(workouts: mergedWorkouts);
      _currentCycleController.add(updatedCycle);
      _workoutsSubscription.add(workouts);
    }
  }

  Future<Either<Failure, Success>> deleteDataBase() async {
    try {
      await dbService.deleteSimaDatabase();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //clear all data
  Future<Either<Failure, Success>> clearAllData() async {
    try {
      await db.delete('past_cycles');
      await db.delete('workouts');
      await db.delete('exercises');
      await db.delete('exercises_in_workout');

      _fetchCurrentCycle();
      _fetchAllExercises();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Success>> addCycle(String newCycleKey, DateTime newStartDate) async {
    try {
      final cycle = CycleEntity(
        key: newCycleKey,
        startDate: newStartDate,
      );

      await db.transaction((txn) async {
        final rawWorkouts = await txn.query('workouts');
        final workouts = {for (var e in rawWorkouts) e['id'].toString(): WorkoutEntity.fromJson(e)};
        final cycleJson = cycle.toJson()
          ..remove('workouts')
          ..addAll({'workouts': '{}'});

        await txn.insert(
          'past_cycles',
          cycleJson,
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        for (final workout in workouts.values) {
          final rawExercisesInWorkout = await txn.query(
            'exercises_in_workout',
            where: 'workout_id = ?',
            whereArgs: [workout.key],
          );
          final exercisesKeys = [for (var e in rawExercisesInWorkout) e['exercise_id'].toString()];

          if (exercisesKeys.isNotEmpty) {
            for (final exerciseKey in exercisesKeys) {
              final rawExercise = await txn.query('exercises', where: 'id = ?', whereArgs: [int.parse(exerciseKey)]);
              final exerciseEntity = ExerciseEntity.fromJson(rawExercise.first);
              final updatedExercise = exerciseEntity.resetAllSets();
              final exerciseData = updatedExercise.toJson()..remove('force_complete');
              await txn.update('exercises', exerciseData, where: 'id = ?', whereArgs: [int.parse(exerciseKey)]);

              await txn.update(
                'exercises_in_workout',
                {'force_completed': 0},
                where: 'workout_id = ? AND exercise_id = ?',
                whereArgs: [workout.key, exerciseKey],
              );
            }
          }

          await txn.update(
            'workouts',
            {'force_completed': 0},
            where: 'id = ?',
            whereArgs: [workout.key],
          );
        }
      });

      _fetchCurrentCycle();
      _fetchAllExercises();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Success>> addWorkoutToPastCurrentCycle(WorkoutEntity newWorkout) async {
    try {
      final List<Map<String, dynamic>> rawCycles = await db.query('past_cycles', orderBy: 'id ASC');
      final Map<String, dynamic> rawCurrentCycle = rawCycles.last;
      final pastCurrentCycle = CycleEntity.fromJson(rawCurrentCycle);

      final updatedWorkouts = Map<String, WorkoutEntity>.from(pastCurrentCycle.workouts);
      if (!updatedWorkouts.containsKey(newWorkout.key)) {
        updatedWorkouts[newWorkout.key] = newWorkout;
      }

      final updatedCycle = pastCurrentCycle.copyWith(workouts: updatedWorkouts);

      await db.update('past_cycles', updatedCycle.toJson(), where: 'id = ?', whereArgs: [pastCurrentCycle.key]);
      _fetchCurrentCycle();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
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

  Future<Either<Failure, Success>> updateExerciseInWorkout(String workoutId, String exerciseId, ExerciseEntity newWorkoutExercise,
      {Transaction? txn}) async {
    final exercise = await db
        .query('exercises', where: 'id = ?', whereArgs: [exerciseId]).then((value) => ExerciseEntity.fromJson(value.first));
    final logs = exercise.logs;

    final Map<String, dynamic> newJson = newWorkoutExercise.copyWith(logs: logs).toJson();

    final forceComplete = newJson['force_complete'];
    final exerciseData = Map<String, dynamic>.from(newJson)..remove('force_complete');

    final database = txn ?? db;

    await database.update(
      'exercises_in_workout',
      {'force_completed': forceComplete},
      where: 'workout_id = ? AND exercise_id = ?',
      whereArgs: [workoutId, exerciseId],
    );

    await database.update(
      'exercises',
      exerciseData,
      where: 'id = ?',
      whereArgs: [exerciseId],
    );

    final List<Map<String, dynamic>> rawUpdatedExercise = await database.rawQuery(
      'SELECT e.id AS id, eiw.force_completed AS force_complete, e.name AS name, e.description AS description, e.type AS type, e.max AS max, e.video_path AS videoPath, e.sets AS sets FROM exercises_in_workout AS eiw JOIN exercises AS e ON eiw.exercise_id = e.id WHERE eiw.workout_id = ? AND e.id = ?',
      [workoutId, exerciseId],
    );

    if (rawUpdatedExercise.isNotEmpty) {
      _fetchCurrentCycle();
      _fetchAllExercises();
      return const Right(Success());
    } else {
      return const Left(Failure('Failed to update exercise'));
    }
  }

  Future<Either<Failure, Success>> addLogsAndMaxToExercise(String exerciseId, ExerciseEntity newExercise) async {
    try {
      final rawExercise = await db.query('exercises', where: 'id = ?', whereArgs: [exerciseId]);
      final exercise = ExerciseEntity.fromJson(rawExercise.first);
      final updatedExercise = exercise.copyWith(
        max: newExercise.max,
        logs: [...exercise.logs, ...newExercise.logs],
      );
      final exerciseData = updatedExercise.toJson()..remove('force_complete');

      await db.update('exercises', exerciseData, where: 'id = ?', whereArgs: [exerciseId]);

      _fetchAllExercises();
      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
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

  Future<Either<Failure, Success>> updateWorkout(String workoutId, Map<String, dynamic> updates, {Transaction? txn}) async {
    try {
      if (updates.containsKey('exercises')) {
        updates.remove('exercises');
      }

      final database = txn ?? db;

      await database.update('workouts', updates, where: 'id = ?', whereArgs: [workoutId]);

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

      final List<Map<String, dynamic>> rawExercisesInWorkout =
          await db.query('exercises_in_workout', where: 'exercise_id = ?', whereArgs: [exerciseId]);
      if (rawExercisesInWorkout.isNotEmpty) {
        _fetchCurrentCycle();
      }

      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  Future<Either<Failure, Success>> deleteExercise(String exerciseId) async {
    try {
      bool flag = false;
      final List<Map<String, dynamic>> rawExercisesInWorkout =
          await db.query('exercises_in_workout', where: 'exercise_id = ?', whereArgs: [exerciseId]);
      if (rawExercisesInWorkout.isNotEmpty) {
        flag = true;
      }
      await db.delete('exercises', where: 'id = ?', whereArgs: [exerciseId]);
      _fetchAllExercises();

      if (flag) {
        _fetchCurrentCycle();
      }

      return const Right(Success());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  void dispose() {
    _currentCycleController.close();
    _allExercisesController.close();
    _workoutsSubscription.close();
  }
}
