import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/onboarding_colors.dart';

/// Class [OnboardingPageWidget] is the page shows [SvgPicture], a description with [title] and [subtitle].
class OnboardingPageWidget extends StatelessWidget {
  /// [assetPath] path to the asset, that shows on page, above all other elements
  final String assetPath;

  /// [title] of the page, below [assetPath]
  final String title;

  /// [subtitle] of the page, below [title]
  final String subtitle;

  /// [OnboardingPageWidget] constructor
  const OnboardingPageWidget({
    required this.assetPath,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<OnboardingColors>();

    return SizedBox(
      width: 244.w,
      height: 246.w + kToolbarHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,

        /// Picture
        children: [
          SizedBox(
            // height: 104,
            // width: 104,
            height: 104.w,
            width: 104.w,
            child: SvgPicture.asset(
              assetPath,
              color: theme?.iconColor,
            ),
          ),
          SizedBox(
            height: 40.w,
          ),

          /// Description block
          Column(
            children: [
              /// Title
              SizedBox(
                width: 244.w,
                height: 58.w,
                child: Text(
                  title,
                  style: AppTypography.title.copyWith(
                    color: theme?.titleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 8.w,
              ),

              /// Subtitle
              SizedBox(
                width: 244.w,
                height: 36.w,
                child: Text(
                  subtitle,
                  style: AppTypography.smallText.copyWith(
                    color: theme?.descriptionColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),

          const SizedBox(height: kToolbarHeight),
        ],
      ),
    );
  }
}
