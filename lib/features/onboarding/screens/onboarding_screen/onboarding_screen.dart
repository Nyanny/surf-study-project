import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:surf_study_project/features/onboarding/screens/onboarding_screen/onboarding_screen_wm.dart';
import 'package:surf_study_project/features/onboarding/widgets/onboarding_page_widget.dart';
import 'package:surf_study_project/features/onboarding/widgets/skip_button_widget.dart';
import 'package:surf_study_project/features/onboarding/widgets/start_button_widget.dart';

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
                  ? SkipButtonWidget(
                      onPressed: wm.skipButtonAction,
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            PageView.builder(
              padEnds: false,
              onPageChanged: wm.onPageChanged,
              itemCount: wm.itemCount,
              itemBuilder: (context, index) {
                return Center(
                  child: OnboardingPageWidget(
                    assetPath: wm.pageData[index].picturePath,
                    title: wm.pageData[index].title,
                    subtitle: wm.pageData[index].subtitle,
                    scaleAnimation: wm.scaleAnimation,
                  ),
                );
              },
              controller: wm.pageController,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                bottom: 88.w,
              ),
              child: SmoothPageIndicator(
                controller: wm.pageController,
                count: wm.itemCount,
                effect: ExpandingDotsEffect(
                  dotHeight: 8.w,
                  dotWidth: 8.w,
                  dotColor: wm.onboardingTheme?.dotsColor ?? Colors.transparent,
                  activeDotColor:
                      wm.onboardingTheme?.dotsActiveColor ?? Colors.transparent,
                  radius: 8.w,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: StateNotifierBuilder<bool>(
                listenableState: wm.isLastPage,
                builder: (_, isLastPage) {
                  return isLastPage!
                      ? Padding(
                          padding: EdgeInsets.only(
                            right: 16.w,
                            left: 16.w,
                            bottom: 8.w,
                          ),
                          child: StartButtonWidget(
                            onPressed: wm.startButtonAction,
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
