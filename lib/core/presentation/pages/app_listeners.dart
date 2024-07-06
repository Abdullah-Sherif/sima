import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/barrel.dart';

class AppListeners extends ConsumerWidget {
  const AppListeners({super.key, required this.child, required this.router});

  final Widget child;
  final AppRouter router;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authControllerProvider);
    ref.watch(userConrollerProvider);
    ref.watch(themeControllerProvider);
    ref.watch(databaseServiceProvider);

    final authState = ref.watch(authControllerProvider);

    final PageRouteInfo newRoute = authState.map(
      initial: (value) => const LoadingRoute(),
      authenticated: (value) {
        if (!value.isEmailVerified) {
          return const LoadingRoute();
        } else {
          return const LoadingRoute();
        }
      },
      unauthenticated: (value) => const AuthWrapperRoute(),
    );

    final PlaceInApp placeInApp = authState.map(
      initial: (value) => PlaceInApp.landing,
      authenticated: (value) => PlaceInApp.home,
      unauthenticated: (value) => PlaceInApp.landing,
    );

    ref.read(placeInAppControllerProvider.notifier).setPlaceInApp(placeInApp);

    if (authState.isLoggedIn) {
      ref.read(databaseServiceProvider).init();
    }

    router.replace(newRoute);

    return child;
  }
}
