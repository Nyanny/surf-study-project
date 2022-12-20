import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';

// ignore_for_file: public_member_api_docs

/// class [AppThemes] defines App themes: light and dark
class AppThemes {
  /// defines default [TextTheme]
  static final _defaultTextTheme = TextTheme(
    /// Extremely large text.
    headline1: AppTypography.largeTitle,

    /// Very, very large text.
    // Used for the date in the dialog shown by showDatePicker.
    headline2: AppTypography.title,

    /// Very large text.
    headline3: AppTypography.subtitle,

    /// Large text.
    headline4: AppTypography.text,

    /// Used for large text in dialogs (e.g., the month and year in the dialog shown by showDatePicker).
    headline5: AppTypography.smallText,

    /// Used for the primary text in app bars and dialogs (e.g., AppBar.title and AlertDialog.title).
    headline6: AppTypography.superSmallText,

    /// Used for the primary text in lists (e.g., ListTile.title).
    subtitle1: AppTypography.text,

    /// For medium emphasis text that's a little smaller than subtitle1.
    subtitle2: AppTypography.smallText,

    /// Used for emphasizing text that would otherwise be bodyText2.
    bodyText1: AppTypography.text,

    /// The default text style for Material.
    bodyText2: AppTypography.text,

    /// Used for text on ElevatedButton, TextButton and OutlinedButton.
    button: AppTypography.buttonText,

    /// Used for auxiliary text associated with images.
    caption: AppTypography.smallBoldText,

    /// The smallest style.
    // Typically used for captions or to introduce a (larger) headline.
    overline: AppTypography.superSmallText,
  );

  /// defines LIGHT [ThemeData]
  static final ThemeData _lightTheme = _themeData(
    colorScheme: _lightColorScheme,
    textTheme: _defaultTextTheme,
    appBarTheme: _appBarThemeLight,
    bottomNavigationBarThemeData: _bottomNavigationBarThemeDataLight,
    floatingActionButtonThemeData: _floatingActionButtonThemeDataLight,
  );

  /// defines DARK [ThemeData]
  static final ThemeData _darkTheme = _themeData(
    colorScheme: _darkColorScheme,
    textTheme: _defaultTextTheme,
    appBarTheme: _appBarThemeDark,
    bottomNavigationBarThemeData: _bottomNavigationBarThemeDataDark,
    floatingActionButtonThemeData: _floatingActionButtonThemeDataDark,
  );

  /// defines LIGHT [ColorScheme]
  static final ColorScheme _lightColorScheme =
      const ColorScheme.light().copyWith(
    background: AppColors.whiteLightTheme,
    primary: AppColors.greenLightTheme,
    onPrimary: AppColors.whiteLightTheme,
    onBackground: AppColors.secondary2WithOpacityColorLightTheme,
    secondary: AppColors.whiteLightTheme,
    onSecondary: AppColors.mainColorLightTheme,
    tertiary: AppColors.whiteLightTheme,
    onTertiary: AppColors.mainColorLightTheme,
    error: AppColors.redLightTheme,
    onError: AppColors.whiteLightTheme,
  );

  /// defines DARK [ColorScheme]
  static final ColorScheme _darkColorScheme = const ColorScheme.dark().copyWith(
    background: AppColors.mainColorDarkTheme,
    primary: AppColors.greenDarkTheme,
    onPrimary: AppColors.whiteDarkTheme,
    onBackground: AppColors.secondary2WithOpacityColorDarkTheme,
    secondary: AppColors.secondaryColorDarkTheme,
    onSecondary: AppColors.whiteDarkTheme,
    tertiary: AppColors.mainColorDarkTheme,
    onTertiary: AppColors.whiteDarkTheme,
    error: AppColors.redDarkTheme,
    onError: AppColors.whiteDarkTheme,
  );

  /// defines LIGHT [AppBarTheme]
  static final AppBarTheme _appBarThemeLight = const AppBarTheme().copyWith(
    backgroundColor: AppThemes._lightColorScheme.background,
    titleTextStyle: AppTypography.subtitle.copyWith(
      color: AppColors.mainColorLightTheme,
    ),
    elevation: 0,
  );

  /// defines DARK [AppBarTheme]
  static final AppBarTheme _appBarThemeDark = const AppBarTheme().copyWith(
    backgroundColor: AppThemes._darkColorScheme.background,
    titleTextStyle: AppTypography.subtitle.copyWith(
      color: AppColors.whiteDarkTheme,
    ),
    elevation: 0,
  );

  /// defines LIGHT [BottomNavigationBarThemeData]
  static final BottomNavigationBarThemeData _bottomNavigationBarThemeDataLight =
      const BottomNavigationBarThemeData().copyWith(
    backgroundColor: AppThemes._lightColorScheme.background,
    selectedItemColor: AppColors.mainColorLightTheme,
    unselectedItemColor: AppColors.secondaryColorLightTheme,
  );

  /// defines DARK [BottomNavigationBarThemeData]
  static final BottomNavigationBarThemeData _bottomNavigationBarThemeDataDark =
      const BottomNavigationBarThemeData().copyWith(
    backgroundColor: AppThemes._darkColorScheme.background,
    selectedItemColor: AppColors.whiteDarkTheme,
    unselectedItemColor: AppColors.backgroundColorLightTheme,
  );

  /// defines LIGHT [FloatingActionButtonThemeData]
  static final FloatingActionButtonThemeData
      _floatingActionButtonThemeDataLight =
      const FloatingActionButtonThemeData().copyWith(
    backgroundColor: AppThemes._lightColorScheme.background,
    foregroundColor: AppColors.mainColorLightTheme,
  );

  /// defines DARK [FloatingActionButtonThemeData]
  static final FloatingActionButtonThemeData
      _floatingActionButtonThemeDataDark =
      const FloatingActionButtonThemeData().copyWith(
    backgroundColor: AppColors.secondaryColorDarkTheme,
    foregroundColor: AppColors.whiteDarkTheme,
  );

  /// LIGHT theme getter
  static ThemeData get lightTheme => _lightTheme;

  /// DARK theme getter
  static ThemeData get darkTheme => _darkTheme;

  /// [ThemeData] used to make light and dark instances
  static ThemeData _themeData({
    required ColorScheme colorScheme,
    required TextTheme textTheme,
    required AppBarTheme appBarTheme,
    required BottomNavigationBarThemeData bottomNavigationBarThemeData,
    required FloatingActionButtonThemeData floatingActionButtonThemeData,
  }) {
    return ThemeData(
      fontFamily: 'Roboto',
      textTheme: textTheme,
      colorScheme: colorScheme,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      brightness: colorScheme.brightness,
      bottomNavigationBarTheme: bottomNavigationBarThemeData,
      floatingActionButtonTheme: floatingActionButtonThemeData,
    );
  }
}
