import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';

/// Class [OnboardingPageWidget] is the page: [AppBar] with button that shows depends on [isLastPage], [SvgPicture], a description with [title] and [subtitle], [ElevatedButton] that shows depends on [isLastPage].
class OnboardingPageWidget extends StatelessWidget {
  final bool isLastPage;
  final SvgPicture picture;
  final Text title;
  final Text subtitle;
  final VoidCallback? onPressed;

  const OnboardingPageWidget({
    Key? key,
    required this.isLastPage,
    required this.picture,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (!isLastPage)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextButton(
                onPressed: onPressed,
                child: Text(
                  AppStrings.skipButton,
                  style: AppTypography.text
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
        ],
      ),

      /// page content
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 172),
              child: SizedBox(
                width: 244,
                height: 246,
                child: Column(
                  /// Picture
                  children: [
                    SizedBox(
                      height: 104,
                      width: 104,
                      child: picture,
                    ),
                    const Divider(
                      color: Colors.transparent,
                      height: 40,
                    ),

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
            ),
          ),

          /// [ElevatedButton]
          if (isLastPage)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  minimumSize: const Size.fromHeight(48),
                ),
                onPressed: onPressed,
                child: const Text(
                  AppStrings.startButton,
                  style: AppTypography.smallBoldText,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
