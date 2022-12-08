import 'package:auto_route/auto_route.dart';
import 'package:surf_study_project/features/screens/onboarding/onboarding_screen_export.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_names.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';

/// All routes for the info feature.
const onboardingRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.onboardingPath,
  name: AppRouteNames.onboardingScreen,
  page: OnboardingScreen,
);
