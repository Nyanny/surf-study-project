import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_study_project/assets/res/app_assets.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/filters_colors.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';

/// Class [CategoryElementWidget]
/// Tappable Column with icon, name and 'vote'
class CategoryElementWidget extends StatelessWidget {
  /// path to svg asset
  final String svgPicturePath;

  /// Name of the current category
  final String categoryName;

  /// Used theme
  final FilterColors? colors;

  /// flag for 'vote' icon
  final bool categoryIsSet;

  /// [PlaceType] in this widget
  final PlaceType placeType;

  /// onTap callback
  final Function(bool categorySet, PlaceType placeType) onTap;

  /// Constructor
  const CategoryElementWidget({
    required this.svgPicturePath,
    required this.categoryName,
    required this.colors,
    required this.onTap,
    required this.categoryIsSet,
    required this.placeType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(categoryIsSet, placeType),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 64.w,
                    width: 64.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors?.buttonColor.withOpacity(0.16),
                    ),
                  ),
                  SvgPicture.asset(
                    svgPicturePath,
                    color: colors?.buttonColor,
                    height: 32.w,
                    width: 32.w,
                  ),
                ],
              ),
              SizedBox(
                width: 0,
                height: 12.w,
              ),
              Text(
                categoryName,
                style: AppTypography.superSmallText
                    .copyWith(color: colors?.categoryButtonTitle),
              ),
            ],
          ),
          Positioned(
            top: 45.w,
            left: 62.w,
            child: Container(
              width: 16.w,
              height: 16.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors?.tickBackgroundColor,
              ),
              child: SvgPicture.asset(
                AppAssets.tick,
                color: colors?.tickColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
