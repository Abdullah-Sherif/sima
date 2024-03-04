import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/barrel.dart';
import 'features/barrel.dart';

class App extends ConsumerWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authControllerProvider);
    ref.watch(userConrollerProvider);

    final PageRouteInfo newRoute = ref.watch(authControllerProvider).map(
          initial: (value) => const LoadingRoute(),
          authenticated: (value) {
            if (!value.isEmailVerified) {
              return const LoadingRoute();
            } else {
              return const LoadingRoute();
            }
          },
          unauthenticated: (value) => const LoadingRoute(),
        );

    _appRouter.replaceAllWithOne(newRoute);

    return MaterialApp.router(
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [
          AppRouteObserver(),
        ],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(includePrefixMatches: true),
      routeInformationProvider: _appRouter.routeInfoProvider(),
    );
  }
}
