import 'package:elementary/elementary.dart';
import 'package:surf_study_project/features/common/domain/repository/shared_preferences/shared_preferences_storage.dart';

/// Class [AppSettingsService] is service class for settings feature
class AppSettingsService {
  /// EntityStateNotifier for theme
  final themeLighting = EntityStateNotifier<bool>();

  final SharedPreferencesStorage _sharedPreferencesStorage;

  /// constructor
  AppSettingsService(this._sharedPreferencesStorage) {
    init();
  }

  /// initialization
  Future<void> init() async {
    themeLighting.loading();
    await getThemeLighting();
    themeLighting.content(await _sharedPreferencesStorage.getThemeLighting());
  }

  /// get current theme
  Future<void> getThemeLighting() async {
    final isLight = await _sharedPreferencesStorage.getThemeLighting();
    themeLighting.content(isLight);
  }

  /// set new theme
  Future<void> setThemeLighting({required bool isDark}) async {
    await _sharedPreferencesStorage.setThemeLighting(isDark: isDark);
    themeLighting.content(await _sharedPreferencesStorage.getThemeLighting());
  }
}
