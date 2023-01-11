import 'package:auto_route/auto_route.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_names.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';
import 'package:surf_study_project/features/settings/screens/settings_screen/settings_screen.dart';

/// All routes for the settings feature.
const settingsRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.settingsPath,
  name: AppRouteNames.settingsScreen,
  page: SettingsScreen,
);
