import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/features/barrel.dart';

class HomeListeners extends HookConsumerWidget {
  const HomeListeners({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(fetchCyclesControllerProvider);
    ref.watch(fetchAllExercisesControllerProvider);
    ref.watch(dateControllerProvider);
    ref.watch(workoutRepositoryProvider);
    ref.watch(editWorkoutExerciseControllerProvider);
    ref.watch(editWorkoutsControllerProvider);
    ref.watch(editExercisesControllerProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final currentDate = ref.watch(dateControllerProvider).dateWithOffset;
        ref.read(fetchCyclesControllerProvider.notifier).init(currentDate);
        ref.read(fetchAllExercisesControllerProvider.notifier).init();
        ref.read(workoutRepositoryProvider).initCycles();
      });
      return null;
    }, const []);
    return child;
  }
}
