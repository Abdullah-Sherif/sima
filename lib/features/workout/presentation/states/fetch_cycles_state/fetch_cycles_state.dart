import 'package:equatable/equatable.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

class FetchCyclesState extends Equatable {
  const FetchCyclesState({
    required this.currentCycle,
    required this.currentActiveCycle,
    this.pastCycles = const [],
    this.currentCycleStatus = FetchStatus.initial,
    this.pastCyclesStatus = FetchStatus.initial,
    this.fetchWorkoutsStatus = FetchStatus.initial,
    this.workouts = const {},
  });

  final CycleEntity currentCycle;
  final List<CycleEntity> pastCycles;
  final FetchStatus currentCycleStatus;
  final FetchStatus pastCyclesStatus;
  final CycleEntity currentActiveCycle;
  final FetchStatus fetchWorkoutsStatus;
  final Map<String, WorkoutEntity> workouts;

  FetchCyclesState copyWith({
    CycleEntity? currentCycle,
    List<CycleEntity>? pastCycles,
    FetchStatus? currentCycleStatus,
    FetchStatus? pastCyclesStatus,
    CycleEntity? currentActiveCycle,
    FetchStatus? fetchWorkoutsStatus,
    Map<String, WorkoutEntity>? workouts,
  }) {
    return FetchCyclesState(
      currentCycle: currentCycle ?? this.currentCycle,
      pastCycles: pastCycles ?? this.pastCycles,
      currentCycleStatus: currentCycleStatus ?? this.currentCycleStatus,
      pastCyclesStatus: pastCyclesStatus ?? this.pastCyclesStatus,
      currentActiveCycle: currentActiveCycle ?? this.currentActiveCycle,
      fetchWorkoutsStatus: fetchWorkoutsStatus ?? this.fetchWorkoutsStatus,
      workouts: workouts ?? this.workouts,
    );
  }

  @override
  List<Object?> get props =>
      [currentCycle, pastCycles, currentCycleStatus, pastCyclesStatus, currentActiveCycle, fetchWorkoutsStatus, workouts];
}
