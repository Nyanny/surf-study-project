import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

// ignore_for_file: public_member_api_docs

/// [PlaceListColors]  is [ThemeExtension]
/// Defines colors for AddButton based on design
@immutable
class PlaceListColors extends ThemeExtension<PlaceListColors> {
  // the light theme
  static const light = PlaceListColors(
    tagColor: AppColors.whiteLightTheme,
    favoriteIconColor: AppColors.whiteLightTheme,
    filterIconColor: AppColors.greenLightTheme,
    cardTitleColor: AppColors.secondaryColorLightTheme,
    cardDescriptionColor: AppColors.secondary2WithOpactiryColorLightTheme,
    searchColor: AppColors.secondary2WithOpactiryColorLightTheme,
  );

  // the dark theme
  static const dark = PlaceListColors(
    tagColor: AppColors.whiteDarkTheme,
    favoriteIconColor: AppColors.whiteDarkTheme,
    filterIconColor: AppColors.greenDarkTheme,
    cardTitleColor: AppColors.whiteDarkTheme,
    cardDescriptionColor: AppColors.secondary2ColorDarkTheme,
    searchColor: AppColors.secondary2WithOpactiryColorDarkTheme,
  );

  final Color tagColor;
  final Color favoriteIconColor;
  final Color filterIconColor;
  final Color cardTitleColor;
  final Color cardDescriptionColor;
  final Color searchColor;

  const PlaceListColors({
    required this.tagColor,
    required this.favoriteIconColor,
    required this.filterIconColor,
    required this.cardTitleColor,
    required this.cardDescriptionColor,
    required this.searchColor,
  });

  @override
  PlaceListColors copyWith({
    Color? tagColor,
    Color? favoriteIconColor,
    Color? filterIconColor,
    Color? cardTitleColor,
    Color? cardDescriptionColor,
    Color? searchColor,
  }) {
    return PlaceListColors(
      tagColor: tagColor ?? this.tagColor,
      favoriteIconColor: favoriteIconColor ?? this.favoriteIconColor,
      filterIconColor: filterIconColor ?? this.filterIconColor,
      cardTitleColor: cardTitleColor ?? this.cardTitleColor,
      cardDescriptionColor: cardDescriptionColor ?? this.cardDescriptionColor,
      searchColor: searchColor ?? this.searchColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  PlaceListColors lerp(ThemeExtension<PlaceListColors>? other, double t) {
    if (other is! PlaceListColors) {
      return this;
    }
    return PlaceListColors(
      tagColor: Color.lerp(tagColor, other.tagColor, t)!,
      favoriteIconColor:
          Color.lerp(favoriteIconColor, other.favoriteIconColor, t)!,
      filterIconColor: Color.lerp(filterIconColor, other.filterIconColor, t)!,
      cardTitleColor: Color.lerp(cardTitleColor, other.cardTitleColor, t)!,
      cardDescriptionColor:
          Color.lerp(cardDescriptionColor, other.cardDescriptionColor, t)!,
      searchColor: Color.lerp(searchColor, other.searchColor, t)!,
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CustomColors('
      'tagColor: $tagColor, favoriteIconColor: $favoriteIconColor, filterIconColor: $filterIconColor, '
      'cardTitleColor: $cardTitleColor, cardDescriptionColor: $cardDescriptionColor, searchColor: $searchColor, '
      ')';
}
