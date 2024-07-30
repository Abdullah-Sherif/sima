import 'package:auto_route/auto_route.dart';
import 'package:sima/core/barrel.dart';

final coreRoutes = <AutoRoute>[
  AutoRoute(
    page: LoadingRoute.page,
    initial: true,
  ),
  AutoRoute(page: HomeWrapperRoute.page, children: [
    AutoRoute(page: HomeRoute.page, path: 'home'),
    AutoRoute(page: DataRoute.page, initial: true, path: 'data'),
    AutoRoute(page: SettingRoute.page, path: 'setting'),
  ]),
];
