import 'package:auto_route/auto_route.dart';
import 'package:sima/core/barrel.dart';

final authRoutes = <AutoRoute>[
  AutoRoute(page: ConfirmEmailRoute.page),
  AutoRoute(page: AuthWrapperRoute.page, children: [
    AutoRoute(page: AuthHomeRoute.page, initial: true),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: ForgetPasswordRoute.page),
    AutoRoute(page: SignUpRoute.page),
  ])
];
