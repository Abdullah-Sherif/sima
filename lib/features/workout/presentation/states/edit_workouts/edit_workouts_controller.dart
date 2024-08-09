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

  void updateWorkout(WorkoutEntity workout) {
    state = state.copyWith(status: FetchStatus.loading);

    _workoutRepository.updateWorkout(workout.key, workout.toJson()).then((result) {
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
}
