import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

class WorkoutDayNavBar extends ConsumerWidget {
  const WorkoutDayNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(weekControllerProvider).weekEntity;
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  ref.read(weekControllerProvider.notifier).decrementOffset();
                },
                iconSize: 30,
                icon: const Icon(Icons.arrow_back),
              ),
              Text(
                '${context.appTexts.cycle} ${ref.read(weekControllerProvider.notifier).getCurrentWeekNumberWithOffset()}',
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge,
              ),
              Text(
                '|',
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge,
              ),
              Text(
                '${context.appTexts.day} ${ref.read(weekControllerProvider.notifier).getCurrentDayNumberWithOffset()}',
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge,
              ),
              IconButton(
                onPressed: () {
                  int offset = ref.read(weekControllerProvider).offset;
                  int dayNum = ref.read(weekControllerProvider.notifier).getCurrentDayNumberWithOffset();

                  ref.read(weekControllerProvider.notifier).incrementOffset();
                  ref.read(allcyclesControllerProvider.notifier).setFirstExerciseActiveForCurrentDay(offset, dayNum - 1);
                },
                iconSize: 30,
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
