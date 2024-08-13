import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/workout/barrel.dart';

part 'workout_entity.freezed.dart';
part 'workout_entity.g.dart';

String _toString(dynamic value) => value.toString();
bool _intToBool(int value) => value == 1;
int _boolToInt(bool value) => value ? 1 : 0;

@Freezed(unionKey: 'type')
abstract class WorkoutEntity with _$WorkoutEntity {
  @FreezedUnionValue('workoutDay')
  factory WorkoutEntity.workoutDay({
    @Default(<String, ExerciseEntity>{}) Map<String, ExerciseEntity> exercises,
    required String name,
    @JsonKey(name: 'id', fromJson: _toString, includeToJson: false) required String key,
    @JsonKey(name: 'force_completed', fromJson: _intToBool, toJson: _boolToInt) @Default(false) bool forceCompleted,
  }) = _WorkoutDay;

  @FreezedUnionValue('restDay')
  const factory WorkoutEntity.restDay({
    @Default('Rest') String name,
    @JsonKey(name: 'id', fromJson: _toString, includeToJson: false) required String key,
  }) = _RestDay;

  factory WorkoutEntity.fromJson(Map<String, dynamic> json) => _$WorkoutEntityFromJson(json);
}

extension WorkoutEntityX on WorkoutEntity {
  bool get isWorkoutDay => this is _WorkoutDay;
  bool get isRestDay => this is _RestDay;

  int get exerciseLength => (this as _WorkoutDay).exercises.length;
  bool get exercisesIsCompleted => isWorkoutDay && (this as _WorkoutDay).exercises.values.every((element) => element.isCompleted);
  bool get isCompleted => isWorkoutDay && ((this as _WorkoutDay).forceCompleted || exercisesIsCompleted);
  bool get isForceCompleted => isWorkoutDay && (this as _WorkoutDay).forceCompleted;

  Iterable<ExerciseEntity>? get exercises => isWorkoutDay ? (this as _WorkoutDay).exercises.values : null;
  Iterable<String>? get exerciseKeys => isWorkoutDay ? (this as _WorkoutDay).exercises.keys : null;

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

  ExerciseEntity? getExerciseByIndex(int index) {
    if (index >= exerciseLength) return null;
    return (this as _WorkoutDay).exercises.values.elementAt(index);
  }

  WorkoutEntity updateExercise(ExerciseEntity exercise) {
    if (isWorkoutDay) {
      final exercises = (this as _WorkoutDay).exercises;
      final newExercises = Map<String, ExerciseEntity>.from(exercises);
      newExercises[exercise.key] = exercise;
      return (this as _WorkoutDay).copyWith(exercises: newExercises);
    }
    return this;
  }

  WorkoutEntity deleteExercise(String exerciseKey) {
    if (isWorkoutDay) {
      final exercises = (this as _WorkoutDay).exercises;
      final newExercises = Map<String, ExerciseEntity>.from(exercises);
      newExercises.remove(exerciseKey);
      return (this as _WorkoutDay).copyWith(exercises: newExercises);
    }
    return this;
  }

  WorkoutEntity changeToWorkoutDay() {
    if (isRestDay) {
      return WorkoutEntity.workoutDay(
        name: (this as _RestDay).name,
        key: (this as _RestDay).key,
      );
    }
    return this;
  }

  WorkoutEntity setExercises(Map<String, ExerciseEntity> exercises) {
    if (isWorkoutDay) {
      return (this as _WorkoutDay).copyWith(exercises: exercises);
    }
    return this;
  }

  WorkoutEntity resetWorkout() {
    if (isWorkoutDay) {
      final exercises = (this as _WorkoutDay).exercises.map((key, value) => MapEntry(key, value.resetAllSets()));
      return (this as _WorkoutDay).copyWith(exercises: exercises, forceCompleted: false);
    }
    return this;
  }
}
