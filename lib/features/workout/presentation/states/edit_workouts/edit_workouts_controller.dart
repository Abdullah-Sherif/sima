import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

import 'edit_workouts_state.dart';

final editWorkoutsControllerProvider = StateNotifierProvider.autoDispose<EditWorkoutsController, EditWorkoutsState>((ref) {
  return EditWorkoutsController(
    const EditWorkoutsState(),
    ref.watch(workoutRepositoryProvider),
  );
});

class EditWorkoutsController extends StateNotifier<EditWorkoutsState> {
  EditWorkoutsController(
    EditWorkoutsState state,
    this._workoutRepository,
  ) : super(state);

  final WorkoutRepository _workoutRepository;

  void addWorkout(WorkoutEntity workout) {
    state = state.copyWith(status: FetchStatus.loading);

    _workoutRepository.addWorkout(workout).then((result) {
      result.fold(
        (failure) => state = state.copyWith(status: FetchStatus.failure),
        (workouts) => state = state.copyWith(status: FetchStatus.success),
      );
    });
  }

  Future<void> updateWorkout(WorkoutEntity workout) async{
    state = state.copyWith(status: FetchStatus.loading);

    await _workoutRepository.updateWorkout(workout.key, workout.toJson()).then((result) {
      result.fold(
        (failure) => state = state.copyWith(status: FetchStatus.failure),
        (workouts) => state = state.copyWith(status: FetchStatus.success),
      );
    });
  }

  void deleteWorkout(String key) {
    state = state.copyWith(status: FetchStatus.loading);

    _workoutRepository.deleteWorkout(key).then((result) {
      result.fold(
        (failure) => state = state.copyWith(status: FetchStatus.failure),
        (workouts) => state = state.copyWith(status: FetchStatus.success),
      );
    });
  }

  void deleteExerciseFromWorkout(String workoutKey, String exerciseKey) {
    state = state.copyWith(status: FetchStatus.loading);

    _workoutRepository.deleteExerciseFromWorkout(workoutKey, exerciseKey).then((result) {
      result.fold(
        (failure) => state = state.copyWith(status: FetchStatus.failure),
        (workouts) => state = state.copyWith(status: FetchStatus.success),
      );
    });
  }

  void setExercisesToWorkout(String workoutKey, List<String> exercises) {
    state = state.copyWith(status: FetchStatus.loading);

    _workoutRepository.setExercisesToWorkout(workoutKey, exercises).then((result) {
      result.fold(
        (failure) => state = state.copyWith(status: FetchStatus.failure),
        (workouts) => state = state.copyWith(status: FetchStatus.success),
      );
    });
  }

  Future<void> addWorkoutToPastCurrentCycle(WorkoutEntity workout) async{
    state = state.copyWith(status: FetchStatus.loading);

    await _workoutRepository.addWorkoutToPastCurrentCycle(workout).then((result) {
      result.fold(
        (failure) => state = state.copyWith(status: FetchStatus.failure),
        (workouts) => state = state.copyWith(status: FetchStatus.success),
      );
    });
  }

  Future<void> addLogsToWorkoutExercises(WorkoutEntity workout, int cycleNum, int dayNum) async{
    state = state.copyWith(status: FetchStatus.loading);

    Map<String, ExerciseEntity> newExercises = {};

    if (workout.exercises != null) {
      for (final exercise in workout.exercises!) {
        if (exercise.isCompleted) {
          final newLog = ExerciseLogEntity(
            sets: exercise.currentSets.values.toList(),
            date: DateTime.now(),
            cycleNum: cycleNum,
            dayNum: dayNum,
          );

          final newExercise = exercise.copyWith(
            logs: [...exercise.logs, newLog],
          ).updateMax();

          newExercises[exercise.key] = newExercise;

         await _workoutRepository.addLogsAndMaxToExercise(exercise.key, newExercise).then((result) {
            result.fold(
              (failure) => state = state.copyWith(status: FetchStatus.failure),
              (success) => state = state.copyWith(status: FetchStatus.success),
            );
          });
        }
      }
    }
  }

  Future<void> completeWorkout(WorkoutEntity workout, int cycleNum, int dayNum) async{
    state = state.copyWith(status: FetchStatus.loading);

    final completeWorkout = workout.setForceComplete(true);

    await addLogsToWorkoutExercises(workout, cycleNum, dayNum);

    if (state.status == FetchStatus.success) {
      state = state.copyWith(status: FetchStatus.loading);
    } else if (state.status == FetchStatus.failure) {
      return;
    }

    await updateWorkout(completeWorkout);

    if (state.status == FetchStatus.success) {
      state = state.copyWith(status: FetchStatus.loading);
    } else if (state.status == FetchStatus.failure) {
      return;
    }

    await addWorkoutToPastCurrentCycle(completeWorkout);
  }
}
