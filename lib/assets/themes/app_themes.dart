// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = themeData(lightColorScheme);
  static final ThemeData darkTheme = themeData(darkColorScheme);

  static ColorScheme lightColorScheme = const ColorScheme.light().copyWith(
    background: AppColors.whiteWhiteTheme,
    primary: AppColors.whiteWhiteTheme,
    onPrimary: AppColors.mainColorWhiteTheme,
    onBackground: AppColors.mainColorWhiteTheme,
    secondary: AppColors.greenWhiteTheme,
    onSecondary: AppColors.whiteWhiteTheme,
    tertiary: AppColors.secondary2WithOpactiryColorWhiteTheme,
    onTertiary: AppColors.secondary2ColorWhiteTheme,
  );

  static ColorScheme darkColorScheme = const ColorScheme.dark().copyWith(
    background: AppColors.mainColorBlackTheme,
    primary: AppColors.mainColorBlackTheme,
    onPrimary: AppColors.whiteBlackTheme,
    onBackground: AppColors.whiteBlackTheme,
    secondary: AppColors.greenBlackTheme,
    onSecondary: AppColors.whiteBlackTheme,
    tertiary: AppColors.secondary2WithOpactiryColorBlackTheme,
    onTertiary: AppColors.secondary2ColorBlackTheme,
  );

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
      fontFamily: 'Roboto',
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        foregroundColor: colorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.secondary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      brightness: colorScheme.brightness,
    );
  }
}
