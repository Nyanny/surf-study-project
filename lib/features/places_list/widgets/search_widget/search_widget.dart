import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_study_project/assets/res/app_assets.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/place_list_colors.dart';

/// Class [SearchWidget] is a search bar with 2 [IconButton] and [TextField]
class SearchWidget extends StatelessWidget {
  /// on search button callback
  final VoidCallback onSearchButtonTap;

  /// on filter button callback
  final VoidCallback onFilterButtonTap;

  /// constructor
  const SearchWidget({
    required this.onSearchButtonTap,
    required this.onFilterButtonTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PlaceListColors>();
    return AppBar(
      title: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme?.searchBackgroundColor,
        ),
        child: Row(
          children: [
            /// 'leading' - search icon
            IconButton(
              onPressed: onSearchButtonTap,
              icon: SvgPicture.asset(
                AppAssets.search,
                height: 24.w,
                width: 24.w,
                color: theme?.searchColor,
              ),
            ),

            /// search text field
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppStrings.hintSearch,
                  hintStyle: AppTypography.text.copyWith(
                    color: theme?.searchColor,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),

            /// 'trailing' - filter icon button
            IconButton(
              onPressed: onFilterButtonTap,
              icon: SvgPicture.asset(
                AppAssets.filter,
                height: 24.w,
                width: 24.w,
                color: theme?.filterIconColor,
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
