import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_study_project/features/widgets/onboarding_widgets/skip_button_widget.dart';
import 'package:surf_study_project/features/widgets/onboarding_widgets/start_button_widget.dart';

/// Class [OnboardingPageWidget] is the page shows [SvgPicture], a description with [title] and [subtitle].
class OnboardingPageWidget extends StatelessWidget {
  /// [picture] that shows on page, above all other elements
  final SvgPicture picture;

  /// [title] of the page, below [picture]
  final Text title;

  /// [subtitle] of the page, below [title]
  final Text subtitle;

  /// [onPressed] is a callback of the button
  /// Can be animation to next page for [SkipButtonWidget] or action of [StartButtonWidget]
  final VoidCallback? onPressed;

  /// [OnboardingPageWidget] constructor
  const OnboardingPageWidget({
    required this.picture,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      child: picture,
                    ),
                  ),

                  /// Description block
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        /// Title
                        title,
                        const Divider(
                          color: Colors.transparent,
                          height: 8,
                        ),

                        /// Subtitle
                        subtitle,
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
