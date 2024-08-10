import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

part 'edit_workout_exercise_state.freezed.dart';

@freezed
class EditWorkoutExerciseState with _$EditWorkoutExerciseState {
  const factory EditWorkoutExerciseState({
    @Default(FetchStatus.initial) FetchStatus status,
    ExerciseEntity? activeExercise,
  }) = _EditWorkoutExerciseState;
}