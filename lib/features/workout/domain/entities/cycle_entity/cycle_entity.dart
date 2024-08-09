import 'dart:convert';
import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/workout/barrel.dart';

part 'cycle_entity.freezed.dart';
part 'cycle_entity.g.dart';

String _toString(dynamic value) => value.toString();
DateTime _getDateTimeFromMillisSinceEpoch(int millis) {
  return DateTime.fromMillisecondsSinceEpoch(millis);
}
String _workoutsToJson(Map<String, WorkoutEntity> workouts) => jsonEncode(workouts);
Map<String, WorkoutEntity> _workoutsFromJson(String json) {
  final Map<String, dynamic> map = jsonDecode(json);
  return map.map((key, value) => MapEntry(key, WorkoutEntity.fromJson(value)));
}
int _getMillisSinceEpochFromDateTime(DateTime dateTime) {
  return dateTime.millisecondsSinceEpoch;
}

@freezed
abstract class CycleEntity implements _$CycleEntity {
  factory CycleEntity({
    @JsonKey(name: 'id', fromJson: _toString, includeToJson: false) required String key,
    @JsonKey(name: 'start_date_mse', fromJson: _getDateTimeFromMillisSinceEpoch, toJson: _getMillisSinceEpochFromDateTime)
    required DateTime startDate,
    @JsonKey(toJson: _workoutsToJson, fromJson: _workoutsFromJson) @Default(<String, WorkoutEntity>{}) Map<String, WorkoutEntity> workouts,
  }) = _CycleEntity;
  factory CycleEntity.fromJson(Map<String, dynamic> json) => _$CycleEntityFromJson(json);
}

extension CycleEntityX on CycleEntity {
  bool get isEmpty => workouts.isEmpty;
  bool get isCompleted => workouts.values.every((element) => element.isCompleted);
}
