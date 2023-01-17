import 'package:auto_route/auto_route.dart';
import 'package:surf_study_project/features/filter/screens/filter_screen/filter_screen_export.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_names.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';

/// All routes for the filter feature.
const filterRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.filterPath,
  name: AppRouteNames.filterScreen,
  page: FilterScreen,
);
