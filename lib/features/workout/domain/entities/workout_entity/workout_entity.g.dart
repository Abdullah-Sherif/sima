// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutDayImpl _$$WorkoutDayImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutDayImpl(
      exercises: (json['exercises'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, ExerciseEntity.fromJson(e as Map<String, dynamic>)),
          ) ??
          const <String, ExerciseEntity>{},
      name: json['name'] as String,
      key: json['key'] as String,
      forceCompleted: json['forceCompleted'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WorkoutDayImplToJson(_$WorkoutDayImpl instance) =>
    <String, dynamic>{
      'exercises': instance.exercises.map((k, e) => MapEntry(k, e.toJson())),
      'name': instance.name,
      'key': instance.key,
      'forceCompleted': instance.forceCompleted,
      'runtimeType': instance.$type,
    };

_$RestDayImpl _$$RestDayImplFromJson(Map<String, dynamic> json) =>
    _$RestDayImpl(
      name: json['name'] as String? ?? 'Rest',
      key: json['key'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RestDayImplToJson(_$RestDayImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'runtimeType': instance.$type,
    };
