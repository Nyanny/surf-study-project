import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_study_project/assets/res/app_assets.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/features/filter/screens/filter_screen/filter_screen_wm.dart';
import 'package:surf_study_project/features/filter/widgets/categories_widget.dart';
import 'package:surf_study_project/features/filter/widgets/distance_widget.dart';

/// Class [FilterScreen] is main screen for Filter feature
/// There are [CategoriesWidget] block, [DistanceWidget] and elevated button beloew [ElevatedButton]
class FilterScreen extends ElementaryWidget<IFilterScreenWidgetModel> {
  /// Create an instance [FilterScreen].
  const FilterScreen({
    Key? key,
    WidgetModelFactory wmFactory = filterScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IFilterScreenWidgetModel wm) {
    return Scaffold(
      /// [AppBar]
      appBar: AppBar(
        /// back button
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.arrow,
            color: wm.filterColors?.main,
          ),
        ),

        /// clear button
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.filterClearButton,
              style: AppTypography.text,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: SizedBox(
              height: 24.w,
            ),
          ),

          /// Categories
          CategoriesWidget(
            colors: wm.filterColors,
            onCategoryTap: wm.onCategoryTap,
            placeTypeActiveList: wm.placeTypeActiveList,
          ),
          Flexible(
            child: SizedBox(
              height: 56.w,
            ),
          ),

          /// Distance
          DistanceWidget(
            minDistanceValue: wm.minDistanceValue,
            maxDistanceValue: wm.maxDistanceValue,
            sliderValue: wm.sliderValue,
            onSliderChanged: wm.onSliderChanged,
            colors: wm.filterColors,
          ),
          const Flexible(
            fit: FlexFit.tight,
            flex: 10,
            child: SizedBox(
              height: double.infinity,
            ),
          ),

          /// Button
          Container(
            padding: EdgeInsets.only(
              right: 16.w,
              left: 16.w,
              bottom: 8.w,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.w),
                ),
                // backgroundColor: theme?.startButtonColor,
                minimumSize: Size.fromHeight(48.w),
              ),
              onPressed: () {},
              child: Text(
                AppStrings.filterShowButton,
                style: AppTypography.smallBoldText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
