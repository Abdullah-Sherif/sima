import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/barrel.dart';

import 'fetch_workouts_state.dart';

final fetchWorkoutsControllerProvider = StateNotifierProvider.autoDispose<FetchWorkoutsController, FetchWorkoutsState>((ref) {
  return FetchWorkoutsController(
    const FetchWorkoutsState(),
    ref.watch(workoutRepositoryProvider),
  );
});

class FetchWorkoutsController extends StateNotifier<FetchWorkoutsState> {
  FetchWorkoutsController(FetchWorkoutsState state, this._repository) : super(state);

  final WorkoutRepository _repository;

  StreamSubscription<Map<String, WorkoutEntity>>? _workoutsSubscription;

  void init() {
    _fetchWorkouts();
  }

  void _fetchWorkouts() {
    if (_workoutsSubscription != null) {
      _workoutsSubscription!.cancel();
    }

    state = state.copyWith(status: FetchStatus.loading);

    _workoutsSubscription = _repository.workoutsStream.listen((workouts) {
      state = state.copyWith(workouts: workouts, status: FetchStatus.success);
    });
  }
}
