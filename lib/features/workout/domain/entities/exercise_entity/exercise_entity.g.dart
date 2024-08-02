// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseEntityImpl _$$ExerciseEntityImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseEntityImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      sets: (json['sets'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, SetEntity.fromJson(e as Map<String, dynamic>)),
          ) ??
          const <String, SetEntity>{},
      type: $enumDecodeNullable(_$ExerciseTypeEnumMap, json['type']) ??
          ExerciseType.reps,
      key: json['key'] as String,
      forceCompleted: json['forceCompleted'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? false,
      max: (json['max'] as num?)?.toInt() ?? 10,
      videoPath: json['videoPath'] as String? ?? null,
    );

Map<String, dynamic> _$$ExerciseEntityImplToJson(
        _$ExerciseEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'sets': instance.sets.map((k, e) => MapEntry(k, e.toJson())),
      'type': _$ExerciseTypeEnumMap[instance.type]!,
      'key': instance.key,
      'forceCompleted': instance.forceCompleted,
      'isActive': instance.isActive,
      'max': instance.max,
      'videoPath': instance.videoPath,
    };

const _$ExerciseTypeEnumMap = {
  ExerciseType.reps: 'reps',
  ExerciseType.duration: 'duration',
};
