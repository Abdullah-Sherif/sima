import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

part 'exercise_entity.freezed.dart';
part 'exercise_entity.g.dart';

@freezed
class ExerciseEntity with _$ExerciseEntity {
  const factory ExerciseEntity({
    required String name,
    required String description,
    required String key,
    @Default(<String, SetEntity>{}) Map<String, SetEntity> currentSets,
    @Default(ExerciseType.reps) ExerciseType type,
    @Default(false) bool forceCompleted,
    @Default(false) bool isActive,
    @Default(10) int max,
    @Default(null) String? videoPath,
    @Default(<ExerciseLogEntity>[]) List<ExerciseLogEntity> logs,
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

  ExerciseEntity toggleActive() {
    return copyWith(isActive: !isActive);
  }

  ExerciseEntity setIsActive(bool value) {
    return copyWith(isActive: value);
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
        return copyWith(currentSets: newSets, forceCompleted: true, isActive: false);
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
}
