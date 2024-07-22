import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sima/core/barrel.dart';

@RoutePage(name: 'HomeWrapperRoute')
class HomeWrapper extends StatelessWidget {
  const HomeWrapper({super.key});

  final List<PageRouteInfo<dynamic>> routes = const [
    HomeRoute(),
    DataRoute(),
    SettingRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: routes,
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);

        return SafeArea(
          child: Scaffold(
            body: HomeListeners(child: child),
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: CustomBottomNavigationBar(tabsRouter: tabsRouter),
          ),
        );
      },
    );
  }
}
