import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/features/main_screen/screens/main_tabs_screen/main_screen_export.dart';

/// Class [MainScreen] is class for the 'main' feature
/// It's just a [Scaffold] with [BottomNavigationBar] that uses [AutoTabsRouter.tabBar]
/// MainScreen feature is handling routes
class MainScreen extends ElementaryWidget<IMainScreenWidgetModel> {
  /// constructor
  const MainScreen({
    Key? key,
    WidgetModelFactory wmFactory = mainScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IMainScreenWidgetModel wm) {
    return AutoTabsRouter.tabBar(
      routes: wm.routes,
      builder: (context, child, controller) {
        final tabsRouter = context.tabsRouter;

        return Scaffold(
          body: child,
          bottomNavigationBar: SizedBox(
            height: 56.w,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: wm.navigationBarItems,
            ),
          ),
        );
      },
    );
  }
}
