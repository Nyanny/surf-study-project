import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

// ignore_for_file: public_member_api_docs

/// [FilterColors]  is [ThemeExtension]
/// Defines colors for AddButton based on design
@immutable
class FilterColors extends ThemeExtension<FilterColors> {
  // the light theme
  static const light = FilterColors(
    clearButtonTitleColor: AppColors.greenLightTheme,
    categoryTitleColor: AppColors.secondary2WithOpacityColorLightTheme,
    buttonColor: AppColors.greenLightTheme,
    categoryButtonTitle: AppColors.secondaryColorLightTheme,
    main: AppColors.mainColorLightTheme,
    distanceInformationColor: AppColors.secondary2ColorLightTheme,
    tickColor: AppColors.whiteLightTheme,
    tickBackgroundColor: AppColors.mainColorLightTheme,
  );

  // the dark theme
  static const dark = FilterColors(
    clearButtonTitleColor: AppColors.greenDarkTheme,
    categoryTitleColor: AppColors.secondary2WithOpacityColorDarkTheme,
    buttonColor: AppColors.greenDarkTheme,
    categoryButtonTitle: AppColors.whiteDarkTheme,
    main: AppColors.whiteDarkTheme,
    distanceInformationColor: AppColors.secondary2ColorDarkTheme,
    tickColor: AppColors.mainColorDarkTheme,
    tickBackgroundColor: AppColors.whiteDarkTheme,
  );

  final Color clearButtonTitleColor;
  final Color categoryTitleColor;
  final Color buttonColor;
  final Color categoryButtonTitle;
  final Color main;
  final Color distanceInformationColor;
  final Color tickColor;
  final Color tickBackgroundColor;

  // final Color buttonColor;

  const FilterColors({
    required this.clearButtonTitleColor,
    required this.categoryTitleColor,
    required this.buttonColor,
    required this.categoryButtonTitle,
    required this.main,
    required this.distanceInformationColor,
    required this.tickColor,
    required this.tickBackgroundColor,
  });

  @override
  FilterColors copyWith({
    Color? clearButtonTitleColor,
    Color? categoryTitleColor,
    Color? buttonColor,
    Color? categoryButtonTitle,
    Color? main,
    Color? distanceInformationColor,
    Color? tickColor,
    Color? tickBackgroundColor,
  }) {
    return FilterColors(
      clearButtonTitleColor:
          clearButtonTitleColor ?? this.clearButtonTitleColor,
      categoryTitleColor: categoryTitleColor ?? this.categoryTitleColor,
      buttonColor: buttonColor ?? this.buttonColor,
      categoryButtonTitle: categoryButtonTitle ?? this.categoryButtonTitle,
      main: main ?? this.main,
      distanceInformationColor:
          distanceInformationColor ?? this.distanceInformationColor,
      tickColor: tickColor ?? this.tickColor,
      tickBackgroundColor: tickBackgroundColor ?? this.tickBackgroundColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  FilterColors lerp(ThemeExtension<FilterColors>? other, double t) {
    if (other is! FilterColors) {
      return this;
    }
    return FilterColors(
      clearButtonTitleColor: Color.lerp(
        clearButtonTitleColor,
        other.clearButtonTitleColor,
        t,
      )!,
      categoryTitleColor: Color.lerp(
        categoryTitleColor,
        other.categoryTitleColor,
        t,
      )!,
      buttonColor: Color.lerp(
        buttonColor,
        other.buttonColor,
        t,
      )!,
      categoryButtonTitle: Color.lerp(
        categoryButtonTitle,
        other.categoryButtonTitle,
        t,
      )!,
      main: Color.lerp(
        main,
        other.main,
        t,
      )!,
      distanceInformationColor: Color.lerp(
        distanceInformationColor,
        other.distanceInformationColor,
        t,
      )!,
      tickColor: Color.lerp(
        tickColor,
        other.tickColor,
        t,
      )!,
      tickBackgroundColor: Color.lerp(
        tickBackgroundColor,
        other.tickBackgroundColor,
        t,
      )!,
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'FilterColors( '
      'clearButtonTitleColor: $clearButtonTitleColor, categoryTitleColor: $categoryTitleColor, '
      'buttonColor: $buttonColor, categoryButtonTitle: $categoryButtonTitle, '
      'main: $main, distanceInformationColor: $distanceInformationColor, '
      'tickColor: $tickColor, tickBackgroundColor: $tickBackgroundColor, '
      ')';
}
