import 'package:auto_route/auto_route.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_names.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';
import 'package:surf_study_project/features/places_list/screens/places_list_screen/places_list_screen_export.dart';

/// All routes for the places list feature.
const placesListRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.placesListPath,
  name: AppRouteNames.placesListScreen,
  page: PlacesListScreen,
);
