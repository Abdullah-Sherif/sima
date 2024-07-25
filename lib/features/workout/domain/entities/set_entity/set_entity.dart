import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_entity.freezed.dart';
part 'set_entity.g.dart';

@freezed
abstract class SetEntity implements _$SetEntity {
  factory SetEntity.weight({
    required String key,
    required int reps,
    required int weight,
    @Default(false) bool isCompleted,
  }) = _WeightSetEntity;
  factory SetEntity.duration({
    required String key,
    required int durationInSec,
    @Default(false) bool isCompleted,
  }) = _DurationSetEntity;
  factory SetEntity.fromJson(Map<String, dynamic> json) => _$SetEntityFromJson(json);
}

extension SetEntityX on SetEntity {
  bool get isWeightSet => this is _WeightSetEntity;
  bool get isDurationSet => this is _DurationSetEntity;

  int? get reps => isWeightSet ? (this as _WeightSetEntity).reps : null;
  int? get weight => isWeightSet ? (this as _WeightSetEntity).weight : null;

  int? get durationInSec => isDurationSet ? (this as _DurationSetEntity).durationInSec : null;

  SetEntity setCompleted(bool value) {
    return copyWith(isCompleted: value);
  }

  SetEntity setReps(int value) {
    if (isWeightSet) {
      return (this as _WeightSetEntity).copyWith(reps: value);
    }
    return this;
  }

  SetEntity setWeight(int value) {
    if (isWeightSet) {
      return (this as _WeightSetEntity).copyWith(weight: value);
    }
    return this;
  }

  SetEntity setDuration(int value) {
    if (isDurationSet) {
      return (this as _DurationSetEntity).copyWith(durationInSec: value);
    }
    return this;
  }
}
