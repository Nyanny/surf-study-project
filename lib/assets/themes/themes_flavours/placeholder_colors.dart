import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

// ignore_for_file: public_member_api_docs

/// [PlaceholderColors]  is [ThemeExtension]
/// Defines colors for AddButton based on design
@immutable
class PlaceholderColors extends ThemeExtension<PlaceholderColors> {
  // the light theme
  static const light = PlaceholderColors(
    placeholderIconColor: AppColors.secondary2WithOpacityColorLightTheme,
    placeholderMessageColor: AppColors.secondary2WithOpacityColorLightTheme,
  );

  // the dark theme
  static const dark = PlaceholderColors(
    placeholderIconColor: AppColors.secondary2WithOpacityColorDarkTheme,
    placeholderMessageColor: AppColors.secondary2WithOpacityColorDarkTheme,
  );

  final Color placeholderIconColor;
  final Color placeholderMessageColor;

  const PlaceholderColors({
    required this.placeholderIconColor,
    required this.placeholderMessageColor,
  });

  @override
  PlaceholderColors copyWith({
    Color? placeholderIconColor,
    Color? placeholderMessageColor,
  }) {
    return PlaceholderColors(
      placeholderIconColor: placeholderIconColor ?? this.placeholderIconColor,
      placeholderMessageColor:
          placeholderMessageColor ?? this.placeholderMessageColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  PlaceholderColors lerp(ThemeExtension<PlaceholderColors>? other, double t) {
    if (other is! PlaceholderColors) {
      return this;
    }
    return PlaceholderColors(
      placeholderIconColor: Color.lerp(
        placeholderIconColor,
        other.placeholderIconColor,
        t,
      )!,
      placeholderMessageColor: Color.lerp(
        placeholderMessageColor,
        other.placeholderMessageColor,
        t,
      )!,
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'PlaceholderColors( '
      'placeholderIconColor: $placeholderIconColor, placeholderMessageColor: $placeholderMessageColor, '
      ')';
}
