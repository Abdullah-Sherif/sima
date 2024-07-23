import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/workout/barrel.dart';

part 'cycle_entity.freezed.dart';
part 'cycle_entity.g.dart';

@freezed
abstract class CycleEntity implements _$CycleEntity {
  factory CycleEntity({
    @Default(<WorkoutEntity>[]) List<WorkoutEntity> workouts,
  }) = _CycleEntity;
  factory CycleEntity.fromJson(Map<String, dynamic> json) => _$CycleEntityFromJson(json);
}

extension CycleEntityX on CycleEntity {
  bool get isEmpty => workouts.isEmpty;
}