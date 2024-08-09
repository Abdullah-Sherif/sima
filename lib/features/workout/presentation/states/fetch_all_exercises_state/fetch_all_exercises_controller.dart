import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

import 'fetch_all_exercises_state.dart';

final fetchAllExercisesControllerProvider =
    StateNotifierProvider.autoDispose<FetchAllExercisesController, FetchAllExercisesState>((ref) {
  return FetchAllExercisesController(
    const FetchAllExercisesState(),
    ref.watch(workoutRepositoryProvider),
  );
});

class FetchAllExercisesController extends StateNotifier<FetchAllExercisesState> {
  FetchAllExercisesController(
    FetchAllExercisesState state,
    this._repository,
  ) : super(state);

  final WorkoutRepository _repository;

  StreamSubscription<List<ExerciseEntity>>? _allExercisesSubscription;

  void init() {
    _fetchAllExercises();
  }

  void _fetchAllExercises() {
    if (_allExercisesSubscription != null) {
      _allExercisesSubscription!.cancel();
    }

    state = state.copyWith(status: FetchStatus.loading);

    _allExercisesSubscription = _repository.allExercisesStream.listen((exercises) {
      state = state.copyWith(exercises: exercises, status: FetchStatus.success);
    });
  }

  @override
  void dispose() {
    _allExercisesSubscription?.cancel();
    super.dispose();
  }
}
