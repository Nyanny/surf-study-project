import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/place_list_colors.dart';

/// Class [PlacesListAppBar] is [SliverAppBar] with [LayoutBuilder] implemented in [_FlexibleHeader]
class PlacesListAppBar extends StatelessWidget {
  /// max expanded height
  final double maxHeight;

  /// Theme colors
  final PlaceListColors? colors;

  /// constructor
  const PlacesListAppBar({
    required this.maxHeight,
    required this.colors,
    Key? key,
  }) : super(key: key);

  /// Builds pinned [SliverAppBar] with flexibleSpace
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: maxHeight,
      primary: false,
      toolbarHeight: kToolbarHeight.w,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(top: 30.w),
        centerTitle: true,
        title: _FlexibleHeader(
          colors: colors,
        ),
        background: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 40.w, 16.w, 0.w),
          child: Text(
            AppStrings.interestingPlacesExpanded,
            style: AppTypography.largeTitle
                .copyWith(color: colors?.titleAppBarColor),
          ),
        ),
      ),
    );
  }
}

/// Private class [_FlexibleHeader]
/// Returns [LayoutBuilder]
class _FlexibleHeader extends StatelessWidget {
  final PlaceListColors? colors;

  const _FlexibleHeader({
    required this.colors,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Visibility(
        visible: constraints.biggest.height < 90,
        child: AnimatedOpacity(
          opacity: constraints.biggest.height >= 45.w ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Text(
            AppStrings.interestingPlaces,
            style: AppTypography.subtitle
                .copyWith(color: colors?.titleAppBarColor),
          ),
        ),
      );
    });
  }
}
