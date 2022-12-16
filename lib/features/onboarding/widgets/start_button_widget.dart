import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/onboarding_colors.dart';

/// Class [StartButtonWidget] - a start button that ends
/// Presents [ElevatedButton]
/// [onPressed] is a [VoidCallback] that is supplied with the class initialization
class StartButtonWidget extends StatelessWidget {
  /// callback for the button [StartButtonWidget]
  final VoidCallback? onPressed;

  /// [StartButtonWidget] constructor
  const StartButtonWidget({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<OnboardingColors>();

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.w),
        ),
        backgroundColor: theme?.startButtonColor,
        minimumSize: Size.fromHeight(48.w),
      ),
      onPressed: onPressed,
      child: Text(
        AppStrings.startButton,
        style: AppTypography.smallBoldText.copyWith(
          color: theme?.startButtonTitleColor,
        ),
      ),
    );
  }
}
