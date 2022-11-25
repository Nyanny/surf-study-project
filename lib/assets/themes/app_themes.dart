import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

class AppThemes {
  static final ThemeData lightTheme = themeData(lightColorScheme);
  static final ThemeData darkTheme = themeData(darkColorScheme);

  static ColorScheme lightColorScheme = const ColorScheme.light(
    background: AppColors.whiteWhiteTheme,
    primary: AppColors.whiteWhiteTheme,
    onPrimary: AppColors.greenWhiteTheme,
    onBackground: AppColors.mainColorWhiteTheme,
  );

  static ColorScheme darkColorScheme = const ColorScheme.dark(
    background: AppColors.darkColorBlackTheme,
    primary: AppColors.darkColorBlackTheme,
    onPrimary: AppColors.greenBlackTheme,
    onBackground: AppColors.whiteBlackTheme,
  );

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
      fontFamily: 'Roboto',
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      brightness: colorScheme.brightness,
    );
  }
}
