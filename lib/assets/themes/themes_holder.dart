import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/add_button_colors.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/card_colors.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/loader_colors.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/main_colors.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/onboarding_colors.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/place_list_colors.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/placeholder_colors.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/settings_colors.dart';

/// Class [ThemesHolder] theme extensions used in app
class ThemesHolder {
  static const List<ThemeExtension<dynamic>> _lightThemesList = [
    OnboardingColors.light,
    PlaceListColors.light,
    CardColors.light,
    AddButtonColors.light,
    LoaderColors.light,
    PlaceholderColors.light,
    SettingsColors.light,
    MainColors.light,
  ];

  static const List<ThemeExtension<dynamic>> _darkThemesList = [
    OnboardingColors.dark,
    PlaceListColors.dark,
    CardColors.dark,
    AddButtonColors.dark,
    LoaderColors.dark,
    PlaceholderColors.dark,
    SettingsColors.dark,
    MainColors.dark,
  ];

  /// light theme extensions
  static List<ThemeExtension<dynamic>> get lightThemesList => _lightThemesList;

  /// dark theme extensions
  static List<ThemeExtension<dynamic>> get darkThemesList => _darkThemesList;
}
