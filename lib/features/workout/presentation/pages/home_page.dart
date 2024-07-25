import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/barrel.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          WorkoutDayNavBar(),
          SizedBox(height: 15),
          _WorkoutName(),
          SizedBox(height: 15),
          _CustomContainer(
            child: _WorkoutExercises(),
          ),
        ],
      ),
    );
  }
}

class _WorkoutName extends ConsumerWidget {
  const _WorkoutName();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(weekControllerProvider).offset;
    final dayNum = ref.watch(weekControllerProvider.notifier).getCurrentDayNumberWithOffset();

    return Text(
      ref.watch(allcyclesControllerProvider.notifier).getWorkoutName(dayNum),
      style: context.textTheme.titleLarge?.copyWith(fontSize: 50),
    );
  }
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _WorkoutExercises extends ConsumerWidget {
  const _WorkoutExercises();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(weekControllerProvider).offset;
    final cycle = ref.watch(allcyclesControllerProvider).cycle;
    final dayNum = ref.read(weekControllerProvider.notifier).getCurrentDayNumberWithOffset();
    final isRestDay = cycle.workouts.values.elementAt(dayNum - 1).isRestDay;

    return cycle.isEmpty
        ? const Placeholder()
        : isRestDay
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/rest.svg'),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final exercise = cycle.workouts.values.elementAt(dayNum - 1).getExerciseByIndex(index);

                    return Align(
                      alignment: Alignment.center,
                      child: CustomExerciseTile(
                        exerciseKey: exercise!.key,
                        isExpanded: exercise.isActive,
                        onExpand: () {
                          ref
                              .read(allcyclesControllerProvider.notifier)
                              .setIsActiveExercise(dayNum - 1, exercise.key, !exercise.isActive);
                        },
                        width: 380,
                        onCheck: (value) {
                          ref
                              .read(allcyclesControllerProvider.notifier)
                              .setForceCompleteExercise(dayNum - 1, exercise.key, value);
                        },
                        onPlay: () {},
                      ),
                    );
                  },
                  itemCount: cycle.workouts.values.elementAt(dayNum - 1).exerciseLength,
                ),
              );
  }
}
