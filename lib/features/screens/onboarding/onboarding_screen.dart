import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:surf_study_project/features/screens/onboarding/onboarding_screen_wm.dart';

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
    return Stack(
      children: [
        PageView.builder(
          itemCount: wm.itemCount,
          itemBuilder: wm.itemBuilder,
          controller: wm.pageController,
        ),
        Container(
          alignment: Alignment(wm.dotsPositionHorizontal, 1),
          padding: EdgeInsets.only(bottom: wm.dotsPaddingVerticalBottom),
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
    );
  }
}
