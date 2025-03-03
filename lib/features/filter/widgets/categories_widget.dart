import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/filters_colors.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';
import 'package:surf_study_project/features/filter/widgets/category_element_widget.dart';

/// Class [CategoriesWidget] shows categories grid with title
class CategoriesWidget extends StatelessWidget {
  /// callback category onTap
  final Function(bool, PlaceType) onCategoryTap;

  /// theme to use
  final FilterColors? colors;

  /// list of bool flag is active type or not
  final List<bool> placeTypeActiveList;

  /// constructor
  const CategoriesWidget({
    required this.colors,
    required this.onCategoryTap,
    required this.placeTypeActiveList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Padding(
          padding: EdgeInsets.only(left: 16.0.w),
          child: Text(
            AppStrings.filterCategory,
            style: AppTypography.superSmallText.copyWith(
              color: colors?.categoryTitleColor,
            ),
          ),
        ),
        SizedBox(
          height: 24.w,
        ),

        /// Categories grid
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w),
          child: GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 96.w / 92.w,
              mainAxisSpacing: 40.w,
              crossAxisSpacing: 12.w,
              crossAxisCount: 3,
            ),
            children: PlaceType.values
                .map<CategoryElementWidget>((e) => CategoryElementWidget(
                      colors: colors,
                      onTap: onCategoryTap,
                      categoryIsSet: placeTypeActiveList.elementAt(e.index),
                      placeType: e,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
