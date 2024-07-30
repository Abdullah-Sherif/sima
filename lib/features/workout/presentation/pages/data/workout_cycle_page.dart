import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/barrel.dart';

@RoutePage(name: 'WorkoutCycleRoute')
class WorkoutCyclePage extends ConsumerWidget {
  const WorkoutCyclePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycle = ref.watch(allcyclesControllerProvider).cycle;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            style: ButtonStyle(iconSize: MaterialStateProperty.all(30)),
          ),
          title: Text(
            context.appTexts.workoutCycle,
            style: context.textTheme.titleLarge?.copyWith(fontSize: 35),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final workout = cycle.workouts.values.elementAt(index);
              return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: _CustomWorkoutDayButton(
                    dayNum: index + 1,
                    workoutName: workout.name,
                    onPressed: () {},
                  ));
            },
            itemCount: cycle.workouts.length,
          ),
        ),
      ),
    );
  }
}

class _CustomWorkoutDayButton extends StatelessWidget {
  const _CustomWorkoutDayButton({
    required this.dayNum,
    required this.workoutName,
    required this.onPressed,
  });

  final int dayNum;
  final String workoutName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.percentOfWidth(0.7),
      height: 100,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.appTexts.day} $dayNum',
                style: context.textTheme.titleLarge?.copyWith(fontSize: 30),
              ),
              Text(
                '|',
                style: context.textTheme.titleLarge?.copyWith(fontSize: 30),
              ),
              Text(
                workoutName,
                style: context.textTheme.titleLarge?.copyWith(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
