import 'package:auto_route/auto_route.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_names.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';
import 'package:surf_study_project/features/splash_screen/screens/splash_screen_export.dart';

/// All routes for the places list feature.
const splashRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.splashPath,
  name: AppRouteNames.splashScreen,
  page: SplashScreen,
);
