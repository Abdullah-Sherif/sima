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
      key: _toString(json['id']),
      forceCompleted: json['force_completed'] == null
          ? false
          : _intToBool((json['force_completed'] as num).toInt()),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$WorkoutDayImplToJson(_$WorkoutDayImpl instance) =>
    <String, dynamic>{
      'exercises': instance.exercises.map((k, e) => MapEntry(k, e.toJson())),
      'name': instance.name,
      'force_completed': _boolToInt(instance.forceCompleted),
      'type': instance.$type,
    };

_$RestDayImpl _$$RestDayImplFromJson(Map<String, dynamic> json) =>
    _$RestDayImpl(
      name: json['name'] as String? ?? 'Rest',
      key: _toString(json['id']),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$RestDayImplToJson(_$RestDayImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.$type,
    };
