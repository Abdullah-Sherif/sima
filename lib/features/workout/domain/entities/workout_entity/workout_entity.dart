import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/workout/barrel.dart';

part 'workout_entity.freezed.dart';
part 'workout_entity.g.dart';

@freezed
abstract class WorkoutEntity implements _$WorkoutEntity {
  factory WorkoutEntity.workoutDay({
    @Default(<ExerciseEntity>[]) List<ExerciseEntity> exercises,
    required String name,
  }) = _WorkoutDay;
  const factory WorkoutEntity.breakDay({
    @Default('Break') String name,
  }) = _BreakDay;
  factory WorkoutEntity.fromJson(Map<String, dynamic> json) => _$WorkoutEntityFromJson(json);
}

extension WorkoutEntityX on WorkoutEntity {
  bool get isWorkoutDay => this is _WorkoutDay;
  bool get isBreakDay => this is _BreakDay;
}