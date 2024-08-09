// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CycleEntityImpl _$$CycleEntityImplFromJson(Map<String, dynamic> json) =>
    _$CycleEntityImpl(
      key: _toString(json['id']),
      startDate: _getDateTimeFromMillisSinceEpoch(
          (json['start_date_mse'] as num).toInt()),
      workouts: json['workouts'] == null
          ? const <String, WorkoutEntity>{}
          : _workoutsFromJson(json['workouts'] as String),
    );

Map<String, dynamic> _$$CycleEntityImplToJson(_$CycleEntityImpl instance) =>
    <String, dynamic>{
      'start_date_mse': _getMillisSinceEpochFromDateTime(instance.startDate),
      'workouts': _workoutsToJson(instance.workouts),
    };
