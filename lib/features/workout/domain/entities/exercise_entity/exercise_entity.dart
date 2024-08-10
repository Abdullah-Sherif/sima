import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

part 'exercise_entity.freezed.dart';
part 'exercise_entity.g.dart';

String _toString(dynamic value) => value.toString();
ExerciseType _intToType(int value) => value == 0 ? ExerciseType.reps : ExerciseType.duration;
int _typeToInt(ExerciseType type) => type == ExerciseType.reps ? 0 : 1;
bool _intToBool(int value) => value == 1;
int _boolToInt(bool value) => value ? 1 : 0;
String _setsToJson(Map<String, SetEntity> sets) => jsonEncode(sets);
Map<String, SetEntity> _setsFromJson(String json) {
  final Map<String, dynamic> map = jsonDecode(json);
  return map.map((key, value) => MapEntry(key, SetEntity.fromJson(value)));
}
String _logsToJson(List<ExerciseLogEntity> logs) => jsonEncode(logs);
List<ExerciseLogEntity> _logsFromJson(String json) {
  final List<dynamic> list = jsonDecode(json);
  return list.map((e) => ExerciseLogEntity.fromJson(e)).toList();
}

@freezed
class ExerciseEntity with _$ExerciseEntity {
  const factory ExerciseEntity({
    required String name,
    required String description,
    @JsonKey(name: 'id', fromJson: _toString, includeToJson: false) required String key,
    @JsonKey(name: 'sets', fromJson: _setsFromJson, toJson: _setsToJson)
    @Default(<String, SetEntity>{})
    Map<String, SetEntity> currentSets,
    @JsonKey(fromJson: _intToType, toJson: _typeToInt) @Default(ExerciseType.reps) ExerciseType type,
    @JsonKey(name: 'force_complete', fromJson: _intToBool, toJson: _boolToInt) @Default(false) bool forceCompleted,
    @Default(10) int max,
    @JsonKey(name: 'video_path') @Default(null) String? videoPath,
    @JsonKey(fromJson: _logsFromJson, toJson: _logsToJson) @Default(<ExerciseLogEntity>[]) List<ExerciseLogEntity> logs,
  }) = _ExerciseEntity;

  factory ExerciseEntity.fromJson(Map<String, Object?> json) => _$ExerciseEntityFromJson(json);
}

extension ExerciseEntityX on ExerciseEntity {
  bool get isCompleted => forceCompleted || (!isEmpty && currentSets.values.every((element) => element.isCompleted));
  bool get isReps => type == ExerciseType.reps;
  bool get isDuration => type == ExerciseType.duration;
  bool get isEmpty => currentSets.isEmpty;

  ExerciseEntity setForceComplete(bool value) {
    return copyWith(forceCompleted: value);
  }

  ExerciseEntity setMax(int value) {
    if (value < max) return this;
    return copyWith(max: value);
  }

  ExerciseEntity setSetIsComplete(bool value, String setKey) {
    final set = currentSets[setKey];
    if (set != null) {
      final newSet = set.setCompleted(value);
      final newSets = Map<String, SetEntity>.from(currentSets);
      newSets[setKey] = newSet;
      if (!value && forceCompleted) {
        return copyWith(currentSets: newSets, forceCompleted: false);
      }
      if (newSets.values.every((element) => element.isCompleted)) {
        return copyWith(currentSets: newSets, forceCompleted: true);
      }
      return copyWith(currentSets: newSets);
    }
    return this;
  }

  ExerciseEntity addCurrentStateToLogs(int cycleNum, int dayNum) {
    final newLogs = List<ExerciseLogEntity>.from(logs);
    newLogs.add(
      ExerciseLogEntity(
        sets: currentSets.values.toList(),
        date: DateTime.now(),
        cycleNum: cycleNum,
        dayNum: dayNum,
      ),
    );
    return copyWith(logs: newLogs);
  }

  ExerciseEntity resetAllSets() {
    final newSets = currentSets.map((key, value) => MapEntry(key, value.setCompleted(false)));
    return copyWith(currentSets: newSets);
  }
}
