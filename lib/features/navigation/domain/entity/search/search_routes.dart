import 'package:auto_route/auto_route.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_names.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';
import 'package:surf_study_project/features/search/screens/search_screen/search_screen.dart';

/// All routes for the search feature.
const searchRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.searchPath,
  name: AppRouteNames.searchScreen,
  page: SearchScreen,
);
