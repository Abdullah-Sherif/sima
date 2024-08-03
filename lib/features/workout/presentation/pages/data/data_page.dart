import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sima/core/barrel.dart';

@RoutePage()
class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      child: Column(
        children: [
          Text(
            context.appTexts.data,
            style: context.textTheme.titleLarge?.copyWith(fontSize: 60),
          ),
          const SizedBox(height: 30),
          CustomTextButton(
            text: context.appTexts.exercises,
            onPressed: () {
              context.router.push(ExercisesRoute());
            },
            backgroundColor: Colors.transparent,
            textColor: context.theme.colorScheme.secondary,
            textSize: 50,
            height: 300,
            width: context.percentOfWidth(0.85),
            borderColor: Colors.black,
            borderWidth: 3,
            borderRadius: 20,
            svgPath: 'assets/exercise.svg',
            svgWidth: 150,
            svgHeight: 100,
            verticalPadding: 20,
          ),
          const SizedBox(height: 20),
          CustomTextButton(
            text: context.appTexts.workoutCycle,
            onPressed: () {
              context.router.push(const WorkoutCycleRoute());
            },
            backgroundColor: Colors.transparent,
            textColor: context.theme.colorScheme.secondary,
            textSize: 50,
            height: 300,
            width: context.percentOfWidth(0.85),
            borderColor: Colors.black,
            borderWidth: 3,
            borderRadius: 20,
            svgPath: 'assets/calendar.svg',
            svgWidth: 150,
            svgHeight: 100,
            verticalPadding: 20,
            horizontalPadding: 10,
          ),
        ],
      ),
    );
  }
}
