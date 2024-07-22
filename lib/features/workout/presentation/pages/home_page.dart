import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
            child: Placeholder(),
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
