import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/loader_colors.dart';
import 'package:surf_study_project/features/common/widgets/indicators/custom_loading_indicator.dart';

/// Class [PlacesListLoadingIndicator] is loading indicator for places list feature
/// Uses [CustomProgressIndicator] with parameters from the design
class PlacesListLoadingIndicator extends StatelessWidget {
  /// constructor
  const PlacesListLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<LoaderColors>()!;

    return CustomProgressIndicator(
      strokeWidth: 6.w,
      size: 40.w,
      secondaryColor: theme.defaultIndicatorBaseColor,
      primaryColor: theme.defaultIndicatorGradientColor,
    );
  }
}
