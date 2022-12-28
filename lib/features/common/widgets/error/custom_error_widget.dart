import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/placeholder_colors.dart';
import 'package:surf_study_project/features/common/widgets/error/error_picture.dart';

/// Class [CustomErrorWidget] is a widget with error icon and [errorMessage]
class CustomErrorWidget extends StatelessWidget {
  /// Message text shown with picture
  final String errorMessage;

  /// constructor
  const CustomErrorWidget({
    Key? key,
    this.errorMessage = AppStrings.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<PlaceholderColors>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ErrorPicture(),
        SizedBox(height: 24.w),
        Text(
          AppStrings.error,
          style: AppTypography.subtitle
              .copyWith(color: theme?.placeholderMessageColor),
        ),
        SizedBox(height: 8.w),
        Text(
          errorMessage,
          style: AppTypography.smallText.copyWith(
            color: theme?.placeholderMessageColor,
          ),
        ),
      ],
    );
  }
}
