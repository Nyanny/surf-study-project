import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_study_project/features/filter/screens/filter_screen/filter_screen_export.dart';
import 'package:surf_study_project/features/main_screen/screens/main_tabs_screen/main_screen_export.dart';
import 'package:surf_study_project/features/navigation/domain/entity/filter/filter_routes.dart';
import 'package:surf_study_project/features/navigation/domain/entity/main_screen/main_screen_routes.dart';
import 'package:surf_study_project/features/navigation/domain/entity/onboarding/onboarding_routes.dart';
import 'package:surf_study_project/features/navigation/domain/entity/search/search_routes.dart';
import 'package:surf_study_project/features/navigation/domain/entity/splash_screen/splash_routes.dart';
import 'package:surf_study_project/features/onboarding/screens/onboarding_screen/onboarding_screen_export.dart';
import 'package:surf_study_project/features/places_list/screens/places_list_screen/places_list_screen_export.dart';
import 'package:surf_study_project/features/search/screens/search_screen/search_screen.dart';
import 'package:surf_study_project/features/settings/screens/settings_screen/settings_screen.dart';
import 'package:surf_study_project/features/splash_screen/screens/splash_screen_export.dart';

part 'router.gr.dart';

/// When you add route with screen don't forget add imports of screen and screen_widget_model

/// All app routes
@MaterialAutoRouter(
  replaceInRouteName: 'ScreenWidget|Screen,Route',
  routes: <AutoRoute>[
    splashRoutes,
    onboardingRoutes,
    mainRoutes,
    filterRoutes,
    searchRoutes,
  ],
)

/// Main point of the application navigation
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  AppRouter._();

  /// Singleton instance of [AppRouter]
  factory AppRouter.instance() => _router;
}
