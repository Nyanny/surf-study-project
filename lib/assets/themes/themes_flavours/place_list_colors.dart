import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

// ignore_for_file: public_member_api_docs

/// [PlaceListColors]  is [ThemeExtension]
/// Defines colors for AddButton based on design
@immutable
class PlaceListColors extends ThemeExtension<PlaceListColors> {
  // the light theme
  static const light = PlaceListColors(
    filterIconColor: AppColors.greenLightTheme,
    searchColor: AppColors.secondary2WithOpacityColorLightTheme,
    searchBackgroundColor: AppColors.backgroundColorLightTheme,
    titleAppBarColor: AppColors.mainColorLightTheme,
  );

  // the dark theme
  static const dark = PlaceListColors(
    filterIconColor: AppColors.greenDarkTheme,
    searchColor: AppColors.secondary2WithOpacityColorDarkTheme,
    searchBackgroundColor: AppColors.blackColorDarkTheme,
    titleAppBarColor: AppColors.whiteDarkTheme,
  );

  final Color filterIconColor;
  final Color searchColor;
  final Color searchBackgroundColor;
  final Color titleAppBarColor;

  const PlaceListColors({
    required this.filterIconColor,
    required this.searchColor,
    required this.searchBackgroundColor,
    required this.titleAppBarColor,
  });

  @override
  PlaceListColors copyWith({
    Color? filterIconColor,
    Color? searchColor,
    Color? searchBackgroundColor,
    Color? titleAppBarColor,
  }) {
    return PlaceListColors(
      filterIconColor: filterIconColor ?? this.filterIconColor,
      searchColor: searchColor ?? this.searchColor,
      searchBackgroundColor:
          searchBackgroundColor ?? this.searchBackgroundColor,
      titleAppBarColor: titleAppBarColor ?? this.titleAppBarColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  PlaceListColors lerp(ThemeExtension<PlaceListColors>? other, double t) {
    if (other is! PlaceListColors) {
      return this;
    }
    return PlaceListColors(
      filterIconColor: Color.lerp(filterIconColor, other.filterIconColor, t)!,
      searchColor: Color.lerp(searchColor, other.searchColor, t)!,
      searchBackgroundColor:
          Color.lerp(searchBackgroundColor, other.searchBackgroundColor, t)!,
      titleAppBarColor:
          Color.lerp(titleAppBarColor, other.titleAppBarColor, t)!,
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'PlaceListColors('
      'filterIconColor: $filterIconColor, searchColor: $searchColor, '
      'searchBackgroundColor: $searchBackgroundColor, titleAppBarColor: $titleAppBarColor '
      ')';
}
