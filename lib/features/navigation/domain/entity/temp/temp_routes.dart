import 'package:auto_route/auto_route.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_names.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';
import 'package:surf_study_project/features/navigation/domain/entity/onboarding/onboarding_routes.dart';
import 'package:surf_study_project/features/navigation/domain/entity/debug/debug_routes.dart';
import 'package:surf_study_project/features/navigation/domain/entity/info/info_routes.dart';
import 'package:surf_study_project/features/temp/screens/temp_screen/temp_screen_export.dart';

/// All routes for the temp feature.
const tempRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.tempPath,
  name: AppRouteNames.tempScreen,
  page: TempScreen,
  children: [
    onboardingRoutes,
    infoRoutes,
    debugRoutes,
  ],
);
