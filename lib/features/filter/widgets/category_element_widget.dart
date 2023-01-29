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
  /// Used theme
  final FilterColors? colors;

  /// flag for 'vote' icon
  final bool categoryIsSet;

  /// [PlaceType] in this widget
  final PlaceType placeType;

  /// onTap callback
  final Function(PlaceType placeType) onTap;

  /// Constructor
  const CategoryElementWidget({
    required this.colors,
    required this.categoryIsSet,
    required this.placeType,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(placeType),
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
                    placeType.iconPath,
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
                placeType.title,
                style: AppTypography.superSmallText
                    .copyWith(color: colors?.categoryButtonTitle),
              ),
            ],
          ),
          if (categoryIsSet)
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
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
