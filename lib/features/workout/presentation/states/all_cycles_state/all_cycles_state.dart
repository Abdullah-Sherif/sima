import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sima/features/workout/barrel.dart';

part 'all_cycles_state.freezed.dart';


@freezed
abstract class AllCyclesState with _$AllCyclesState {
  factory AllCyclesState({
    required CycleEntity cycle,
  }) = _AllCyclesState;
}