import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:surf_study_project/features/screens/onboarding/onboarding_screen_wm.dart';
import 'package:surf_study_project/features/widgets/onboarding_widgets/skip_button_widget.dart';
import 'package:surf_study_project/features/widgets/onboarding_widgets/start_button_widget.dart';

/// Main widget for OnboardingScreen feature
class OnboardingScreen extends ElementaryWidget<IOnboardingScreenWidgetModel> {
  /// Create an instance [OnboardingScreen].
  const OnboardingScreen({
    Key? key,
    WidgetModelFactory wmFactory = onboardingScreenWmFactory,
  }) : super(wmFactory, key: key);

  /// [PageView.builder] with parameters from [IOnboardingScreenWidgetModel]
  @override
  Widget build(IOnboardingScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          StateNotifierBuilder<bool>(
            listenableState: wm.isLastPage,
            builder: (_, isLastPage) {
              return !isLastPage!
                  ? SkipButtonWidget(onPressed: wm.skipButtonAction)
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  onPageChanged: wm.onPageChanged,
                  itemCount: wm.itemCount,
                  itemBuilder: wm.itemBuilder,
                  controller: wm.pageController,
                ),
                Container(
                  alignment: Alignment(wm.dotsPositionHorizontal, -1),
                  padding: EdgeInsets.only(top: wm.dotsPaddingVerticalTop),
                  child: SmoothPageIndicator(
                    controller: wm.pageController,
                    count: wm.itemCount,
                    effect: ExpandingDotsEffect(
                      dotHeight: wm.dotSize,
                      dotWidth: wm.dotSize,
                      dotColor: wm.dotColor,
                      activeDotColor: wm.activeDotColor,
                      radius: wm.dotSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
          StateNotifierBuilder<bool>(
            listenableState: wm.isLastPage,
            builder: (_, isLastPage) {
              return isLastPage!
                  ? Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: StartButtonWidget(
                        onPressed: wm.startButtonAction,
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
