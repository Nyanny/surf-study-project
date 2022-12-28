import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_study_project/assets/res/app_assets.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/placeholder_colors.dart';

/// Class [ErrorPicture] shows svg picture with [iconSize]
/// Main feature of this class is change colors by theme's changes
class ErrorPicture extends StatelessWidget {
  /// icon size
  final Size? iconSize;

  /// constructor
  const ErrorPicture({
    this.iconSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.delete,
      color: Theme.of(context)
          .extension<PlaceholderColors>()
          ?.placeholderIconColor,
      height: iconSize?.height ?? 64.w,
      width: iconSize?.width ?? 64.w,
    );
  }
}
