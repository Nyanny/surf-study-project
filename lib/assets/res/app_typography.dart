import 'package:flutter/rendering.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';

class AppTypography {
  /// [largeTitle] defines Roboto font with color [AppColors.secondaryColorWhiteTheme], font size 32, line height 36, font weight 700
  static const largeTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32.0,
    height: 36 / 32,
    fontWeight: FontWeight.w700,
    color: AppColors.secondaryColorWhiteTheme,
  );

  /// [title] defines Roboto font with color [AppColors.secondaryColorWhiteTheme], font size 24, line height 28.8, font weight 700
  static const title = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24.0,
    height: 28.8 / 24,
    fontWeight: FontWeight.w700,
    color: AppColors.secondaryColorWhiteTheme,
  );

  /// [subtitle] defines Roboto font with color [AppColors.secondaryColorWhiteTheme], font size 18, line height 24, font weight 500
  static const subtitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    height: 24 / 18,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryColorWhiteTheme,
  );

  /// [text] defines Roboto font with color [AppColors.secondaryColorWhiteTheme], font size 16, line height 20, font weight 500
  static const text = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0,
    height: 20 / 16,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryColorWhiteTheme,
  );

  /// [smallBoldText] defines Roboto font with color [AppColors.secondaryColorWhiteTheme], font size 14, line height 18, font weight 700
  static const smallBoldText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    height: 18 / 14,
    fontWeight: FontWeight.w700,
    color: AppColors.secondaryColorWhiteTheme,
  );

  /// [smallText] defines Roboto font with color [AppColors.secondaryColorWhiteTheme], font size 14, line height 18, font weight 500
  static const smallText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    height: 18 / 14,
    fontWeight: FontWeight.w500,
    color: AppColors.secondaryColorWhiteTheme,
  );

  /// [superSmallText] defines Roboto font with color [AppColors.secondary2WithOpactiryColorWhiteTheme], font size 12, line height 16, font weight 400
  static const superSmallText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.0,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary2WithOpactiryColorWhiteTheme,
  );

  /// [buttonText] defines Roboto font with color [AppColors.secondaryColorWhiteTheme], font size 14, line height 18, font weight 700, letterSpacing 0.48 (0.03em)
  static const buttonText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0,
    height: 18 / 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.48,
    color: AppColors.secondaryColorWhiteTheme,
  );
}
