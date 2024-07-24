import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/core/barrel.dart';

part 'exercise_entity.freezed.dart';
part 'exercise_entity.g.dart';

@freezed
class ExerciseEntity with _$ExerciseEntity {
  const factory ExerciseEntity({
    required String name,
    required String description,
    @Default(ExerciseType.reps) ExerciseType type,
    required String key,
    @Default(false) bool forceCompleted,
    @Default(false) bool isActive,
  }) = _ExerciseEntity;

  factory ExerciseEntity.fromJson(Map<String, Object?> json) => _$ExerciseEntityFromJson(json);
}

extension ExerciseEntityX on ExerciseEntity {
  bool get isCompleted => forceCompleted;
  bool get isReps => type == ExerciseType.reps;
  bool get isDuration => type == ExerciseType.duration;

  ExerciseEntity setForceComplete(bool value) {
    return copyWith(forceCompleted: value);
  }

  ExerciseEntity toggleActive() {
    return copyWith(isActive: !isActive);
  }
}
