import 'package:auto_route/auto_route.dart';
import 'package:sima/core/barrel.dart';

final authRoutes = <AutoRoute>[
  AutoRoute(
    path: '/fbop',
    page: FirebaseOpsRouteLoader.page,
  ),
  AutoRoute(page: ConfirmEmailRoute.page),
  AutoRoute(page: AuthWrapperRoute.page, children: [
    AutoRoute(page: AuthHomeRoute.page),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: ForgetPasswordRoute.page, initial: true),
    AutoRoute(page: ResetPasswordRoute.page),
    AutoRoute(page: SignUpRoute.page),
  ])
];
