import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

const _child = ColoredBox(
  color: Colors.green,
);

/// Class [ShimmerSkeleton] is shimming skeleton using shimmer pakcage
class ShimmerSkeleton extends StatelessWidget {
  /// is shimmer enabled
  final bool shimmerEnabled;

  /// base color
  final Color baseColor;

  /// shimmering color
  final Color highlightColor;

  /// [Widget] child
  final Widget child;

  /// constructor
  const ShimmerSkeleton({
    required this.baseColor,
    required this.highlightColor,
    this.shimmerEnabled = true,
    this.child = _child,
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
