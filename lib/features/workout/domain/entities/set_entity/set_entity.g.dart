// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeightSetEntityImpl _$$WeightSetEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$WeightSetEntityImpl(
      key: json['key'] as String,
      reps: (json['reps'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      isCompleted: json['isCompleted'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WeightSetEntityImplToJson(
        _$WeightSetEntityImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'reps': instance.reps,
      'weight': instance.weight,
      'isCompleted': instance.isCompleted,
      'runtimeType': instance.$type,
    };

_$DurationSetEntityImpl _$$DurationSetEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$DurationSetEntityImpl(
      key: json['key'] as String,
      durationInSec: (json['durationInSec'] as num).toInt(),
      isCompleted: json['isCompleted'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DurationSetEntityImplToJson(
        _$DurationSetEntityImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'durationInSec': instance.durationInSec,
      'isCompleted': instance.isCompleted,
      'runtimeType': instance.$type,
    };
