import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

class WorkoutDayNavBar extends ConsumerWidget {
  const WorkoutDayNavBar({super.key, required this.borderColor});

  final Color borderColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycle = ref.watch(fetchCyclesControllerProvider).currentActiveCycle;
    final currentDate = ref.watch(dateControllerProvider).dateWithOffset;
    int dayNum = currentDate.difference(cycle.startDate).inDays + 1;

    if(dayNum > cycle.workouts.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(fetchCyclesControllerProvider.notifier).updateAciveCycle(currentDate);
      });
    }
    

    return cycle.workouts.isNotEmpty
        ? SizedBox(
            width: double.infinity,
            height: 60,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (!(dayNum == 1 && cycle.key == '1')) {
                          ref.read(dateControllerProvider.notifier).decrementDate();
                          final currentDate = ref.watch(dateControllerProvider).dateWithOffset;
                          ref.read(fetchCyclesControllerProvider.notifier).updateAciveCycle(currentDate);
                        }
                      },
                      iconSize: 30,
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Text(
                      '${context.appTexts.cycle} ${cycle.key}',
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      '|',
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge,
                    ),
                    Text(
                      '${context.appTexts.day} $dayNum',
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge,
                    ),
                    IconButton(
                      onPressed: () {
                        ref.read(dateControllerProvider.notifier).incrementDate();
                        final currentDate = ref.watch(dateControllerProvider).dateWithOffset;
                        ref.read(fetchCyclesControllerProvider.notifier).updateAciveCycle(currentDate);
                      },
                      iconSize: 30,
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
