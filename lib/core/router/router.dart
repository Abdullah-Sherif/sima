import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sima/core/barrel.dart';
import 'package:sima/features/barrel.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        ...coreRoutes,
        ...authRoutes,
        ...workoutRoutes,
        ...settingRoutes,
      ];
}
