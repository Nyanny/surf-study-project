import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:surf_study_project/features/common/service/app_settings_service.dart';
import 'package:surf_study_project/features/geolocation/bloc/geolocation_bloc.dart';

/// Class [SplashScreenModel] is model class for SplashScreen
class SplashScreenModel extends ElementaryModel {
  late final Stream<GeolocationState> _geolocationStateStream;

  /// [AppSettingsService]
  AppSettingsService appSettingsService;

  /// [GeolocationBloc] instance
  GeolocationBloc geolocationBloc;

  /// gets current bloc state
  GeolocationState get currentState => geolocationBloc.state;

  /// Stream of [GeolocationState]
  Stream<GeolocationState> get geolocationStateStream =>
      _geolocationStateStream;

  /// verifies locations service and app permission
  VoidCallback get verifyPermissions => _verifyPermissions;

  /// constructor
  SplashScreenModel({
    required this.appSettingsService,
    required this.geolocationBloc,
  });

  @override
  void init() {
    super.init();
    _geolocationStateStream = geolocationBloc.stream;
  }

  /// function that get onboarding status: is passed or not
  Future<bool> onboardingPassed() async =>
      appSettingsService.getOnboardingStatus();

  void _verifyPermissions() {
    geolocationBloc.add(VerifyThenRequestPermissionEvent());
  }
}
