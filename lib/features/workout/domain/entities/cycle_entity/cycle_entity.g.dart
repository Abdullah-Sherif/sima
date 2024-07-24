// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CycleEntityImpl _$$CycleEntityImplFromJson(Map<String, dynamic> json) =>
    _$CycleEntityImpl(
      workouts: (json['workouts'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, WorkoutEntity.fromJson(e as Map<String, dynamic>)),
          ) ??
          const <String, WorkoutEntity>{},
    );

Map<String, dynamic> _$$CycleEntityImplToJson(_$CycleEntityImpl instance) =>
    <String, dynamic>{
      'workouts': instance.workouts.map((k, e) => MapEntry(k, e.toJson())),
    };
