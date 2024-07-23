import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/features/workout/barrel.dart';

import 'all_cycles_state.dart';

final mockCycle = CycleEntity(workouts: [
  WorkoutEntity.workoutDay(
    name: 'Chest',
    exercises: [
      const ExerciseEntity(name: 'dumbbelle', description: 'lift heavily towards yourself', key: '1'),
    ],
  ),
  const WorkoutEntity.restDay(),
  WorkoutEntity.workoutDay(name: 'Back'),
  const WorkoutEntity.restDay(),
  const WorkoutEntity.restDay(),
  WorkoutEntity.workoutDay(name: 'Legs'),
  const WorkoutEntity.restDay(),
]);

final allcyclesControllerProvider = StateNotifierProvider.autoDispose<AllCyclesController, AllCyclesState>((ref) {
  return AllCyclesController(
    AllCyclesState(cycle: mockCycle),
  );
});

class AllCyclesController extends StateNotifier<AllCyclesState> {
  AllCyclesController(
    AllCyclesState state,
  ) : super(state);

  String getWorkoutName(int dayNum) {
    if (state.cycle.isEmpty) return 'Empty';
    return state.cycle.workouts[dayNum - 1].name;
  }

  void activateExercise(int workoutIndex, String exerciseKey) {
    WorkoutEntity tempWorkout = state.cycle.workouts[workoutIndex];
    if (state.activeExerciseKey != '' && state.activeExerciseKey != exerciseKey) {
      tempWorkout = tempWorkout.toggleActiveExercise(state.activeExerciseKey);
    }
    tempWorkout = tempWorkout.toggleActiveExercise(exerciseKey);
    final newCycle = state.cycle.copyWith(workouts: [
      ...state.cycle.workouts.sublist(0, workoutIndex),
      tempWorkout,
      ...state.cycle.workouts.sublist(workoutIndex + 1),
    ]);
    state = state.copyWith(cycle: newCycle, activeExerciseKey: exerciseKey);
  }
}
