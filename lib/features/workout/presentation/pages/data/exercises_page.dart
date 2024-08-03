import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';

@RoutePage()
class ExercisesPage extends HookConsumerWidget {
  const ExercisesPage({super.key, this.currentExercises, this.workoutIndex});

  final List<ExerciseEntity>? currentExercises;
  final int? workoutIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = currentExercises != null;
    final exercises = ref.watch(allexercisesControllerProvider).exercises.values;
    final selectedExercises =
        isEditing ? useState(List.generate(currentExercises!.length, (index) => currentExercises![index])) : null;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor: context.theme.colorScheme.secondary,
            onPressed: () {
              if (isEditing) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return WarningDialog(
                        action: context.appTexts.add.toLowerCase(),
                        title: context.appTexts.exercises.toLowerCase(),
                        onConfirm: () {
                          ref
                              .read(allcyclesControllerProvider.notifier)
                              .setWorkoutExercises(workoutIndex!, selectedExercises!.value);
                          Navigator.of(context).pop();
                        });
                  },
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const CustomCreateExerciseDialog();
                  },
                );
              }
            },
            child: Icon(
              isEditing ? Icons.check : Icons.add,
              color: context.theme.colorScheme.background,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          leading: BackButton(
            style: ButtonStyle(iconSize: MaterialStateProperty.all(30)),
          ),
          title: Text(
            context.appTexts.exercises,
            style: context.textTheme.titleLarge?.copyWith(fontSize: 35),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final exercise = exercises.elementAt(index);

                return Column(
                  children: [
                    if (index != 0) const SizedBox(height: 10),
                    _CustomExerciseTile(exercise: exercise, isEditing: isEditing, selectedExercises: selectedExercises),
                  ],
                );
              },
              itemCount: exercises.length,
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomExerciseTile extends StatelessWidget {
  const _CustomExerciseTile({
    required this.exercise,
    required this.isEditing,
    this.selectedExercises,
  });

  final ExerciseEntity exercise;
  final bool isEditing;
  final ValueNotifier<List<ExerciseEntity>>? selectedExercises;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: FittedBox(
        fit: BoxFit.contain,
        child: TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size(
                context.percentOfWidth(0.8),
                75,
              ),
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            )),
            backgroundColor: MaterialStateProperty.all(
              isEditing && selectedExercises!.value.contains(exercise) ? context.theme.colorScheme.primary : Colors.transparent,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.black, width: 2),
              ),
            ),
          ),
          onPressed: () {
            if (isEditing) {
              if (!selectedExercises!.value.contains(exercise)) {
                selectedExercises!.value = [...selectedExercises!.value, exercise];
              } else {
                final newExercises = selectedExercises!.value.where((element) => element.key != exercise.key).toList();
                selectedExercises!.value = newExercises;
              }
            } else {
              context.router.push(
                ExerciseDetailRoute(
                  exerciseKey: exercise.key,
                ),
              );
            }
          },
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: context.textTheme.titleMedium,
                ),
                Text(
                  exercise.description,
                  style: context.textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
