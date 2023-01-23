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

  /// Theme colors
  final PlaceListColors? colors;

  /// constructor
  const SearchWidget({
    required this.onSearchButtonTap,
    required this.onFilterButtonTap,
    required this.colors,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 52.w,
      pinned: true,
      titleSpacing: 0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: 16.w,
        ),
        title: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colors?.searchBackgroundColor,
          ),
          child: Row(
            children: [
              /// 'leading' - search icon
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: onSearchButtonTap,
                icon: SvgPicture.asset(
                  AppAssets.search,
                  height: 24.w,
                  width: 24.w,
                  color: colors?.searchColor,
                ),
              ),

              /// search text field
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: AppStrings.hintSearch,
                    hintStyle: AppTypography.text.copyWith(
                      color: colors?.searchColor,
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
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: onFilterButtonTap,
                icon: SvgPicture.asset(
                  AppAssets.filter,
                  height: 24.w,
                  width: 24.w,
                  color: colors?.filterIconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
