import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/features/workout/barrel.dart';

import 'all_cycles_state.dart';

final mockCycle = CycleEntity(workouts: {
  '1': WorkoutEntity.workoutDay(
    name: 'Chest',
    key: '1',
    exercises: {
      '1': ExerciseEntity(
          name: 'dumbbelle jrbfruvburvbubvubv',
          description: 'lift heavily towards yourself more text more text more text more text more text more text more text',
          key: '1',
          currentSets: {
            '1': SetEntity.weight(
              key: '1',
              reps: 10,
              weight: 10,
            ),
            '2': SetEntity.weight(
              key: '2',
              reps: 10,
              weight: 10,
            ),
            '3': SetEntity.weight(
              key: '3',
              reps: 10,
              weight: 10,
            ),
            '4': SetEntity.weight(
              key: '4',
              reps: 10,
              weight: 10,
            ),
          }),
      '2': ExerciseEntity(
        name: 'barbell',
        description: 'lift heavily towards yourself',
        key: '2',
        currentSets: {
          '1': SetEntity.weight(
            key: '1',
            reps: 10,
            weight: 10,
          ),
          '2': SetEntity.weight(
            key: '2',
            reps: 10,
            weight: 10,
          ),
        },
      ),
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

  void setFirstExerciseActiveForCurrentDay(int offset, int workoutIndex) {
    if (offset != 0 || state.cycle.isEmpty) return;
    final workout = state.cycle.workouts.values.elementAt(workoutIndex);
    if (workout.isRestDay || workout.exerciseLength == 0) return;
    final exerciseKey = workout.getExerciseByIndex(0);
    setIsActiveExercise(workoutIndex, exerciseKey!.key, true);
  }

  void setIsActiveExercise(int workoutIndex, String exerciseKey, bool value) {
    WorkoutEntity tempWorkout = state.cycle.workouts.values.elementAt(workoutIndex);
    if (state.activeExerciseKey != '' && state.activeExerciseKey != exerciseKey) {
      tempWorkout = tempWorkout.setIsActiveExercise(state.activeExerciseKey, false);
    }
    tempWorkout = tempWorkout.setIsActiveExercise(exerciseKey, value);
    final newCycle = state.cycle.copyWith(workouts: {
      ...state.cycle.workouts,
      tempWorkout.key: tempWorkout,
    });
    state = state.copyWith(cycle: newCycle, activeExerciseKey: exerciseKey);
  }

  void setForceCompleteExercise(int workoutIndex, String exerciseKey, bool? value) {
    if (value == null) return;
    if (value) {
      completeCurrentAndExpandNextExercise(exerciseKey, workoutIndex);
      return;
    }
    final tempWorkout = state.cycle.workouts.values.elementAt(workoutIndex).setForceCompleteExercise(exerciseKey, value);
    final newCycle = state.cycle.copyWith(workouts: {
      ...state.cycle.workouts,
      tempWorkout.key: tempWorkout,
    });
    state = state.copyWith(cycle: newCycle);
  }

  void setSetReps(int reps, String exerciseKey, String setKey, int workoutIndex) {
    final tempWorkout = state.cycle.workouts.values.elementAt(workoutIndex);
    final tempExercise = tempWorkout.getExerciseByKey(exerciseKey);
    if (tempExercise == null) return;
    final tempSet = tempExercise.currentSets[setKey];
    if (tempSet == null) return;
    final newSet = tempSet.setReps(reps);
    final newSets = Map<String, SetEntity>.from(tempExercise.currentSets);
    newSets[setKey] = newSet;
    final newExercise = tempExercise.copyWith(currentSets: newSets);
    final newWorkout = tempWorkout.updateExercise(newExercise);
    final newCycle = state.cycle.copyWith(workouts: {
      ...state.cycle.workouts,
      newWorkout.key: newWorkout,
    });
    state = state.copyWith(cycle: newCycle);
  }

  void setSetWeight(int weight, String exerciseKey, String setKey, int workoutIndex) {
    final tempWorkout = state.cycle.workouts.values.elementAt(workoutIndex);
    final tempExercise = tempWorkout.getExerciseByKey(exerciseKey);
    if (tempExercise == null) return;
    final tempSet = tempExercise.currentSets[setKey];
    if (tempSet == null) return;
    final newSet = tempSet.setWeight(weight);
    final newSets = Map<String, SetEntity>.from(tempExercise.currentSets);
    newSets[setKey] = newSet;
    final newExercise = tempExercise.copyWith(currentSets: newSets);
    final newWorkout = tempWorkout.updateExercise(newExercise);
    final newCycle = state.cycle.copyWith(workouts: {
      ...state.cycle.workouts,
      newWorkout.key: newWorkout,
    });
    state = state.copyWith(cycle: newCycle);
  }

  void setSetIsComplete(int workoutIndex, String exerciseKey, String setKey, bool value) {
    final tempWorkout = state.cycle.workouts.values.elementAt(workoutIndex);
    final tempExercise = tempWorkout.getExerciseByKey(exerciseKey);
    if (tempExercise == null) return;
    final newExercise = tempExercise.setSetIsComplete(value, setKey);
    var newWorkout = tempWorkout.updateExercise(newExercise);
    state = state.copyWith(
        cycle: state.cycle.copyWith(workouts: {
      ...state.cycle.workouts,
      newWorkout.key: newWorkout,
    }));
    if (newExercise.isCompleted) {
      completeCurrentAndExpandNextExercise(exerciseKey, workoutIndex);
    }
  }

  void completeCurrentAndExpandNextExercise(String currentExerciseKey, int workoutIndex) {
    final tempWorkout = state.cycle.workouts.values.elementAt(workoutIndex);
    final currentExercise = tempWorkout.getExerciseByKey(currentExerciseKey);
    if (currentExercise == null) return;
    if (tempWorkout.exerciseKeys!.last == currentExerciseKey) {
      final newWorkout =
          tempWorkout.setForceCompleteExercise(currentExerciseKey, true).setIsActiveExercise(currentExerciseKey, false);
      final newCycle = state.cycle.copyWith(workouts: {
        ...state.cycle.workouts,
        newWorkout.key: newWorkout,
      });
      state = state.copyWith(cycle: newCycle);
    } else {
      final nextExerciseKey =
          tempWorkout.exerciseKeys!.elementAt(tempWorkout.exerciseKeys!.toList().indexOf(currentExerciseKey) + 1);
      setIsActiveExercise(workoutIndex, nextExerciseKey, true);
    }
  }
}
