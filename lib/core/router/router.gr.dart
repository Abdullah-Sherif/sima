// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthHomePage(),
      );
    },
    AuthWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthWrapperPage(),
      );
    },
    ConfirmEmailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfirmEmailPage(),
      );
    },
    FirebaseOpsRouteLoader.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<FirebaseOpsRouteLoaderArgs>(
          orElse: () => FirebaseOpsRouteLoaderArgs(
                mode: queryParams.optString('mode'),
                oobCode: queryParams.optString('oobCode'),
                apiKey: queryParams.optString('apiKey'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FirebaseOpsPageLoader(
          mode: args.mode,
          oobCode: args.oobCode,
          apiKey: args.apiKey,
        ),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgetPasswordPage(),
      );
    },
    LoadingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoadingPage(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPasswordPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
  };
}

/// generated route for
/// [AuthHomePage]
class AuthHomeRoute extends PageRouteInfo<void> {
  const AuthHomeRoute({List<PageRouteInfo>? children})
      : super(
          AuthHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthWrapperPage]
class AuthWrapperRoute extends PageRouteInfo<void> {
  const AuthWrapperRoute({List<PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfirmEmailPage]
class ConfirmEmailRoute extends PageRouteInfo<void> {
  const ConfirmEmailRoute({List<PageRouteInfo>? children})
      : super(
          ConfirmEmailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmEmailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FirebaseOpsPageLoader]
class FirebaseOpsRouteLoader extends PageRouteInfo<FirebaseOpsRouteLoaderArgs> {
  FirebaseOpsRouteLoader({
    String? mode,
    String? oobCode,
    String? apiKey,
    List<PageRouteInfo>? children,
  }) : super(
          FirebaseOpsRouteLoader.name,
          args: FirebaseOpsRouteLoaderArgs(
            mode: mode,
            oobCode: oobCode,
            apiKey: apiKey,
          ),
          rawQueryParams: {
            'mode': mode,
            'oobCode': oobCode,
            'apiKey': apiKey,
          },
          initialChildren: children,
        );

  static const String name = 'FirebaseOpsRouteLoader';

  static const PageInfo<FirebaseOpsRouteLoaderArgs> page = PageInfo<FirebaseOpsRouteLoaderArgs>(name);
}

class FirebaseOpsRouteLoaderArgs {
  const FirebaseOpsRouteLoaderArgs({
    this.mode,
    this.oobCode,
    this.apiKey,
  });

  final String? mode;

  final String? oobCode;

  final String? apiKey;

  @override
  String toString() {
    return 'FirebaseOpsRouteLoaderArgs{mode: $mode, oobCode: $oobCode, apiKey: $apiKey}';
  }
}

/// generated route for
/// [ForgetPasswordPage]
class ForgetPasswordRoute extends PageRouteInfo<void> {
  const ForgetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoadingPage]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
