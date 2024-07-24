// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetEntityImpl _$$SetEntityImplFromJson(Map<String, dynamic> json) =>
    _$SetEntityImpl(
      key: json['key'] as String,
      reps: (json['reps'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$SetEntityImplToJson(_$SetEntityImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'reps': instance.reps,
      'weight': instance.weight,
      'isCompleted': instance.isCompleted,
    };
