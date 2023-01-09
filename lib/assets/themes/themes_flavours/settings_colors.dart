import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

// ignore_for_file: public_member_api_docs

/// [SettingsColors]  is [ThemeExtension]
/// Defines colors for settings elements based on design
@immutable
class SettingsColors extends ThemeExtension<SettingsColors> {
  // the light theme
  static const light = SettingsColors(
    buttonsGreenColor: AppColors.greenLightTheme,
  );

  // the dark theme
  static const dark = SettingsColors(
    buttonsGreenColor: AppColors.greenDarkTheme,
  );

  final Color buttonsGreenColor;

  const SettingsColors({
    required this.buttonsGreenColor,
  });

  @override
  SettingsColors copyWith({
    Color? buttonsGreenColor,
  }) {
    return SettingsColors(
      buttonsGreenColor: buttonsGreenColor ?? this.buttonsGreenColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  SettingsColors lerp(ThemeExtension<SettingsColors>? other, double t) {
    if (other is! SettingsColors) {
      return this;
    }
    return SettingsColors(
      buttonsGreenColor: Color.lerp(
        buttonsGreenColor,
        other.buttonsGreenColor,
        t,
      )!,
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'SettingsColors( '
      'buttonsGreenColor: $buttonsGreenColor '
      ')';
}
