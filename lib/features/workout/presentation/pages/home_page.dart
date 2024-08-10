import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const WorkoutDayNavBar(),
            const SizedBox(height: 15),
            _WorkoutName(workout: workout),
            const SizedBox(height: 15),
            const _CustomContainer(
              child: _WorkoutExercises(),
            ),
          ],
        ),
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
  const _WorkoutExercises();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeExerciseKey = ref.watch(editWorkoutExerciseControllerProvider).activeExercise?.key;
    final currentDate = ref.watch(dateControllerProvider).dateWithOffset;
    final currentActiveCycle = ref.watch(fetchCyclesControllerProvider).currentActiveCycle;
    final workout = ref.read(fetchCyclesControllerProvider.notifier).getWorkout(currentDate);
    final isActiveWorkout = ref.watch(fetchCyclesControllerProvider.notifier).isActiveWorkout(currentDate);
    final cycleNum = currentActiveCycle.key;
    final dayNum = DateTime(currentDate.year, currentDate.month, currentDate.day)
        .difference(
            DateTime(currentActiveCycle.startDate.year, currentActiveCycle.startDate.month, currentActiveCycle.startDate.day))
        .inDays;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (isActiveWorkout && activeExerciseKey != null && activeExerciseKey != workout?.exercises?.first.key) {
          ref.read(editWorkoutExerciseControllerProvider.notifier).setExercise(workout?.exercises?.first);
        }
      });
      return null;
    }, [isActiveWorkout]);

    useEffect(() {
      if (workout != null && workout.exerciseKeys != null) {
        for (int i = 0; i < workout.exerciseKeys!.length; i++) {
          if (workout.exerciseKeys?.elementAt(i) == activeExerciseKey) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref.read(editWorkoutExerciseControllerProvider.notifier).setExercise(workout.exercises?.elementAt(i));
            });
          }
        }
      }
      return null;
    }, [workout]);

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
        : workout.isRestDay
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/rest.svg'),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final exercise = workout.getExerciseByIndex(index);

                    return Align(
                      alignment: Alignment.center,
                      child: CustomExerciseTile(
                        exercise: exercise!,
                        isEditable: isActiveWorkout && !workout.isCompleted,
                        isExpanded: exercise.key == activeExerciseKey && isActiveWorkout,
                        onExpand: () {
                          if (ref.watch(editWorkoutExerciseControllerProvider).activeExercise?.key != exercise.key) {
                            ref.read(editWorkoutExerciseControllerProvider.notifier).setExercise(exercise);
                          } else {
                            ref.read(editWorkoutExerciseControllerProvider.notifier).setExercise(null);
                          }
                        },
                        width: 380,
                        onCheck: (value) {
                          if (value == true &&
                              workout.setForceCompleteExercise(exercise.key, value ?? exercise.isCompleted).isCompleted) {
                            showDialog(
                              context: context,
                              builder: (context) => WarningDialog(
                                action: 'complete',
                                title: 'workout',
                                additionalWarning: 'This action is irreversible',
                                onConfirm: () {
                                  ref.read(editWorkoutExerciseControllerProvider.notifier).forceCompleteExercise(true, workout);
                                  ref
                                      .read(editWorkoutsControllerProvider.notifier)
                                      .completeWorkout(workout, int.parse(cycleNum), dayNum);
                                },
                              ),
                            );
                          } else {
                            ref.read(editWorkoutExerciseControllerProvider.notifier).forceCompleteExercise(value, workout);
                          }
                        },
                        onPlay: () {},
                      ),
                    );
                  },
                  itemCount: workout.exerciseLength,
                ),
              );
  }
}
