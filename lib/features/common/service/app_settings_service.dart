import 'package:elementary/elementary.dart';
import 'package:surf_study_project/features/common/domain/repository/shared_preferences/shared_preferences_storage.dart';

/// Class [AppSettingsService] is service class for settings feature
class AppSettingsService {
  /// EntityStateNotifier for theme
  final themeState = StateNotifier<bool>();

  final SharedPreferencesStorage _sharedPreferencesStorage;

  /// constructor
  AppSettingsService(this._sharedPreferencesStorage) {
    init();
  }

  /// initialization
  Future<void> init() async {
    await getTheme();
    themeState.accept(await _sharedPreferencesStorage.getTheme());
  }

  /// get current theme
  Future<void> getTheme() async {
    final isLight = await _sharedPreferencesStorage.getTheme();
    themeState.accept(isLight);
  }

  /// set new theme
  Future<void> setTheme({required bool isDark}) async {
    await _sharedPreferencesStorage.setTheme(isDark: isDark);
    themeState.accept(await _sharedPreferencesStorage.getTheme());
  }

  /// onboarding status
  /// gets onboarding status
  Future<void> setOnboardingStatus({required bool onboardingPassed}) async {
    await _sharedPreferencesStorage.setOnboardingPassedStatus(
      onboardingPassed: onboardingPassed,
    );
  }

  /// sets onboarding status
  Future<bool> getOnboardingStatus() async {
    return _sharedPreferencesStorage.getOnboardingPassedStatus();
  }
}
