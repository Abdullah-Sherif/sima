import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/barrel.dart';

class HomeListeners extends HookConsumerWidget {
  const HomeListeners({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(true);

    ref.watch(fetchCyclesControllerProvider);
    ref.watch(fetchAllExercisesControllerProvider);
    ref.watch(dateControllerProvider);
    ref.watch(workoutRepositoryProvider);
    ref.watch(editWorkoutExerciseControllerProvider);
    ref.watch(editWorkoutsControllerProvider);
    ref.watch(editExercisesControllerProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.invalidate(workoutRepositoryProvider);
        final currentDate = ref.watch(dateControllerProvider).dateWithOffset;

        await ref.read(workoutRepositoryProvider).initCycles();
        ref.read(fetchCyclesControllerProvider.notifier).init(currentDate);
        ref.read(fetchAllExercisesControllerProvider.notifier).init();

        final workout = ref.read(fetchCyclesControllerProvider.notifier).getWorkout(currentDate);
        final isActiveWorkout = ref.read(fetchCyclesControllerProvider.notifier).isActiveWorkout(currentDate);
        ref.read(editWorkoutExerciseControllerProvider.notifier).init(isActiveWorkout == 0, workout);
      });
      return null;
    }, const []);

    final currentDate = ref.watch(dateControllerProvider).currentDate;
    final currentCycle = ref.watch(fetchCyclesControllerProvider).currentCycle;
    final currentFetchStatus = ref.watch(fetchCyclesControllerProvider).currentCycleStatus;

    useEffect(() {
      Future<void> checkAndCompletePreviousWorkout(DateTime date) async {
        final currentTrimmedDate = DateTime(date.year, date.month, date.day);
        final previousDate = currentTrimmedDate.subtract(const Duration(days: 1));
        CycleEntity? cycle = currentCycle;
        WorkoutEntity? previousWorkout = ref.read(fetchCyclesControllerProvider.notifier).getWorkout(previousDate);

        if (previousWorkout == null) {
          // If the current date is the start date of the current cycle, return
          if (currentTrimmedDate.difference(currentCycle.startDate).inDays <= 0) {
            return;
          }
          // Recursively call the function with the previous date
          checkAndCompletePreviousWorkout(previousDate);
          // Fetch the cycle for the previous date
          cycle = ref.read(fetchCyclesControllerProvider.notifier).getCycle(previousDate);
          if (cycle == null) {
            return;
          }
          // Calculate the workout index and fetch the workout
          final workoutIndex = previousDate.difference(cycle.startDate).inDays;
          if (workoutIndex >= 0 && workoutIndex < cycle.workouts.length) {
            previousWorkout = cycle.workouts.values.elementAt(workoutIndex);
          } else {
            return;
          }
        }

        final cycleNum = cycle.key;
        final dayNum = previousDate.difference(cycle.startDate).inDays + 1;

        if (!previousWorkout.isCompleted) {
          // Complete the workout
          await ref.read(editWorkoutsControllerProvider.notifier).completeWorkout(previousWorkout, int.parse(cycleNum), dayNum);
          // Recursively call the function with the previous date
          await checkAndCompletePreviousWorkout(previousDate);
        }
        // If the current date is beyond the last workout, add a new cycle
        if (currentTrimmedDate.difference(currentCycle.startDate).inDays >= currentCycle.workouts.length) {
          ref.read(fetchCyclesControllerProvider.notifier).addNewCycle();
        }
      }

      if (currentFetchStatus == FetchStatus.success && currentCycle.key != '') {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          checkAndCompletePreviousWorkout(currentDate);
        });
      }

      return null;
    }, [currentDate, currentFetchStatus]);

    final fetchStatus = currentFetchStatus == FetchStatus.success &&
        ref.watch(fetchCyclesControllerProvider).fetchWorkoutsStatus == FetchStatus.success &&
        ref.watch(fetchAllExercisesControllerProvider).status == FetchStatus.success;

    useEffect(() {
      if (fetchStatus && isLoading.value) {
        isLoading.value = false;
      }
      return null;
    }, [fetchStatus]);

    return isLoading.value ? const SafeArea(child: Scaffold(body: Center(child: CircularProgressIndicator()))) : child;
  }
}
