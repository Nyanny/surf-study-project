import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Class [ShimmerSkeleton] is shimming skeleton using shimmer pakcage
class ShimmerSkeleton extends StatelessWidget {
  /// is shimmer enabled
  final bool shimmerEnabled;

  /// base color
  final Color baseColor;

  /// shimmering color
  final Color highlightColor;

  /// [Widget] chi;d
  final Widget child;

  /// constructor
  const ShimmerSkeleton({
    this.shimmerEnabled = true,
    required this.baseColor,
    required this.highlightColor,
    this.child = const SizedBox.expand(),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: shimmerEnabled,
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: child,
    );
  }
}
