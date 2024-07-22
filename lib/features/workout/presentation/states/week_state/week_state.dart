import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/workout/barrel.dart';

part 'week_state.freezed.dart';

@freezed
abstract class WeekState with _$WeekState {
  factory WeekState({
    required WeekEntity weekEntity,
    @Default(0) int offset,
  }) = _WeekState;
}