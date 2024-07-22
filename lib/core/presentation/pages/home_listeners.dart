import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/features/barrel.dart';

class HomeListeners extends ConsumerWidget {
  const HomeListeners({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(weekControllerProvider);
    ref.watch(allcyclesControllerProvider);
    return child;
  }
}
