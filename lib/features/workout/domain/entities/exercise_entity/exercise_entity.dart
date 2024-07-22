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
  }) = _ExerciseEntity;

  factory ExerciseEntity.fromJson(Map<String, Object?> json) => _$ExerciseEntityFromJson(json);
}
