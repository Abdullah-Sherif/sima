import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_entity.freezed.dart';
part 'set_entity.g.dart';

@freezed
abstract class SetEntity implements _$SetEntity {
  factory SetEntity({
    required String key,
    required int reps,
    required int weight,
    @Default(false) bool isCompleted,
  }) = _SetEntity;
  factory SetEntity.fromJson(Map<String, dynamic> json) => _$SetEntityFromJson(json);
}

extension SetEntityX on SetEntity {
  SetEntity setCompleted(bool value) {
    return copyWith(isCompleted: value);
  }
}
