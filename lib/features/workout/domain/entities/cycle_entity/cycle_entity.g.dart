// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CycleEntityImpl _$$CycleEntityImplFromJson(Map<String, dynamic> json) =>
    _$CycleEntityImpl(
      workouts: (json['workouts'] as List<dynamic>?)
              ?.map((e) => WorkoutEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <WorkoutEntity>[],
    );

Map<String, dynamic> _$$CycleEntityImplToJson(_$CycleEntityImpl instance) =>
    <String, dynamic>{
      'workouts': instance.workouts.map((e) => e.toJson()).toList(),
    };
