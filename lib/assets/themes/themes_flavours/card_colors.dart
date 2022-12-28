import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

// ignore_for_file: public_member_api_docs

/// [CardColors]  is [ThemeExtension]
/// Defines colors for card based on design
@immutable
class CardColors extends ThemeExtension<CardColors> {
  // the light theme
  static const light = CardColors(
    tagColor: AppColors.whiteLightTheme,
    iconColor: AppColors.whiteLightTheme,
    cardTitleColor: AppColors.secondaryColorLightTheme,
    cardDescriptionColor: AppColors.secondary2ColorLightTheme,
    cardBackgroundColor: AppColors.backgroundColorLightTheme,
  );

  // the dark theme
  static const dark = CardColors(
    tagColor: AppColors.whiteDarkTheme,
    iconColor: AppColors.whiteDarkTheme,
    cardTitleColor: AppColors.whiteDarkTheme,
    cardDescriptionColor: AppColors.secondary2ColorDarkTheme,
    cardBackgroundColor: AppColors.blackColorDarkTheme,
  );

  final Color tagColor;
  final Color iconColor;
  final Color cardTitleColor;
  final Color cardDescriptionColor;
  final Color cardBackgroundColor;

  const CardColors({
    required this.tagColor,
    required this.iconColor,
    required this.cardTitleColor,
    required this.cardDescriptionColor,
    required this.cardBackgroundColor,
  });

  @override
  CardColors copyWith({
    Color? tagColor,
    Color? iconColor,
    Color? cardTitleColor,
    Color? cardDescriptionColor,
    Color? cardBackgroundColor,
  }) {
    return CardColors(
      tagColor: tagColor ?? this.tagColor,
      iconColor: iconColor ?? this.iconColor,
      cardTitleColor: cardTitleColor ?? this.cardTitleColor,
      cardDescriptionColor: cardDescriptionColor ?? this.cardDescriptionColor,
      cardBackgroundColor: cardBackgroundColor ?? this.cardBackgroundColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CardColors lerp(ThemeExtension<CardColors>? other, double t) {
    if (other is! CardColors) {
      return this;
    }
    return CardColors(
      tagColor: Color.lerp(tagColor, other.tagColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      cardTitleColor: Color.lerp(cardTitleColor, other.cardTitleColor, t)!,
      cardDescriptionColor:
          Color.lerp(cardDescriptionColor, other.cardDescriptionColor, t)!,
      cardBackgroundColor:
          Color.lerp(cardBackgroundColor, other.cardBackgroundColor, t)!,
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CardColors('
      'tagColor: $tagColor, iconColor: $iconColor, cardTitleColor: $cardTitleColor, '
      'cardDescriptionColor: $cardDescriptionColor, cardBackgroundColor: $cardBackgroundColor, '
      ')';
}
