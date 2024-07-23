// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkoutDayImpl _$$WorkoutDayImplFromJson(Map<String, dynamic> json) =>
    _$WorkoutDayImpl(
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => ExerciseEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ExerciseEntity>[],
      name: json['name'] as String,
      forceCompleted: json['forceCompleted'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WorkoutDayImplToJson(_$WorkoutDayImpl instance) =>
    <String, dynamic>{
      'exercises': instance.exercises.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'forceCompleted': instance.forceCompleted,
      'runtimeType': instance.$type,
    };

_$RestDayImpl _$$RestDayImplFromJson(Map<String, dynamic> json) =>
    _$RestDayImpl(
      name: json['name'] as String? ?? 'Rest',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RestDayImplToJson(_$RestDayImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'runtimeType': instance.$type,
    };
