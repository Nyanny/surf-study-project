import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_study_project/features/navigation/domain/entity/places_list/places_list_routes.dart';
import 'package:surf_study_project/features/places_list/screens/places_list_screen/places_list_screen_export.dart';

part 'router.gr.dart';

/// When you add route with screen don't forget add imports of screen and screen_widget_model

/// All app routes
@MaterialAutoRouter(
  replaceInRouteName: 'ScreenWidget|Screen,Route',
  routes: <AutoRoute>[
    placesListRoutes,
  ],
)

/// Main point of the application navigation
class AppRouter extends _$AppRouter {
  static final AppRouter _router = AppRouter._();

  AppRouter._();

  /// Singleton instance of [AppRouter]
  factory AppRouter.instance() => _router;
}
