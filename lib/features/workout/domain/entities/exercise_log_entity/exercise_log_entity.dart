import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/workout/barrel.dart';

part 'exercise_log_entity.freezed.dart';
part 'exercise_log_entity.g.dart';

DateTime _getDateTimeFromMillisSinceEpoch(int millis) {
  return DateTime.fromMillisecondsSinceEpoch(millis);
}
int _getMillisSinceEpochFromDateTime(DateTime date) {
  return date.millisecondsSinceEpoch;
}

@freezed
abstract class ExerciseLogEntity implements _$ExerciseLogEntity {
  factory ExerciseLogEntity({
    required List<SetEntity> sets,
    @JsonKey(name: 'millisSinceEpoch', fromJson: _getDateTimeFromMillisSinceEpoch, toJson: _getMillisSinceEpochFromDateTime) required DateTime date,
    required int cycleNum,
    required int dayNum,
  }) = _ExerciseLogEntity;
  factory ExerciseLogEntity.fromJson(Map<String, dynamic> json) => _$ExerciseLogEntityFromJson(json);
}
