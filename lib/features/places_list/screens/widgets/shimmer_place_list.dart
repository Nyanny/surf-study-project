import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/card_colors.dart';
import 'package:surf_study_project/features/common/widgets/skeleton/shimmer_skeleton.dart';

/// Class [ShimmerPlaceList] is shimmer for place list feature
class ShimmerPlaceList extends StatelessWidget {
  /// constructor
  const ShimmerPlaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ...List<Widget>.generate(
            5,
            (_) => Padding(
              padding: EdgeInsets.only(bottom: 24.w),
              child: const _ShimmerPlaceCard(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShimmerPlaceCard extends StatelessWidget {
  const _ShimmerPlaceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CardColors>();
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: ShimmerSkeleton(
          baseColor: theme?.cardBackgroundColor ?? Colors.grey[300]!,
          highlightColor: Colors.white,
        ),
      ),
    );
  }
}
