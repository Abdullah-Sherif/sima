import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'core/barrel.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
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
