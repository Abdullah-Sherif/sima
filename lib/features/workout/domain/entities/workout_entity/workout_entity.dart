import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/workout/barrel.dart';

part 'workout_entity.freezed.dart';
part 'workout_entity.g.dart';

@freezed
abstract class WorkoutEntity implements _$WorkoutEntity {
  factory WorkoutEntity.workoutDay({
    @Default(<String, ExerciseEntity>{}) Map<String, ExerciseEntity> exercises,
    required String name,
    required String key,
    @Default(false) bool forceCompleted,
  }) = _WorkoutDay;
  const factory WorkoutEntity.restDay({
    @Default('Rest') String name,
    required String key,
  }) = _RestDay;
  factory WorkoutEntity.fromJson(Map<String, dynamic> json) => _$WorkoutEntityFromJson(json);
}

extension WorkoutEntityX on WorkoutEntity {
  bool get isWorkoutDay => this is _WorkoutDay;
  bool get isRestDay => this is _RestDay;

  int get exerciseLength => (this as _WorkoutDay).exercises.length;
  bool get isCompleted =>
      isWorkoutDay &&
      ((this as _WorkoutDay).forceCompleted || (this as _WorkoutDay).exercises.values.every((element) => element.isCompleted));

  WorkoutEntity setForceComplete(bool value) {
    if (isWorkoutDay) {
      return (this as _WorkoutDay).copyWith(forceCompleted: value);
    }
    return this;
  }

  WorkoutEntity setForceCompleteExercise(String exerciseKey, bool value) {
    if (isWorkoutDay) {
      final exercises = (this as _WorkoutDay).exercises;
      final exercise = exercises[exerciseKey];
      final newExercise = exercise?.setForceComplete(value);
      if (newExercise != null) {
        final newExercises = Map<String, ExerciseEntity>.from(exercises);
        newExercises[exerciseKey] = newExercise;
        return (this as _WorkoutDay).copyWith(exercises: newExercises);
      }
    }
    return this;
  }

  ExerciseEntity? getExerciseByKey(String exerciseKey) {
    return (this as _WorkoutDay).exercises[exerciseKey];
  }

  ExerciseEntity getExerciseByIndex(int index) {
    return (this as _WorkoutDay).exercises.values.elementAt(index);
  }

  WorkoutEntity toggleActiveExercise(String exerciseKey) {
    if (isWorkoutDay) {
      final exercises = (this as _WorkoutDay).exercises;
      final exercise = exercises[exerciseKey];
      if (exercise == null) return this;
      final newExercise = exercise.toggleActive();
      final newExercises = Map<String, ExerciseEntity>.from(exercises);
      newExercises[exerciseKey] = newExercise;
      return (this as _WorkoutDay).copyWith(exercises: newExercises);
    }
    return this;
  }
}
