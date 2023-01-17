import 'package:auto_route/auto_route.dart';
import 'package:surf_study_project/features/main_screen/screens/main_tabs_screen/main_screen_export.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_names.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';
import 'package:surf_study_project/features/navigation/domain/entity/places_list/places_list_routes.dart';
import 'package:surf_study_project/features/navigation/domain/entity/settings/settings_routes.dart';

/// All routes for the info feature.
const mainRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.mainPath,
  name: AppRouteNames.mainScreen,
  page: MainScreen,
  children: [
    placesListRoutes,
    settingsRoutes,
  ],
);
