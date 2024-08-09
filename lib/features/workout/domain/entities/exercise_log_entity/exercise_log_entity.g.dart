// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_log_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseLogEntityImpl _$$ExerciseLogEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseLogEntityImpl(
      sets: (json['sets'] as List<dynamic>)
          .map((e) => SetEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: _getDateTimeFromMillisSinceEpoch(
          (json['millisSinceEpoch'] as num).toInt()),
      cycleNum: (json['cycleNum'] as num).toInt(),
      dayNum: (json['dayNum'] as num).toInt(),
    );

Map<String, dynamic> _$$ExerciseLogEntityImplToJson(
        _$ExerciseLogEntityImpl instance) =>
    <String, dynamic>{
      'sets': instance.sets.map((e) => e.toJson()).toList(),
      'millisSinceEpoch': instance.date.toIso8601String(),
      'cycleNum': instance.cycleNum,
      'dayNum': instance.dayNum,
    };
