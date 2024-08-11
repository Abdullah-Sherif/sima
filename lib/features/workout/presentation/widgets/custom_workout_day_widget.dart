import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

class CustomWorkoutDayWidget extends HookConsumerWidget {
  const CustomWorkoutDayWidget({
    super.key,
    required this.dayNum,
    required this.workout,
    required this.isExpanded,
    required this.onExpand,
  });

  final int dayNum;
  final WorkoutEntity workout;
  final bool isExpanded;
  final Function() onExpand;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editWorkoutsStatus = ref.watch(editWorkoutsControllerProvider).status;
    final showExpanded = useState(isExpanded);
    useEffect(() {
      if (isExpanded) {
        showExpanded.value = true;
      } else {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (!context.mounted) return;
          showExpanded.value = false;
        });
      }
      return null;
    }, [isExpanded]);

    useEffect(() {
      if (editWorkoutsStatus == FetchStatus.failure) {
        showSnackbar(context: context, text: context.appTexts.errorOccured);
      }
      return null;
    }, [editWorkoutsStatus]);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: context.percentOfWidth(0.7),
      height: isExpanded ? 400 : 100,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _WorkoutDayAndName(isExpanded: isExpanded, dayNum: dayNum, workout: workout),
                  const Spacer(),
                  _AnimatedExpandedWidgets(
                    isExpanded: isExpanded,
                    onEdit: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return WorkoutDialog(currentWorkout: workout);
                        },
                      );
                    },
                    onDelete: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return WarningDialog(
                            action: context.appTexts.delete,
                            title: workout.name,
                            onConfirm: () {
                              ref.read(editWorkoutsControllerProvider.notifier).deleteWorkout(workout.key);
                            },
                          );
                        },
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomExpandorButton(
                      isExpanded: isExpanded,
                      iconSize: 20,
                      onExpand: onExpand,
                    ),
                  ),
                ],
              ),
            ),
            if (showExpanded.value)
              if (workout.isWorkoutDay)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Text(context.appTexts.exercises, style: context.textTheme.titleMedium?.copyWith(fontSize: 22)),
                        const SizedBox(height: 15),
                        editWorkoutsStatus != FetchStatus.loading
                            ? Expanded(
                                child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    final exercise = workout.exercises!.elementAt(index);

                                    return _CustomExerciseTile(
                                      exercise: exercise,
                                      onDelete: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return WarningDialog(
                                              action: context.appTexts.delete,
                                              title: exercise.name,
                                              onConfirm: () {
                                                ref
                                                    .read(editWorkoutsControllerProvider.notifier)
                                                    .deleteExerciseFromWorkout(workout.key, exercise.key);
                                              },
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                                  itemCount: workout.exercises!.length,
                                ),
                              )
                            : const Center(child: CircularProgressIndicator()),
                        const SizedBox(height: 30),
                        Center(
                          child: CustomTextButton(
                            text: context.appTexts.addExercise,
                            onPressed: () {
                              context.router
                                  .push(ExercisesRoute(workoutKey: workout.key, currentExercises: workout.exercises!.toList()));
                            },
                            width: context.percentOfWidth(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 300,
                    child: SvgPicture.asset('assets/rest.svg'),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class _CustomExerciseTile extends StatelessWidget {
  const _CustomExerciseTile({
    required this.exercise,
    required this.onDelete,
  });

  final ExerciseEntity exercise;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              exercise.name,
              style: context.textTheme.titleMedium?.copyWith(fontSize: 20),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}

class _WorkoutDayAndName extends StatelessWidget {
  const _WorkoutDayAndName({
    required this.isExpanded,
    required this.dayNum,
    required this.workout,
  });

  final bool isExpanded;
  final int dayNum;
  final WorkoutEntity workout;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isExpanded ? context.percentOfWidth(0.4) : context.percentOfWidth(0.7),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(
          begin: 30,
          end: isExpanded ? 25 : 30,
        ),
        duration: const Duration(milliseconds: 300),
        builder: (context, fontSize, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${context.appTexts.day} $dayNum',
                style: context.textTheme.titleLarge?.copyWith(fontSize: fontSize),
              ),
              Text(
                '|',
                style: context.textTheme.titleLarge?.copyWith(fontSize: fontSize),
              ),
              Text(
                workout.name,
                style: context.textTheme.titleLarge?.copyWith(fontSize: fontSize),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AnimatedExpandedWidgets extends StatelessWidget {
  const _AnimatedExpandedWidgets({
    required this.isExpanded,
    required this.onEdit,
    required this.onDelete,
  });
  final bool isExpanded;
  final Function() onEdit;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 48,
      width: isExpanded ? 100 : 0,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isExpanded ? 50 : 160,
            child: IconButton(
              icon: const Icon(Icons.delete),
              iconSize: 27,
              color: Colors.red,
              onPressed: onDelete,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isExpanded ? 0 : 160,
            child: IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.black,
              iconSize: 27,
              onPressed: onEdit,
            ),
          ),
        ],
      ),
    );
  }
}
