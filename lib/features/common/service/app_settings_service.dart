import 'package:elementary/elementary.dart';
import 'package:surf_study_project/features/common/domain/repository/shared_preferences/shared_preferences_storage.dart';

/// Class [AppSettingsService] is service class for settings feature
class AppSettingsService {
  /// EntityStateNotifier for theme
  final themeState = EntityStateNotifier<bool>();

  final SharedPreferencesStorage _sharedPreferencesStorage;

  /// constructor
  AppSettingsService(this._sharedPreferencesStorage) {
    init();
  }

  /// initialization
  Future<void> init() async {
    themeState.loading();
    await getTheme();
    themeState.content(await _sharedPreferencesStorage.getTheme());
  }

  /// get current theme
  Future<void> getTheme() async {
    final isLight = await _sharedPreferencesStorage.getTheme();
    themeState.content(isLight);
  }

  /// set new theme
  Future<void> setTheme({required bool isDark}) async {
    await _sharedPreferencesStorage.setTheme(isDark: isDark);
    themeState.content(await _sharedPreferencesStorage.getTheme());
  }
}
