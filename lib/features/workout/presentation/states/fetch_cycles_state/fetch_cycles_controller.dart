import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

import 'fetch_cycles_state.dart';

final initialCycle = CycleEntity(key: '', workouts: {}, startDate: DateTime.now());

final fetchCyclesControllerProvider = StateNotifierProvider.autoDispose<FetchCyclesController, FetchCyclesState>((ref) {
  return FetchCyclesController(
    FetchCyclesState(currentCycle: initialCycle, currentActiveCycle: initialCycle),
    ref.watch(workoutRepositoryProvider),
  );
});

class FetchCyclesController extends StateNotifier<FetchCyclesState> {
  FetchCyclesController(
    FetchCyclesState state,
    this._repository,
  ) : super(state);

  final WorkoutRepository _repository;

  StreamSubscription<CycleEntity>? _currentCycleSubscription;

  void init(DateTime currentDate) {
    _fetchCurrentCycle();
    _fetchPastCycles();
    updateAciveCycle(currentDate);
  }

  void _fetchCurrentCycle() {
    if (_currentCycleSubscription != null) {
      _currentCycleSubscription!.cancel();
    }

    state = state.copyWith(currentCycleStatus: FetchStatus.loading);

    _currentCycleSubscription = _repository.currentCycleStream.listen((cycle) {
      state = state.copyWith(currentCycle: cycle, currentCycleStatus: FetchStatus.success);
      refreshActiveCycle();
    });
  }

  void _fetchPastCycles() async {
    state = state.copyWith(pastCyclesStatus: FetchStatus.loading);

    final result = await _repository.fetchPastCycles();

    result.fold(
      (failure) => state = state.copyWith(pastCyclesStatus: FetchStatus.failure),
      (pastCycles) => state = state.copyWith(pastCycles: pastCycles, pastCyclesStatus: FetchStatus.success),
    );
  }

  void updateAciveCycle(DateTime currentDate) {
    CycleEntity currentActiveCycle;
    if (state.currentActiveCycle.key == '') {
      currentActiveCycle = state.currentCycle;
    } else if (state.currentCycle.startDate.isBefore(currentDate) || state.currentCycle.startDate.isAtSameMomentAs(currentDate)) {
      final currentCycleLength = state.currentCycle.workouts.length;
      final diff = currentDate.difference(state.currentActiveCycle.startDate).inDays;
      if (diff >= currentCycleLength) {
        currentActiveCycle = state.currentCycle.copyWith(
          key: (int.parse(state.currentActiveCycle.key) + 1).toString(),
          startDate: state.currentActiveCycle.startDate.add(Duration(days: currentCycleLength)),
        );
      } else if (diff < 0) {
        currentActiveCycle = state.currentCycle.copyWith(
          key: (int.parse(state.currentActiveCycle.key) - 1).toString(),
          startDate: state.currentActiveCycle.startDate.subtract(Duration(days: currentCycleLength)),
        );
      } else if (int.parse(state.currentActiveCycle.key) < int.parse(state.currentCycle.key)) {
        currentActiveCycle = state.currentCycle;
      } else {
        currentActiveCycle =
            state.currentCycle.copyWith(key: state.currentActiveCycle.key, startDate: state.currentActiveCycle.startDate);
      }
    } else {
      currentActiveCycle = state.pastCycles.lastWhere(
          (cycle) => cycle.startDate.isBefore(currentDate) || cycle.startDate.isAtSameMomentAs(currentDate), orElse: () {
        return state.currentCycle;
      });
    }

    state = state.copyWith(currentActiveCycle: currentActiveCycle);
  }

  void refreshActiveCycle() {
    updateAciveCycle(state.currentActiveCycle.startDate);
  }

  WorkoutEntity? getWorkout(DateTime currentDate) {
    int workoutIndex = currentDate.difference(state.currentActiveCycle.startDate).inDays;
    if (workoutIndex < 0) {
      return null;
    }
    final workouts = state.currentActiveCycle.workouts;
    if (workouts.length > workoutIndex) {
      return workouts.values.elementAt(workoutIndex);
    } else {
      return null;
    }
  }

  bool isActiveWorkout(DateTime currentDate) {
    final dateNow = DateTime.now();
    final currentDateOnly = DateTime(currentDate.year, currentDate.month, currentDate.day);
    final dateNowOnly = DateTime(dateNow.year, dateNow.month, dateNow.day);
    final diff = currentDateOnly.difference(dateNowOnly).inDays;

    return diff == 0;
  }

  void addNewCycle() {
    state = state.copyWith(pastCyclesStatus: FetchStatus.loading, currentCycleStatus: FetchStatus.loading);

    final newCycle = CycleEntity(
      key: (int.parse(state.currentCycle.key) + 1).toString(),
      startDate: state.currentCycle.startDate.add(Duration(days: state.currentCycle.workouts.length)),
    );

    final workouts = state.currentCycle.workouts;

    final resetWorkouts = workouts.map((key, value) {
      WorkoutEntity newWorkout = value.setForceComplete(false);

      if (newWorkout.exercises != null) {
        final newExercises = {for (var exercise in value.exercises!) exercise.key: exercise.resetAllSets()};

        newWorkout = newWorkout.setExercises(newExercises);
      }

      return MapEntry(newWorkout.key, newWorkout);
    });
    final newCycleWithWorkouts = newCycle.copyWith(workouts: resetWorkouts);

    _repository.addCycle(newCycleWithWorkouts).then((result) {
      result.fold(
        (failure) {
          state = state.copyWith(pastCyclesStatus: FetchStatus.failure, currentCycleStatus: FetchStatus.failure);
        },
        (success) {
          state = state.copyWith(pastCyclesStatus: FetchStatus.success, currentCycleStatus: FetchStatus.success);
        },
      );
    });

    if(state.pastCyclesStatus == FetchStatus.success){
      _fetchPastCycles();
    }
  }

  @override
  void dispose() {
    _currentCycleSubscription?.cancel();
    super.dispose();
  }
}
