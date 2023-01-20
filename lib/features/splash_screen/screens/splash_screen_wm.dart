import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_study_project/features/app/di/app_scope.dart';
import 'package:surf_study_project/features/geolocation/bloc/geolocation_bloc.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';
import 'package:surf_study_project/features/navigation/service/router.dart';
import 'package:surf_study_project/features/splash_screen/screens/splash_screen.dart';
import 'package:surf_study_project/features/splash_screen/screens/splash_screen_model.dart';

/// Factory for [SplashScreenWidgetModel].
SplashScreenWidgetModel splashScreenWmFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final geoBloc = appDependencies.geolocationBloc;
  final model = SplashScreenModel(
    appSettingsService: appDependencies.appSettingsService,
    geolocationBloc: geoBloc,
  );
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

  /// subsctition to the [GeolocationState]
  late final StreamSubscription<GeolocationState> _stateGeolocationSubscription;

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

    _stateGeolocationSubscription =
        model.geolocationStateStream.listen(_updateState);
    model.verifyPermissions();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _stateGeolocationSubscription.cancel();
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

  Future<void> _updateState(GeolocationState state) async {
    if (state is GeolocationPermissionGranted || state is GeolocationError) {
      Future.delayed(const Duration(milliseconds: 1500), () async {
        await _routeToScreen();
      });
    }
  }

  /// chooses router to navigate
  Future<void> _routeToScreen() async {
    final onboardingPassed = await model.onboardingPassed();

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
