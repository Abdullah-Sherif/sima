// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseEntityImpl _$$ExerciseEntityImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseEntityImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      key: _toString(json['id']),
      currentSets: json['sets'] == null
          ? const <String, SetEntity>{}
          : _setsFromJson(json['sets'] as String),
      type: json['type'] == null
          ? ExerciseType.reps
          : _intToType((json['type'] as num).toInt()),
      forceCompleted: json['force_complete'] == null
          ? false
          : _intToBool((json['force_complete'] as num).toInt()),
      max: (json['max'] as num?)?.toInt() ?? 10,
      videoPath: json['video_path'] as String? ?? null,
      logs: json['logs'] == null
          ? const <ExerciseLogEntity>[]
          : _logsFromJson(json['logs'] as String),
    );

Map<String, dynamic> _$$ExerciseEntityImplToJson(
        _$ExerciseEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'sets': _setsToJson(instance.currentSets),
      'type': _typeToInt(instance.type),
      'force_complete': _boolToInt(instance.forceCompleted),
      'max': instance.max,
      'video_path': instance.videoPath,
      'logs': _logsToJson(instance.logs),
    };
