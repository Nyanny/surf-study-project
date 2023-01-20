import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/features/places_list/widgets/search_widget/search_widget.dart';

/// Class [PlacesListAppBar] is [SliverAppBar] with [LayoutBuilder] implemented in [_Header]
class PlacesListAppBar extends StatelessWidget {
  /// callback onTap search button
  final VoidCallback onSearchButtonTap;

  /// callback onTap filter button
  final VoidCallback onFilterButtonTap;

  /// max expanded height
  final double maxHeight;

  /// min appbard height
  final double minHeight;

  /// constructor
  const PlacesListAppBar({
    required this.onSearchButtonTap,
    required this.onFilterButtonTap,
    required this.maxHeight,
    required this.minHeight,
    Key? key,
  }) : super(key: key);

  /// Builds pinned [SliverAppBar] with flexibleSpace [_Header]
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      flexibleSpace: _Header(
        maxHeight: maxHeight,
        minHeight: minHeight,
      ),
      expandedHeight: maxHeight - MediaQuery.of(context).padding.top,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(62.w),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 8.w),
          child: SearchWidget(
            onSearchButtonTap: onSearchButtonTap,
            onFilterButtonTap: onFilterButtonTap,
          ),
        ),
      ),
    );
  }
}

/// Private class [_Header]
/// Returns [LayoutBuilder]
class _Header extends StatelessWidget {
  final double maxHeight;
  final double minHeight;

  const _Header({
    required this.maxHeight,
    required this.minHeight,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final expandRatio = _calculateExpandRatio(constraints);
        final animation = AlwaysStoppedAnimation(expandRatio);

        /// Content of AppBar
        return Stack(
          fit: StackFit.expand,
          children: [
            _TitleWidget(
              animation: animation,
            ),
          ],
        );
      },
    );
  }

  /// Calculates the expand/collapse ratio
  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio =
        (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }
}

/// Title of the AppBar
/// Text travels animated from left to centre (or vice versa) with changing it's style
class _TitleWidget extends StatelessWidget {
  final Animation<double> animation;

  const _TitleWidget({
    required this.animation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize =
        Tween<double>(begin: 18.sp, end: 32.sp).evaluate(animation);
    final height =
        Tween<double>(begin: (24 / 18).w, end: (36 / 32).w).evaluate(animation);

    return Align(
      alignment: AlignmentTween(
        begin: Alignment.bottomCenter,
        end: Alignment.bottomLeft,
      ).evaluate(animation),
      child: Container(
        margin: EdgeInsets.lerp(
          EdgeInsets.zero,
          EdgeInsets.only(left: 16.w, bottom: 16.w),
          animation.value,
        ),
        child: Text(
          AppStrings.interestingPlaces,
          style: TextStyle(
            fontSize: fontSize,
            height: height,
          ),
        ),
      ),
    );
  }
}
