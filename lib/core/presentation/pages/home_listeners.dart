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
    ref.watch(fetchWorkoutsControllerProvider);
    ref.watch(dateControllerProvider);
    ref.watch(workoutRepositoryProvider);
    ref.watch(editWorkoutExerciseControllerProvider);
    ref.watch(editWorkoutsControllerProvider);
    ref.watch(editExercisesControllerProvider);

    useEffect((){
      WidgetsBinding.instance.addPostFrameCallback((_) async{
        ref.invalidate(workoutRepositoryProvider);

        final currentDate = ref.watch(dateControllerProvider).dateWithOffset;
        await ref.read(workoutRepositoryProvider).initCycles();
        ref.read(fetchCyclesControllerProvider.notifier).init(currentDate);
        ref.read(fetchAllExercisesControllerProvider.notifier).init();
        ref.read(fetchWorkoutsControllerProvider.notifier).init();

        final workout = ref.read(fetchCyclesControllerProvider.notifier).getWorkout(currentDate);
        final isActiveWorkout = ref.read(fetchCyclesControllerProvider.notifier).isActiveWorkout(currentDate);
        ref.read(editWorkoutExerciseControllerProvider.notifier).init(isActiveWorkout == 0, workout);
      });
      return null;
    }, const []);

    final currentDate = ref.watch(dateControllerProvider).currentDate;
    final currentCycle = ref.watch(fetchCyclesControllerProvider).currentCycle;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final currentTrimmedDate = DateTime(currentDate.year, currentDate.month, currentDate.day);
        final previousDate = currentTrimmedDate.subtract(const Duration(days: 1));
        final currentCycleDate = DateTime(currentCycle.startDate.year, currentCycle.startDate.month, currentCycle.startDate.day);

        final previousWorkout = ref.read(fetchCyclesControllerProvider.notifier).getWorkout(previousDate);
        final cycleNum = ref.watch(fetchCyclesControllerProvider).currentCycle.key;
        final dayNum = previousDate.difference(currentCycleDate).inDays;
        if (previousWorkout != null && !previousWorkout.isCompleted) {
          ref.read(editWorkoutsControllerProvider.notifier).completeWorkout(previousWorkout, int.parse(cycleNum), dayNum);

          if (currentTrimmedDate.difference(currentCycleDate).inDays > currentCycle.workouts.length) {
            ref.read(fetchCyclesControllerProvider.notifier).addNewCycle();
          }
        }
      });

      return null;
    }, [currentDate]);

    final fetchStatus = ref.watch(fetchCyclesControllerProvider).currentCycleStatus == FetchStatus.success &&
        ref.watch(fetchWorkoutsControllerProvider).status == FetchStatus.success &&
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
