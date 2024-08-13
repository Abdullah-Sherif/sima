import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

import 'fetch_cycles_state.dart';

final initialCycle =
    CycleEntity(key: '', workouts: {}, startDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

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
  StreamSubscription<Map<String, WorkoutEntity>>? _workoutsSubscription;

  void init(DateTime currentDate) async {
    _fetchCurrentCycle();
    await _fetchPastCycles();
    _fetchWorkouts();
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

  Future<void> _fetchPastCycles() async {
    state = state.copyWith(pastCyclesStatus: FetchStatus.loading);

    final result = await _repository.fetchPastCycles();

    result.fold(
      (failure) => state = state.copyWith(pastCyclesStatus: FetchStatus.failure),
      (pastCycles) => state = state.copyWith(pastCycles: pastCycles, pastCyclesStatus: FetchStatus.success),
    );
  }

  void _fetchWorkouts() {
    if (_workoutsSubscription != null) {
      _workoutsSubscription!.cancel();
    }

    state = state.copyWith(fetchWorkoutsStatus: FetchStatus.loading);

    _workoutsSubscription = _repository.workoutsStream.listen((workouts) {
      state = state.copyWith(workouts: workouts, fetchWorkoutsStatus: FetchStatus.success);
    });
  }

  void updateAciveCycle(DateTime currentDate) {
    CycleEntity currentActiveCycle;
    if (state.currentActiveCycle.key == '') {
      if (state.currentCycle.startDate.isBefore(currentDate) || state.currentCycle.startDate.isAtSameMomentAs(currentDate)) {
        currentActiveCycle = state.currentCycle;
      } else {
        currentActiveCycle = state.pastCycles.lastWhere(
            (cycle) => cycle.startDate.isBefore(currentDate) || cycle.startDate.isAtSameMomentAs(currentDate), orElse: () {
          return state.pastCycles.first;
        });
      }
    } else if (state.currentCycle.startDate.isBefore(currentDate) || state.currentCycle.startDate.isAtSameMomentAs(currentDate)) {
      final currentCycleLength = state.currentCycle.workouts.length;
      final diff = currentDate.difference(state.currentCycle.startDate).inDays;
      if (currentCycleLength == 0) {
        currentActiveCycle = state.currentCycle;
      }
      else{final multiplier = diff ~/ currentCycleLength;
      currentActiveCycle = state.currentCycle.copyWith(
        key: (int.parse(state.currentCycle.key) + multiplier).toString(),
        startDate: state.currentCycle.startDate.add(Duration(days: currentCycleLength * multiplier)),
        workouts: multiplier > 0 ? state.workouts : state.currentCycle.workouts,
      );}
    } else {
      currentActiveCycle = state.pastCycles.lastWhere(
          (cycle) => cycle.startDate.isBefore(currentDate) || cycle.startDate.isAtSameMomentAs(currentDate), orElse: () {
        return state.pastCycles.first;
      });
    }

    state = state.copyWith(currentActiveCycle: currentActiveCycle);
  }

  CycleEntity? getCycle(DateTime date) {
    final currentDateOnly = DateTime(date.year, date.month, date.day);
    final currentCycleDateOnly = DateTime(state.currentActiveCycle.startDate.year, state.currentActiveCycle.startDate.month,
        state.currentActiveCycle.startDate.day);
    final diff = currentDateOnly.difference(currentCycleDateOnly).inDays;

    if (diff == 0) {
      return state.currentActiveCycle;
    } else if (diff > 0 && diff < state.currentCycle.workouts.length) {
      return state.currentCycle;
    } else if (diff < 0) {
      final pastCycle = state.pastCycles
          .lastWhere((cycle) => cycle.startDate.isBefore(date) || cycle.startDate.isAtSameMomentAs(date), orElse: () {
        return CycleEntity(key: '', startDate: DateTime.now());
      });
      return pastCycle.key != '' ? pastCycle : null;
    } else {
      return null;
    }
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

  int isActiveWorkout(DateTime currentDate) {
    final dateNow = DateTime.now();
    final currentDateOnly = DateTime(currentDate.year, currentDate.month, currentDate.day);
    final dateNowOnly = DateTime(dateNow.year, dateNow.month, dateNow.day);
    final diff = currentDateOnly.difference(dateNowOnly).inDays;

    if (diff == 0) {
      return 0;
    } else if (diff > 0) {
      return 1;
    } else {
      return -1;
    }
  }

  void addNewCycle() {
    state = state.copyWith(pastCyclesStatus: FetchStatus.loading, currentCycleStatus: FetchStatus.loading);

    _repository
        .addCycle(
      (int.parse(state.currentCycle.key) + 1).toString(),
      (state.currentCycle.startDate.add(Duration(days: state.currentCycle.workouts.length))),
    )
        .then((result) {
      result.fold(
        (failure) {
          state = state.copyWith(pastCyclesStatus: FetchStatus.failure, currentCycleStatus: FetchStatus.failure);
        },
        (success) {
          state = state.copyWith(pastCyclesStatus: FetchStatus.success, currentCycleStatus: FetchStatus.success);
          _fetchPastCycles();
        },
      );
    });
  }

  @override
  void dispose() {
    _currentCycleSubscription?.cancel();
    _workoutsSubscription?.cancel();
    super.dispose();
  }
}
