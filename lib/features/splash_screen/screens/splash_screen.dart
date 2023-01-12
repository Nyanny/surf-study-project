import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';
import 'package:surf_study_project/assets/res/app_assets.dart';
import 'package:surf_study_project/features/splash_screen/screens/splash_screen_wm.dart';

/// Class [SplashScreen] is a screen for a splash feature
/// Represents rotating svg picture on gradient background
class SplashScreen extends ElementaryWidget<ISplashScreenWidgetModel> {
  /// Create an instance [SplashScreen].
  const SplashScreen({
    Key? key,
    WidgetModelFactory wmFactory = splashScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISplashScreenWidgetModel wm) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.yellowLightTheme,
              AppColors.greenLightTheme,
            ],
          ),
        ),
        child: RotationTransition(
          turns: wm.animation,
          child: SvgPicture.asset(
            AppAssets.splashLogo,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
