import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/res/app_assets.dart';
import 'package:surf_study_project/features/main_screen/screens/main_tabs_screen/main_screen_export.dart';
import 'package:surf_study_project/features/main_screen/widgets/tab_svg_icon.dart';
import 'package:surf_study_project/features/navigation/service/router.dart';

/// Factory for [MainScreenWidgetModel].
MainScreenWidgetModel mainScreenWmFactory(
  BuildContext context,
) {
  final model = MainScreenModel();
  return MainScreenWidgetModel(model);
}

/// Class [MainScreenWidgetModel] is a [WidgetModel] for [MainScreen]
class MainScreenWidgetModel extends WidgetModel<MainScreen, MainScreenModel>
    implements IMainScreenWidgetModel {
  final _defaultRouter = <PageRouteInfo>[
    PlacesListRouter(),
    const SettingsRouter(),
  ];

  @override
  List<PageRouteInfo> get routes => _defaultRouter;

  @override
  List<BottomNavigationBarItem> get navigationBarItems => _defaultNavBarItems;

  /// constructor
  MainScreenWidgetModel(MainScreenModel model) : super(model);
}

/// interface [IMainScreenWidgetModel]
abstract class IMainScreenWidgetModel extends IWidgetModel {
  /// Routes for [AutoTabsRouter.tabBar].
  List<PageRouteInfo<dynamic>> get routes;

  /// Items for [BottomNavigationBar].
  List<BottomNavigationBarItem> get navigationBarItems;
}

final _defaultNavBarItems = [
  /// tab for PlacesListScreen
  const BottomNavigationBarItem(
    label: '',
    activeIcon: TabSvgIcon(iconSVGPath: AppAssets.listFull),
    icon: TabSvgIcon(iconSVGPath: AppAssets.list),
  ),

  /// tab for SettingsScreen
  const BottomNavigationBarItem(
    label: '',
    activeIcon: TabSvgIcon(iconSVGPath: AppAssets.settingsFill),
    icon: TabSvgIcon(iconSVGPath: AppAssets.settings),
  ),
];
