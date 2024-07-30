import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/workout/barrel.dart';

part 'all_exercises_state.freezed.dart';

@freezed
abstract class AllExercisesState with _$AllExercisesState {
  factory AllExercisesState({
    @Default(<String, ExerciseEntity>{}) Map<String, ExerciseEntity> exercises,
  }) = _AllExercisesState;
}