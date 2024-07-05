import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sima/features/settings/presentation/states/theme_state/theme_state.dart';

import 'core/barrel.dart';
import 'features/barrel.dart';

class App extends ConsumerWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppListeners(
      child: MaterialApp.router(
        routerDelegate: AutoRouterDelegate(
          _appRouter,
          navigatorObservers: () => [
            AppRouteObserver(),
          ],
        ),
        routeInformationParser: _appRouter.defaultRouteParser(includePrefixMatches: true),
        routeInformationProvider: _appRouter.routeInfoProvider(),
        locale: AppGlobals.language.locale,
        supportedLocales: Language.values.locales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ref.watch(themeControllerProvider) == ThemeState.dark ? AppTheme.darkTheme : AppTheme.lightTheme,
        themeMode: ref.watch(themeControllerProvider) == ThemeState.dark ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
