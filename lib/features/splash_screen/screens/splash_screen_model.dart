import 'package:elementary/elementary.dart';
import 'package:surf_study_project/features/common/service/app_settings_service.dart';

/// Class [SplashScreenModel] is model class for SplashScreen
class SplashScreenModel extends ElementaryModel {
  /// [AppSettingsService]
  AppSettingsService appSettingsService;

  /// constructor
  SplashScreenModel({required this.appSettingsService});

  /// function that get onboarding status: is passed or not
  Future<bool> onboardingPassed() async =>
      appSettingsService.getOnboardingStatus();
}
