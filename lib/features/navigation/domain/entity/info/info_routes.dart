import 'package:auto_route/auto_route.dart';
import 'package:surf_study_project/features/info/screen/info_screen_export.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_names.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';

/// All routes for the info feature.
const infoRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.infoPath,
  name: AppRouteNames.infoScreen,
  page: InfoScreen,
);
