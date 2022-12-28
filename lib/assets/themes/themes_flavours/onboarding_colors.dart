import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

// ignore_for_file: public_member_api_docs

/// [OnboardingColors]  is [ThemeExtension]
/// Defines colors for AddButton based on design
@immutable
class OnboardingColors extends ThemeExtension<OnboardingColors> {
  // the light theme
  static const light = OnboardingColors(
    iconColor: AppColors.mainColorLightTheme,
    titleColor: AppColors.mainColorLightTheme,
    descriptionColor: AppColors.secondaryColorLightTheme,
    dotsColor: AppColors.secondary2WithOpacityColorLightTheme,
    dotsActiveColor: AppColors.greenLightTheme,
    startButtonColor: AppColors.greenLightTheme,
    startButtonTitleColor: AppColors.whiteLightTheme,
    skipButtonTitleColor: AppColors.greenLightTheme,
  );

  // the dark theme
  static const dark = OnboardingColors(
    iconColor: AppColors.whiteDarkTheme,
    titleColor: AppColors.whiteDarkTheme,
    descriptionColor: AppColors.secondary2ColorDarkTheme,
    dotsColor: AppColors.secondary2WithOpacityColorDarkTheme,
    dotsActiveColor: AppColors.greenDarkTheme,
    startButtonColor: AppColors.greenDarkTheme,
    startButtonTitleColor: AppColors.whiteDarkTheme,
    skipButtonTitleColor: AppColors.greenDarkTheme,
  );

  final Color iconColor;
  final Color titleColor;
  final Color descriptionColor;
  final Color dotsColor;
  final Color dotsActiveColor;
  final Color startButtonColor;
  final Color startButtonTitleColor;
  final Color skipButtonTitleColor;

  const OnboardingColors({
    required this.iconColor,
    required this.titleColor,
    required this.descriptionColor,
    required this.dotsColor,
    required this.dotsActiveColor,
    required this.startButtonColor,
    required this.startButtonTitleColor,
    required this.skipButtonTitleColor,
  });

  @override
  OnboardingColors copyWith({
    Color? iconColor,
    Color? titleColor,
    Color? descriptionColor,
    Color? dotsColor,
    Color? dotsActiveColor,
    Color? startButtonColor,
    Color? startButtonTitleColor,
    Color? skipButtonTitleColor,
  }) {
    return OnboardingColors(
      iconColor: iconColor ?? this.iconColor,
      titleColor: titleColor ?? this.titleColor,
      descriptionColor: descriptionColor ?? this.descriptionColor,
      dotsColor: dotsColor ?? this.dotsColor,
      dotsActiveColor: dotsActiveColor ?? this.dotsActiveColor,
      startButtonColor: startButtonColor ?? this.startButtonColor,
      startButtonTitleColor:
          startButtonTitleColor ?? this.startButtonTitleColor,
      skipButtonTitleColor: skipButtonTitleColor ?? this.skipButtonTitleColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  OnboardingColors lerp(ThemeExtension<OnboardingColors>? other, double t) {
    if (other is! OnboardingColors) {
      return this;
    }
    return OnboardingColors(
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      titleColor: Color.lerp(titleColor, other.titleColor, t)!,
      descriptionColor:
          Color.lerp(descriptionColor, other.descriptionColor, t)!,
      dotsColor: Color.lerp(dotsColor, other.dotsColor, t)!,
      dotsActiveColor: Color.lerp(dotsActiveColor, other.dotsActiveColor, t)!,
      startButtonColor:
          Color.lerp(startButtonColor, other.startButtonColor, t)!,
      startButtonTitleColor:
          Color.lerp(startButtonTitleColor, other.startButtonTitleColor, t)!,
      skipButtonTitleColor:
          Color.lerp(skipButtonTitleColor, other.skipButtonTitleColor, t)!,
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'OnboardingColors('
      'iconColor: $iconColor, titleColor: $titleColor, descriptionColor: $descriptionColor,  '
      'dotsColor: $dotsColor, dotsActiveColor: $dotsActiveColor,  startButtonColor: $startButtonColor, '
      'startButtonTitleColor: $startButtonTitleColor, skipButtonTitleColor: $skipButtonTitleColor '
      ')';
}
