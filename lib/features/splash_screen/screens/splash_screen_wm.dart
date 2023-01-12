import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_study_project/features/app/di/app_scope.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';
import 'package:surf_study_project/features/navigation/service/router.dart';
import 'package:surf_study_project/features/splash_screen/screens/splash_screen.dart';
import 'package:surf_study_project/features/splash_screen/screens/splash_screen_model.dart';

/// Factory for [SplashScreenWidgetModel].
SplashScreenWidgetModel splashScreenWmFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model =
      SplashScreenModel(appSettingsService: appDependencies.appSettingsService);

  final router = appDependencies.router;
  return SplashScreenWidgetModel(model, router: router);
}

/// Widget model for [SplashScreen].
class SplashScreenWidgetModel
    extends WidgetModel<SplashScreen, SplashScreenModel>
    with TickerProviderWidgetModelMixin
    implements ISplashScreenWidgetModel {
  /// [AppRouter] router for navigation
  final AppRouter router;

  @override
  Animation<double> get animation => _animation;
  late Animation<double> _animation;
  late AnimationController _animationController;

  /// constructor
  SplashScreenWidgetModel(SplashScreenModel model, {required this.router})
      : super(model);

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();

    /// animation
    animateSplashScreen();

    unawaited(_animationController.repeat());

    final onboardingPassed = await model.onboardingPassed();

    Future.delayed(const Duration(seconds: 1), () async {
      await _routeToScreen(onboardingPassed);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// animates splash screen
  /// makes spinning with stopping for a moment by [CurvedAnimation]
  void animateSplashScreen() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween(
      begin: 0.0,
      end: -1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  /// chooses router to navigate
  Future<void> _routeToScreen(bool onboardingPassed) async {
    if (onboardingPassed) {
      await router.replaceNamed(AppRoutePaths.mainPath);
    } else {
      await router.replaceNamed(AppRoutePaths.onboardingPath);
    }
  }
}

/// Interface of [SplashScreenWidgetModel].
abstract class ISplashScreenWidgetModel extends IWidgetModel {
  /// animation needed for [SplashScreen]
  Animation<double> get animation;
}
