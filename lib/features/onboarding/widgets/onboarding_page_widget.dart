import 'package:flutter/material.dart';
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
    final theme = Theme.of(context).extension<OnboardingColors>()!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 172),
            child: SizedBox(
              width: 244,
              height: 246,
              child: Column(
                /// Picture
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 104,
                      width: 104,
                      child: SvgPicture.asset(
                        assetPath,
                        color: theme.iconColor,
                      ),
                    ),
                  ),

                  /// Description block
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        /// Title
                        Text(
                          title,
                          style: AppTypography.title.copyWith(
                            color: theme.titleColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Divider(
                          color: Colors.transparent,
                          height: 8,
                        ),

                        /// Subtitle
                        Text(
                          subtitle,
                          style: AppTypography.smallText.copyWith(
                            color: theme.descriptionColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
