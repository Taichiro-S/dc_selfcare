import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget(
      {super.key, required this.routes, required this.items});
  final List<PageRouteInfo<dynamic>> routes;
  final List<BottomNavigationBarItem> items;
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: routes,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: items,
        );
      },
    );
  }
}
