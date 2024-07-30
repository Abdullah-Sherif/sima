import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'ExerciseDetailRoute')
class ExerciseDetailPage extends StatelessWidget {
  const ExerciseDetailPage({
    super.key,
    required this.exerciseKey,
  });

  final String exerciseKey;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
