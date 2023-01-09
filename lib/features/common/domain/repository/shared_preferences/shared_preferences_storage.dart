import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/features/filter/domain/entity/place_filter.dart';

/// Class [SharedPreferencesStorage] is a storage using shared_preferences package
class SharedPreferencesStorage {
  SharedPreferences? _prefs;

  /// Onboarding
  ///
  /// Saves onboarding status
  Future<void> setOnboardingPassedStatus({
    required bool onboardingPassed,
  }) async {
    await _initPrefs();
    await _prefs?.setBool(
      AppStrings.onboardingPassedStatusKey,
      onboardingPassed,
    );
  }

  /// Gets onboarding status
  Future<bool> getOnboardingPassedStatus({
    required bool onboardingPassed,
  }) async {
    await _initPrefs();
    return _prefs?.getBool(
          AppStrings.onboardingPassedStatusKey,
        ) ??
        false;
  }

  /// Light-dark theme
  ///
  /// Save theme in storage
  /// true is dark
  Future<void> setThemeLighting({required bool isDark}) async {
    await _initPrefs();
    await _prefs?.setBool(AppStrings.themeLightingKey, isDark);
  }

  /// Gets theme from storage
  Future<bool> getThemeLighting() async {
    await _initPrefs();
    return _prefs?.getBool(AppStrings.themeLightingKey) ?? false;
  }

  /// Tabs index
  ///
  /// save tabs index to storage
  Future<void> setTabsIndex(int index) async {
    await _initPrefs();
    await _prefs?.setInt(AppStrings.tabsIndexKey, index);
  }

  /// gets tabs index
  Future<int> getTabsIndex(int index) async {
    await _initPrefs();
    return _prefs?.getInt(AppStrings.tabsIndexKey) ?? 0;
  }

  /// Filters
  ///
  /// Saves filters to storage
  /// XXX
  /// Might not work, will be checked and then fixed when developing filter feature.
  Future<void> setPlaceFilter(PlaceFilter placeFilter) async {
    await _initPrefs();

    final placeFilterJson = placeFilter.toJson();
    final encodedPlaceFilter = jsonEncode(placeFilterJson);

    await _prefs?.setString(
      AppStrings.placeFilterKey,
      encodedPlaceFilter,
    );
  }

  /// Gets filters from storage
  /// XXX
  /// Might not work, will be checked and then fixed when developing filter feature.
  Future<PlaceFilter> getPlaceFilter() async {
    await _initPrefs();
    final placeFilterFromSharedPrefs =
        _prefs?.getString(AppStrings.placeFilterKey);

    final decoded =
        jsonDecode(placeFilterFromSharedPrefs!) as Map<String, dynamic>;

    return PlaceFilter.fromJson(decoded);
  }

  /// prefs initialization
  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }
}
