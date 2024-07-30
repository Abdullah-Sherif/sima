import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/workout/barrel.dart';
import 'package:sima/features/workout/presentation/widgets/custom_create_exercise_dialog.dart';

@RoutePage()
class ExercisesPage extends HookConsumerWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exercises = ref.watch(allexercisesControllerProvider).exercises.values;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            backgroundColor: context.theme.colorScheme.secondary,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CustomCreateExerciseDialog();
                },
              );
            },
            child: Icon(
              Icons.add,
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
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final exercise = exercises.elementAt(index);

                return _CustomExerciseTile(exercise: exercise);
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
  });

  final ExerciseEntity exercise;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: const BoxDecoration(),
        child: TextButton(
          onPressed: () {},
          child: const Text(''),
        ),
      ),
    );
  }
}
