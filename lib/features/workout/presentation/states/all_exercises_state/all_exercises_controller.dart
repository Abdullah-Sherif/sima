import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

import 'all_exercises_state.dart';

final allexercisesControllerProvider = StateNotifierProvider.autoDispose<AllExercisesController, AllExercisesState>((ref) {
  return AllExercisesController(
    AllExercisesState(exercises: mockExercises),
  );
});

final mockExercises = {
  '1': ExerciseEntity(
    key: '1',
    name: 'Bench Press',
    description: 'Bench press is a compound exercise that builds upper body strength.',
    type: ExerciseType.reps,
    currentSets: {
      '0': SetEntity.weight(
        key: '0',
        reps: 10,
        weight: 10,
      ),
      '1': SetEntity.weight(
        key: '1',
        reps: 10,
        weight: 10,
      ),
      '2': SetEntity.weight(
        key: '2',
        reps: 10,
        weight: 10,
      ),
    },
  ).addCurrentStateToLogs(1, 1).addCurrentStateToLogs(2, 1).addCurrentStateToLogs(3, 4).addCurrentStateToLogs(5, 1),
  '2': ExerciseEntity(
    key: '2',
    name: 'Squat',
    description: 'Squat is a compound exercise that builds lower body strength.',
    type: ExerciseType.reps,
    currentSets: {
      '0': SetEntity.weight(
        key: '0',
        reps: 10,
        weight: 10,
      ),
      '1': SetEntity.weight(
        key: '1',
        reps: 10,
        weight: 10,
      ),
      '2': SetEntity.weight(
        key: '2',
        reps: 10,
        weight: 10,
      ),
    },
  ),
  '3': ExerciseEntity(
    key: '3',
    name: 'Plank',
    description: 'Plank is a core exercise that builds core strength.',
    type: ExerciseType.duration,
    currentSets: {
      '0': SetEntity.duration(
        key: '0',
        durationInSec: 60,
      ),
      '1': SetEntity.duration(
        key: '1',
        durationInSec: 60,
      ),
      '2': SetEntity.duration(
        key: '2',
        durationInSec: 60,
      ),
    },
  ),
};

class AllExercisesController extends StateNotifier<AllExercisesState> {
  AllExercisesController(
    AllExercisesState state,
  ) : super(state);

  void addWorkout(String key, String name, String description, ExerciseType type, int numberOfSets) {
    Map<String, SetEntity> sets = {};
    for (int i = 0; i < numberOfSets; i++) {
      type == ExerciseType.reps
          ? sets = {
              ...sets,
              i.toString(): SetEntity.weight(
                key: i.toString(),
                reps: 10,
                weight: 10,
              ),
            }
          : sets = {
              ...sets,
              i.toString(): SetEntity.duration(
                key: i.toString(),
                durationInSec: 60,
              ),
            };
    }
    state = state.copyWith(
      exercises: {
        ...state.exercises,
        key: ExerciseEntity(name: name, description: description, key: key, type: type, currentSets: sets),
      },
    );
  }

  void updateExercise(String key, String name, String description, int numberOfSets) {
    final exercise = state.exercises[key];
    if (exercise != null) {
      Map<String, SetEntity> sets = {};
      for (int i = exercise.currentSets.length; i < numberOfSets; i++) {
        sets = {
          ...sets,
          i.toString(): exercise.currentSets[i.toString()] ??
              SetEntity.weight(
                key: i.toString(),
                reps: 10,
                weight: 10,
              ),
        };
      }
      state = state.copyWith(
        exercises: {
          ...state.exercises,
          key: exercise.copyWith(name: name, description: description, currentSets: sets),
        },
      );
    }
  }

  void removeExercise(String key) {
    final exercises = Map.of(state.exercises);
    exercises.remove(key);
    state = state.copyWith(
      exercises: exercises,
    );
  }

  void checkIsMax(int value, String key) {
    final exercise = state.exercises[key];
    if (exercise != null) {
      state = state.copyWith(
        exercises: {
          ...state.exercises,
          key: exercise.setMax(value),
        },
      );
    }
  }

  void setVideoPath(String? videoPath, String key) {
    final exercise = state.exercises[key];
    if (exercise != null) {
      state = state.copyWith(
        exercises: {
          ...state.exercises,
          key: exercise.copyWith(videoPath: videoPath),
        },
      );
    }
  }
}
