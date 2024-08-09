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
      final args = routeData.argsAs<ConfirmEmailRouteArgs>(
          orElse: () => const ConfirmEmailRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConfirmEmailPage(
          key: args.key,
          verify: args.verify,
        ),
      );
    },
    DataRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DataPage(),
      );
    },
    ExerciseDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ExerciseDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExerciseDetailPage(
          key: args.key,
          exerciseIndex: args.exerciseIndex,
        ),
      );
    },
    ExercisesRoute.name: (routeData) {
      final args = routeData.argsAs<ExercisesRouteArgs>(
          orElse: () => const ExercisesRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExercisesPage(
          key: args.key,
          currentExercises: args.currentExercises,
          workoutKey: args.workoutKey,
        ),
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
          key: args.key,
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
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    HomeWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeWrapper(),
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
    SettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingPage(),
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
    WorkoutCycleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorkoutCyclePage(),
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
class ConfirmEmailRoute extends PageRouteInfo<ConfirmEmailRouteArgs> {
  ConfirmEmailRoute({
    Key? key,
    bool verify = false,
    List<PageRouteInfo>? children,
  }) : super(
          ConfirmEmailRoute.name,
          args: ConfirmEmailRouteArgs(
            key: key,
            verify: verify,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmEmailRoute';

  static const PageInfo<ConfirmEmailRouteArgs> page =
      PageInfo<ConfirmEmailRouteArgs>(name);
}

class ConfirmEmailRouteArgs {
  const ConfirmEmailRouteArgs({
    this.key,
    this.verify = false,
  });

  final Key? key;

  final bool verify;

  @override
  String toString() {
    return 'ConfirmEmailRouteArgs{key: $key, verify: $verify}';
  }
}

/// generated route for
/// [DataPage]
class DataRoute extends PageRouteInfo<void> {
  const DataRoute({List<PageRouteInfo>? children})
      : super(
          DataRoute.name,
          initialChildren: children,
        );

  static const String name = 'DataRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExerciseDetailPage]
class ExerciseDetailRoute extends PageRouteInfo<ExerciseDetailRouteArgs> {
  ExerciseDetailRoute({
    Key? key,
    required int exerciseIndex,
    List<PageRouteInfo>? children,
  }) : super(
          ExerciseDetailRoute.name,
          args: ExerciseDetailRouteArgs(
            key: key,
            exerciseIndex: exerciseIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'ExerciseDetailRoute';

  static const PageInfo<ExerciseDetailRouteArgs> page =
      PageInfo<ExerciseDetailRouteArgs>(name);
}

class ExerciseDetailRouteArgs {
  const ExerciseDetailRouteArgs({
    this.key,
    required this.exerciseIndex,
  });

  final Key? key;

  final int exerciseIndex;

  @override
  String toString() {
    return 'ExerciseDetailRouteArgs{key: $key, exerciseIndex: $exerciseIndex}';
  }
}

/// generated route for
/// [ExercisesPage]
class ExercisesRoute extends PageRouteInfo<ExercisesRouteArgs> {
  ExercisesRoute({
    Key? key,
    List<ExerciseEntity>? currentExercises,
    String? workoutKey,
    List<PageRouteInfo>? children,
  }) : super(
          ExercisesRoute.name,
          args: ExercisesRouteArgs(
            key: key,
            currentExercises: currentExercises,
            workoutKey: workoutKey,
          ),
          initialChildren: children,
        );

  static const String name = 'ExercisesRoute';

  static const PageInfo<ExercisesRouteArgs> page =
      PageInfo<ExercisesRouteArgs>(name);
}

class ExercisesRouteArgs {
  const ExercisesRouteArgs({
    this.key,
    this.currentExercises,
    this.workoutKey,
  });

  final Key? key;

  final List<ExerciseEntity>? currentExercises;

  final String? workoutKey;

  @override
  String toString() {
    return 'ExercisesRouteArgs{key: $key, currentExercises: $currentExercises, workoutKey: $workoutKey}';
  }
}

/// generated route for
/// [FirebaseOpsPageLoader]
class FirebaseOpsRouteLoader extends PageRouteInfo<FirebaseOpsRouteLoaderArgs> {
  FirebaseOpsRouteLoader({
    Key? key,
    String? mode,
    String? oobCode,
    String? apiKey,
    List<PageRouteInfo>? children,
  }) : super(
          FirebaseOpsRouteLoader.name,
          args: FirebaseOpsRouteLoaderArgs(
            key: key,
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

  static const PageInfo<FirebaseOpsRouteLoaderArgs> page =
      PageInfo<FirebaseOpsRouteLoaderArgs>(name);
}

class FirebaseOpsRouteLoaderArgs {
  const FirebaseOpsRouteLoaderArgs({
    this.key,
    this.mode,
    this.oobCode,
    this.apiKey,
  });

  final Key? key;

  final String? mode;

  final String? oobCode;

  final String? apiKey;

  @override
  String toString() {
    return 'FirebaseOpsRouteLoaderArgs{key: $key, mode: $mode, oobCode: $oobCode, apiKey: $apiKey}';
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
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeWrapper]
class HomeWrapperRoute extends PageRouteInfo<void> {
  const HomeWrapperRoute({List<PageRouteInfo>? children})
      : super(
          HomeWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeWrapperRoute';

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
/// [SettingPage]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

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

/// generated route for
/// [WorkoutCyclePage]
class WorkoutCycleRoute extends PageRouteInfo<void> {
  const WorkoutCycleRoute({List<PageRouteInfo>? children})
      : super(
          WorkoutCycleRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkoutCycleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
