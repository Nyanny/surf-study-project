import 'package:elementary/elementary.dart';
import 'package:surf_study_project/features/common/service/app_settings_service.dart';

/// ThemeSwitcherModel is a [ElementaryModel]
/// Has [initData] and [setThemeLighting] methods
class ThemeSwitcherModel extends ElementaryModel {
  final AppSettingsService _appSettingsService;

  /// constructor
  ThemeSwitcherModel(this._appSettingsService);

  /// sets theme
  Future<void> setThemeLighting({required bool isDark}) async {
    await _appSettingsService.setThemeLighting(isDark: isDark);
  }

  /// initialize theme's data
  bool? initData() {
    return _appSettingsService.themeLighting.value?.data;
  }
}
