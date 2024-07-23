import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/workout/barrel.dart';

part 'workout_entity.freezed.dart';
part 'workout_entity.g.dart';

@freezed
abstract class WorkoutEntity implements _$WorkoutEntity {
  factory WorkoutEntity.workoutDay({
    @Default(<ExerciseEntity>[]) List<ExerciseEntity> exercises,
    required String name,
    @Default(false) bool forceCompleted,
  }) = _WorkoutDay;
  const factory WorkoutEntity.restDay({
    @Default('Rest') String name,
  }) = _RestDay;
  factory WorkoutEntity.fromJson(Map<String, dynamic> json) => _$WorkoutEntityFromJson(json);
}

extension WorkoutEntityX on WorkoutEntity {
  bool get isWorkoutDay => this is _WorkoutDay;
  bool get isRestDay => this is _RestDay;

  int get exerciseLength => (this as _WorkoutDay).exercises.length;

  bool get isCompleted =>
      isWorkoutDay &&
      ((this as _WorkoutDay).forceCompleted || (this as _WorkoutDay).exercises.every((element) => element.isCompleted));

  WorkoutEntity forceComplete() {
    if (isWorkoutDay) {
      return (this as _WorkoutDay).copyWith(forceCompleted: true);
    }
    return this;
  }

  int getExerciseIndexByKey(String exerciseKey) {
    return (this as _WorkoutDay).exercises.indexWhere((element) => element.key == exerciseKey);
  }

  ExerciseEntity getExerciseByIndex(int index) {
    return (this as _WorkoutDay).exercises[index];
  }

  WorkoutEntity toggleActiveExercise(String exerciseKey) {
    if (isWorkoutDay) {
      final index = getExerciseIndexByKey(exerciseKey);
      final exercises = (this as _WorkoutDay).exercises;
      final exercise = exercises[index];
      final newExercise = exercise.toggleActive();
      final newExercises = List<ExerciseEntity>.from(exercises);
      newExercises[index] = newExercise;
      return (this as _WorkoutDay).copyWith(exercises: newExercises);
    }
    return this;
  }
}
