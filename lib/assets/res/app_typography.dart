import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Class [AppTypography] that holds all [TextStyle] used in the app
class AppTypography {
  /// [largeTitle] defines Roboto font with, font size 32, line height 36, font weight 700
  static final largeTitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 32.0.sp,
    height: 36 / 32,
    fontWeight: FontWeight.w700,
  );

  /// [title] defines Roboto font with color font size 24, line height 28.8, font weight 700
  static final title = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 24.0.sp,
    height: 28.8 / 24,
    fontWeight: FontWeight.w700,
  );

  /// [subtitle] defines Roboto font with font size 18, line height 24, font weight 500
  static final subtitle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0.sp,
    height: 24 / 18,
    fontWeight: FontWeight.w500,
  );

  /// [text] defines Roboto font with font size 16, line height 20, font weight 500
  static final text = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.0.sp,
    height: 20 / 16,
    fontWeight: FontWeight.w500,
  );

  /// [smallBoldText] defines Roboto font with font size 14, line height 18, font weight 700
  static final smallBoldText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0.sp,
    height: 18 / 14,
    fontWeight: FontWeight.w700,
  );

  /// [smallText] defines Roboto font with font size 14, line height 18, font weight 500
  static final smallText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0.sp,
    height: 18 / 14,
    fontWeight: FontWeight.w400,
  );

  /// [superSmallText] defines Roboto font with font size 12, line height 16, font weight 400
  static final superSmallText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12.0.sp,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
  );

  /// [buttonText] defines Roboto font with font size 14, line height 18, font weight 700, letterSpacing 0.48 (0.03em)
  static final buttonText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.0.sp,
    height: 18 / 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.48,
  );
}
