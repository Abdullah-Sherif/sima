import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

import 'all_exercises_state.dart';

final allexercisesControllerProvider = StateNotifierProvider.autoDispose<AllExercisesController, AllExercisesState>((ref) {
  return AllExercisesController(
    AllExercisesState(),
  );
});

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
        key: ExerciseEntity(name: name, description: description, key: key, type: type, sets: sets),
      },
    );
  }
}
