import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/features/workout/barrel.dart';

import 'all_cycles_state.dart';

final mockCycle = CycleEntity(workouts: [
  WorkoutEntity.workoutDay(name: 'Chest'),
  const WorkoutEntity.breakDay(),
  WorkoutEntity.workoutDay(name: 'Back'),
  const WorkoutEntity.breakDay(),
  const WorkoutEntity.breakDay(),
  WorkoutEntity.workoutDay(name: 'Legs'),
  const WorkoutEntity.breakDay(),
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
    return state.cycle.workouts[dayNum - 1].name;
  }
}
