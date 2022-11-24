import 'package:auto_route/auto_route.dart';
import 'package:surf_study_project/features/dash/screen/dash_screen_export.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_names.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';

/// All routes for the dash feature.
const dashRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.dashPath,
  name: AppRouteNames.dashScreen,
  page: DashScreen,
);
