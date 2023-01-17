import 'package:elementary/elementary.dart';
import 'package:surf_study_project/features/common/service/app_settings_service.dart';
import 'package:surf_study_project/features/onboarding/screens/onboarding_screen/onboarding_screen.dart';

/// Model for [OnboardingScreen]
class OnboardingScreenModel extends ElementaryModel {
  final AppSettingsService _appSettingsService;

  /// constructor
  OnboardingScreenModel(this._appSettingsService);

  /// sets that onboarding is passed
  Future<void> setOnboardingIsPassed() async {
    await _appSettingsService.setOnboardingStatus(onboardingPassed: true);
  }
}
