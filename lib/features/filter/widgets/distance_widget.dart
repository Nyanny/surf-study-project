import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/filters_colors.dart';

/// Class [DistanceWidget] is [Slider] with title. When slider changed also changes showing distance
class DistanceWidget extends StatelessWidget {
  /// min instance
  final double minDistanceValue;

  /// max distance
  final double maxDistanceValue;

  /// slider value
  final double sliderValue;

  /// used theme
  final FilterColors? colors;

  /// onSliderChanged callback
  final ValueChanged<double>? onSliderChanged;

  /// constructor
  const DistanceWidget({
    required this.minDistanceValue,
    required this.maxDistanceValue,
    required this.sliderValue,
    required this.onSliderChanged,
    required this.colors,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 4.w,
        bottom: 8.w,
        left: 16.w,
        right: 16.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.filterDistanceName,
                style: AppTypography.text
                    .copyWith(fontWeight: FontWeight.w400, color: colors?.main),
              ),
              Text(
                '${AppStrings.filterDistanceValueTo} ${maxDistanceValue.toInt()} ${AppStrings.filterDistanceUnitKilometers}',
                style: AppTypography.text
                    .copyWith(color: colors?.distanceInformationColor),
              ),
            ],
          ),
          SizedBox(
            height: 24.w,
          ),
          Slider(
            min: minDistanceValue,
            max: maxDistanceValue,
            value: sliderValue,
            onChanged: onSliderChanged,
          ),
        ],
      ),
    );
  }
}
