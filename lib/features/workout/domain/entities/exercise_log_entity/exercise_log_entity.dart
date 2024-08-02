import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/workout/barrel.dart';

part 'exercise_log_entity.freezed.dart';
part 'exercise_log_entity.g.dart';

@freezed
abstract class ExerciseLogEntity implements _$ExerciseLogEntity {
  factory ExerciseLogEntity({
    required List<SetEntity> sets,
    required DateTime date,
    required int cycleNum,
    required int dayNum,
  }) = _ExerciseLogEntity;
  factory ExerciseLogEntity.fromJson(Map<String, dynamic> json) => _$ExerciseLogEntityFromJson(json);
}
