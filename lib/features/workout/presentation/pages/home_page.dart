import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/barrel.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentDate = ref.watch(dateControllerProvider).dateWithOffset;

    final workout = ref.watch(fetchCyclesControllerProvider.notifier).getWorkout(currentDate);

    bool isActiveWorkout = false;
    if (currentDate.isAtSameMomentAs(DateTime.now())) {
      isActiveWorkout = true;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const WorkoutDayNavBar(),
          const SizedBox(height: 15),
          _WorkoutName(workout: workout),
          const SizedBox(height: 15),
          _CustomContainer(
            child: _WorkoutExercises(workout, isActiveWorkout),
          ),
        ],
      ),
    );
  }
}

class _WorkoutName extends StatelessWidget {
  const _WorkoutName({required this.workout});

  final WorkoutEntity? workout;

  @override
  Widget build(BuildContext context) {
    return Text(
      workout?.name ?? 'Empty',
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

class _WorkoutExercises extends HookConsumerWidget {
  const _WorkoutExercises(this.workout, this.isActiveWorkout);

  final WorkoutEntity? workout;
  final bool isActiveWorkout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(editWorkoutExerciseControllerProvider.notifier).setExercise(isActiveWorkout ? workout?.exercises?.first : null);
    });
    final activeExerciseKey = ref.watch(editWorkoutExerciseControllerProvider).activeExercise?.key;

    return workout == null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                context.appTexts.homeEmptyMessage,
                style: context.textTheme.titleLarge?.copyWith(fontSize: 40, letterSpacing: 2),
              ),
            ),
          )
        : workout!.isRestDay
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/rest.svg'),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final exercise = workout!.getExerciseByIndex(index);

                    return Align(
                      alignment: Alignment.center,
                      child: CustomExerciseTile(
                        exercise: exercise!,
                        isEditable: isActiveWorkout,
                        isExpanded: exercise.key == activeExerciseKey,
                        onExpand: () {
                          ref.read(editWorkoutExerciseControllerProvider.notifier).setExercise(exercise);
                        },
                        width: 380,
                        onCheck: (value) {
                          ref.read(editWorkoutExerciseControllerProvider.notifier).forceCompleteExercise(value, workout!.key);
                        },
                        onPlay: () {},
                      ),
                    );
                  },
                  itemCount: workout!.exerciseLength,
                ),
              );
  }
}
