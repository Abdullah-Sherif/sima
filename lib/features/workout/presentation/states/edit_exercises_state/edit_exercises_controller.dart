import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

import 'edit_exercises_state.dart';

final editExercisesControllerProvider = StateNotifierProvider.autoDispose<EditExercisesController, EditExercisesState>((ref) {
  return EditExercisesController(
    const EditExercisesState(),
    ref.watch(workoutRepositoryProvider),
  );
});

class EditExercisesController extends StateNotifier<EditExercisesState> {
  EditExercisesController(EditExercisesState state, this._workoutRepository) : super(state);

  final WorkoutRepository _workoutRepository;

  void addExercise(ExerciseEntity exercise) {
    state = state.copyWith(status: FetchStatus.loading);

    _workoutRepository.addExercise(exercise).then((result) {
      result.fold(
        (failure) => state = state.copyWith(status: FetchStatus.failure),
        (exercises) => state = state.copyWith(status: FetchStatus.success),
      );
    });
  }

  void updateExercise(ExerciseEntity exercise) {
    state = state.copyWith(status: FetchStatus.loading);

    _workoutRepository.updateExercise(exercise.key, exercise.toJson()).then((result) {
      result.fold(
        (failure) => state = state.copyWith(status: FetchStatus.failure),
        (exercises) => state = state.copyWith(status: FetchStatus.success),
      );
    });
  }

  void deleteExercise(String key) {
    state = state.copyWith(status: FetchStatus.loading);

    _workoutRepository.deleteExercise(key).then((result) {
      result.fold(
        (failure) => state = state.copyWith(status: FetchStatus.failure),
        (exercises) => state = state.copyWith(status: FetchStatus.success),
      );
    });
  }
}
