import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextData on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  double percentOfHeight(double percent) => height * percent;
  double percentOfWidth(double percent) => width * percent;

  pushAndPopUntilFirst(PageRouteInfo route) {
    router.pushAndPopUntil(
      route,
      predicate: (route) => route.isFirst,
    );
  }

  AppLocalizations get appTexts => AppLocalizations.of(this)!;
}
