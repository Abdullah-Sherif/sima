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
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WorkoutDayImplToJson(_$WorkoutDayImpl instance) =>
    <String, dynamic>{
      'exercises': instance.exercises.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'runtimeType': instance.$type,
    };

_$BreakDayImpl _$$BreakDayImplFromJson(Map<String, dynamic> json) =>
    _$BreakDayImpl(
      name: json['name'] as String? ?? 'Break',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BreakDayImplToJson(_$BreakDayImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'runtimeType': instance.$type,
    };
