import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_study_project/assets/strings/shared_preferences_strings.dart';
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
      SharedPreferencesStrings.onboardingPassedStatusKey,
      onboardingPassed,
    );
  }

  /// Gets onboarding status
  Future<bool> getOnboardingPassedStatus() async {
    await _initPrefs();
    return _prefs?.getBool(
          SharedPreferencesStrings.onboardingPassedStatusKey,
        ) ??
        false;
  }

  /// Light-dark theme
  ///
  /// Save theme in storage
  /// true is dark
  Future<void> setTheme({required bool isDark}) async {
    await _initPrefs();
    await _prefs?.setBool(SharedPreferencesStrings.themeLightingKey, isDark);
  }

  /// Gets theme from storage
  Future<bool> getTheme() async {
    await _initPrefs();
    return _prefs?.getBool(SharedPreferencesStrings.themeLightingKey) ?? false;
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
      SharedPreferencesStrings.placeFilterKey,
      encodedPlaceFilter,
    );
  }

  /// Gets filters from storage
  /// XXX
  /// Might not work, will be checked and then fixed when developing filter feature.
  Future<PlaceFilter> getPlaceFilter() async {
    await _initPrefs();
    final placeFilterFromSharedPrefs =
        _prefs?.getString(SharedPreferencesStrings.placeFilterKey);

    final decoded =
        jsonDecode(placeFilterFromSharedPrefs!) as Map<String, dynamic>;

    return PlaceFilter.fromJson(decoded);
  }

  /// prefs initialization
  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }
}
