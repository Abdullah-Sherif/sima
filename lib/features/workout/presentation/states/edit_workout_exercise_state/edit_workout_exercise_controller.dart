import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

import 'edit_workout_exercise_state.dart';

final editWorkoutExerciseControllerProvider =
    StateNotifierProvider.autoDispose<EditWorkoutExerciseController, EditWorkoutExerciseState>((ref) {
  return EditWorkoutExerciseController(
    const EditWorkoutExerciseState(),
    ref.watch(workoutRepositoryProvider),
  );
});

class EditWorkoutExerciseController extends StateNotifier<EditWorkoutExerciseState> {
  EditWorkoutExerciseController(
    EditWorkoutExerciseState state,
    this._workoutRepository,
  ) : super(state);

  final WorkoutRepository _workoutRepository;

  void setExercise(ExerciseEntity? exercise) {
    state = state.copyWith(
      activeExercise: exercise,
    );
  }

  void updateExerciseInWorkout(ExerciseEntity exercise, String workoutKey) {
    state = state.copyWith(
      status: FetchStatus.loading,
    );

    _workoutRepository.updateExerciseInWorkout(workoutKey, exercise.key, exercise).then((result) {
      result.fold(
        (failure) {
          state = state.copyWith(
            status: FetchStatus.failure,
          );
        },
        (exercise) {
          state = state.copyWith(
            status: FetchStatus.success,
          );
        },
      );
    });
  }

  void forceCompleteExercise(bool? value, String workoutKey) {
    final exercise = state.activeExercise;
    if (exercise != null && value != null) {
      final updatedExercise = exercise.copyWith(
        forceCompleted: value,
      );

      updateExerciseInWorkout(updatedExercise, workoutKey);
    }
  }

  void completeSet(SetEntity set, String workoutKey, bool? isCompleted) {
    final exercise = state.activeExercise;
    if (exercise != null && isCompleted != null) {
      final updatedSets = exercise.currentSets.map((key, s) {
        if (key == set.key) {
          return MapEntry(key, set.setCompleted(isCompleted));
        }
        return MapEntry(key, s);
      });

      final updatedExercise = exercise.copyWith(
        currentSets: updatedSets,
      );

      updateExerciseInWorkout(updatedExercise, workoutKey);
    }
  }

  void updateSetReps(SetEntity set, String workoutKey, int reps) {
    final exercise = state.activeExercise;
    if (exercise != null) {
      final updatedSets = exercise.currentSets.map((key, s) {
        if (key == set.key) {
          return MapEntry(key, set.setReps(reps));
        }
        return MapEntry(key, s);
      });

      final updatedExercise = exercise.copyWith(
        currentSets: updatedSets,
      );

      updateExerciseInWorkout(updatedExercise, workoutKey);
    }
  }

  void updateSetWeight(SetEntity set, String workoutKey, int weight) {
    final exercise = state.activeExercise;
    if (exercise != null) {
      final updatedSets = exercise.currentSets.map((key, s) {
        if (key == set.key) {
          return MapEntry(key, set.setWeight(weight));
        }
        return MapEntry(key, s);
      });

      final updatedExercise = exercise.copyWith(
        currentSets: updatedSets,
        max: exercise.max < weight ? weight : exercise.max,
      );

      updateExerciseInWorkout(updatedExercise, workoutKey);
    }
  }
}
