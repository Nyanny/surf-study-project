import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_study_project/features/widgets/onboarding_widgets/skip_button_widget.dart';
import 'package:surf_study_project/features/widgets/onboarding_widgets/start_button_widget.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          /// [SkipButtonWidget] - TextButton
          if (!isLastPage)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SkipButtonWidget(
                onPressed: onPressed,
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

          /// [StartButtonWidget] - ElevatedButton
          if (isLastPage)
            StartButtonWidget(
              onPressed: onPressed,
            ),
        ],
      ),
    );
  }
}
