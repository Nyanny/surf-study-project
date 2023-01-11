import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_study_project/assets/res/app_assets.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/features/settings/widgets/onboarding_launcher/onboarding_launcher_wm.dart';

/// [OnboardingLauncherWidget] is [ElementaryWidget]
/// Represents [ListTile]
/// Main feature - launch onboarding
class OnboardingLauncherWidget
    extends ElementaryWidget<IOnboardingLauncherWidgetModel> {
  /// button color
  final Color? buttonColor;

  /// constructor
  const OnboardingLauncherWidget({
    required this.buttonColor,
    Key? key,
    WidgetModelFactory wmFactory = onboardingScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IOnboardingLauncherWidgetModel wm) {
    return ListTile(
      title: const Text(
        AppStrings.settingsTutorial,
      ),
      trailing: IconButton(
        onPressed: wm.launchOnboarding,
        icon: SvgPicture.asset(
          AppAssets.info,
          color: buttonColor,
        ),
      ),
    );
  }
}
