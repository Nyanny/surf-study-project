import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

// ignore_for_file: public_member_api_docs

/// [MainColors]  is [ThemeExtension]
/// Defines colors for settings elements based on design
@immutable
class MainColors extends ThemeExtension<MainColors> {
  // the light theme
  static const light = MainColors(
    bottomNavBarItemColor: AppColors.secondaryColorLightTheme,
  );

  // the dark theme
  static const dark = MainColors(
    bottomNavBarItemColor: AppColors.whiteDarkTheme,
  );

  final Color bottomNavBarItemColor;

  const MainColors({
    required this.bottomNavBarItemColor,
  });

  @override
  MainColors copyWith({
    Color? bottomNavBarItemColor,
  }) {
    return MainColors(
      bottomNavBarItemColor:
          bottomNavBarItemColor ?? this.bottomNavBarItemColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  MainColors lerp(ThemeExtension<MainColors>? other, double t) {
    if (other is! MainColors) {
      return this;
    }
    return MainColors(
      bottomNavBarItemColor: Color.lerp(
        bottomNavBarItemColor,
        other.bottomNavBarItemColor,
        t,
      )!,
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'MainColors( '
      'bottomNavBarItemActiveColor: $bottomNavBarItemColor '
      ')';
}
