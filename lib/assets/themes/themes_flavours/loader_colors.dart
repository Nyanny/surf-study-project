import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

// ignore_for_file: public_member_api_docs

/// [LoaderColors]  is [ThemeExtension]
/// Defines colors for AddButton based on design
@immutable
class LoaderColors extends ThemeExtension<LoaderColors> {
  // the light theme
  static const light = LoaderColors(
    defaultIndicatorBaseColor: AppColors.backgroundColorLightTheme,
    defaultIndicatorGradientColor:
        AppColors.secondary2WithOpactiryColorLightTheme,
    fancyIndicatorBaseColor: AppColors.greenLightTheme,
    fancyIndicatorGradientColor: AppColors.yellowLightTheme,
  );

  // the dark theme
  static const dark = LoaderColors(
    defaultIndicatorBaseColor: AppColors.darkColorDarkTheme,
    defaultIndicatorGradientColor: AppColors.mainColorLightTheme,
    fancyIndicatorBaseColor: AppColors.greenDarkTheme,
    fancyIndicatorGradientColor: AppColors.yellowDarkTheme,
  );

  final Color defaultIndicatorBaseColor;
  final Color defaultIndicatorGradientColor;
  final Color fancyIndicatorBaseColor;
  final Color fancyIndicatorGradientColor;

  const LoaderColors({
    required this.defaultIndicatorBaseColor,
    required this.defaultIndicatorGradientColor,
    required this.fancyIndicatorBaseColor,
    required this.fancyIndicatorGradientColor,
  });

  @override
  LoaderColors copyWith({
    Color? defaultIndicatorBaseColor,
    Color? defaultIndicatorGradientColor,
    Color? fancyIndicatorBaseColor,
    Color? fancyIndicatorGradientColor,
  }) {
    return LoaderColors(
      defaultIndicatorBaseColor:
          defaultIndicatorBaseColor ?? this.defaultIndicatorBaseColor,
      defaultIndicatorGradientColor:
          defaultIndicatorGradientColor ?? this.defaultIndicatorGradientColor,
      fancyIndicatorBaseColor:
          fancyIndicatorBaseColor ?? this.fancyIndicatorBaseColor,
      fancyIndicatorGradientColor:
          fancyIndicatorGradientColor ?? this.fancyIndicatorGradientColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  LoaderColors lerp(ThemeExtension<LoaderColors>? other, double t) {
    if (other is! LoaderColors) {
      return this;
    }
    return LoaderColors(
      defaultIndicatorBaseColor: Color.lerp(
        defaultIndicatorBaseColor,
        other.defaultIndicatorBaseColor,
        t,
      )!,
      defaultIndicatorGradientColor: Color.lerp(
        defaultIndicatorGradientColor,
        other.defaultIndicatorGradientColor,
        t,
      )!,
      fancyIndicatorBaseColor: Color.lerp(
        fancyIndicatorBaseColor,
        other.fancyIndicatorBaseColor,
        t,
      )!,
      fancyIndicatorGradientColor: Color.lerp(
        fancyIndicatorGradientColor,
        other.fancyIndicatorGradientColor,
        t,
      )!,
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CustomColors( '
      'defaultIndicatorBaseColor: $defaultIndicatorBaseColor, defaultIndicatorGradientColor: $defaultIndicatorGradientColor, '
      'fancyIndicatorBaseColor: $fancyIndicatorBaseColor, fancyIndicatorGradientColor: $fancyIndicatorGradientColor, '
      ')';
}
