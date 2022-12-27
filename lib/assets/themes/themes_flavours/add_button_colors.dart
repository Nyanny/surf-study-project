import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

// ignore_for_file: public_member_api_docs

/// [AddButtonColors] is [ThemeExtension]
/// Defines colors for AddButton based on design
@immutable
class AddButtonColors extends ThemeExtension<AddButtonColors> {
  // the light theme
  static const light = AddButtonColors(
    iconColor: AppColors.whiteLightTheme,
    buttonTextColor: AppColors.mainColorLightTheme,
    buttonColor: AppColors.greenLightTheme,
    colorToLinear: AppColors.yellowLightTheme,
  );

  // the dark theme
  static const dark = AddButtonColors(
    iconColor: AppColors.whiteDarkTheme,
    buttonTextColor: AppColors.mainColorLightTheme,
    buttonColor: AppColors.greenDarkTheme,
    colorToLinear: AppColors.yellowDarkTheme,
  );

  final Color iconColor;
  final Color buttonTextColor;
  final Color buttonColor;
  final Color colorToLinear;

  const AddButtonColors({
    required this.iconColor,
    required this.buttonTextColor,
    required this.buttonColor,
    required this.colorToLinear,
  });

  @override
  AddButtonColors copyWith({
    Color? iconColor,
    Color? buttonTextColor,
    Color? buttonColor,
    Color? colorToLinear,
  }) {
    return AddButtonColors(
      iconColor: iconColor ?? this.iconColor,
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
      buttonColor: buttonColor ?? this.buttonColor,
      colorToLinear: colorToLinear ?? this.colorToLinear,
    );
  }

  // Controls how the properties change on theme changes
  @override
  AddButtonColors lerp(ThemeExtension<AddButtonColors>? other, double t) {
    if (other is! AddButtonColors) {
      return this;
    }
    return AddButtonColors(
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      buttonTextColor: Color.lerp(buttonTextColor, other.buttonTextColor, t)!,
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t)!,
      colorToLinear: Color.lerp(colorToLinear, other.colorToLinear, t)!,
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'AddButtonColors('
      'iconColor: $iconColor, buttonTextColor: $buttonTextColor, buttonColor: $buttonColor, colorToLinear: $colorToLinear, '
      ')';
}
