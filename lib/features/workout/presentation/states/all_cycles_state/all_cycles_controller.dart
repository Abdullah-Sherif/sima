import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/features/workout/barrel.dart';

import 'all_cycles_state.dart';

final mockCycle = CycleEntity(workouts: {
  '1': WorkoutEntity.workoutDay(
    name: 'Chest',
    key: '1',
    exercises: {
      '1': const ExerciseEntity(name: 'dumbbelle', description: 'lift heavily towards yourself', key: '1'),
    },
  ),
  '2': const WorkoutEntity.restDay(key: '2'),
  '3': WorkoutEntity.workoutDay(name: 'Back', key: '3'),
  '4': const WorkoutEntity.restDay(key: '4'),
  '5': const WorkoutEntity.restDay(key: '5'),
  '6': WorkoutEntity.workoutDay(name: 'Legs', key: '6'),
  '7': const WorkoutEntity.restDay(key: '7'),
});

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
    return state.cycle.workouts.values.elementAt(dayNum - 1).name;
  }

  void activateExercise(int workoutIndex, String exerciseKey) {
    WorkoutEntity tempWorkout = state.cycle.workouts.values.elementAt(workoutIndex);
    if (state.activeExerciseKey != '' && state.activeExerciseKey != exerciseKey) {
      tempWorkout = tempWorkout.toggleActiveExercise(state.activeExerciseKey);
    }
    tempWorkout = tempWorkout.toggleActiveExercise(exerciseKey);
    final newCycle = state.cycle.copyWith(workouts: {
      ...state.cycle.workouts,
      tempWorkout.key: tempWorkout,
    });
    state = state.copyWith(cycle: newCycle, activeExerciseKey: exerciseKey);
  }

  void setForceCompleteExercise(int workoutIndex, String exerciseKey, bool? value) {
    if (value == null) return;
    final tempWorkout = state.cycle.workouts.values.elementAt(workoutIndex).setForceCompleteExercise(exerciseKey, value);
    final newCycle = state.cycle.copyWith(workouts: {
      ...state.cycle.workouts,
      tempWorkout.key: tempWorkout,
    });
    state = state.copyWith(cycle: newCycle);
  }
}
