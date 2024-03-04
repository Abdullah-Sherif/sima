import 'package:auto_route/auto_route.dart';
import 'package:sima/core/barrel.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        ...coreRoutes,
      ];
}
