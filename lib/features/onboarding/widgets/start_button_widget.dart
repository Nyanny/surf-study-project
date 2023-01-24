import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/onboarding_colors.dart';

/// Class [StartButtonWidget] - a start button that ends onboarding
/// Presents [ElevatedButton] wrapped in [SlideTransition]
/// [onPressed] is a [VoidCallback] that is supplied with the class initialization
class StartButtonWidget extends StatefulWidget {
  /// callback for the button [StartButtonWidget]
  final VoidCallback? onPressed;

  /// theme colors
  final OnboardingColors? themeColors;

  /// [StartButtonWidget] constructor
  const StartButtonWidget({
    required this.onPressed,
    required this.themeColors,
    Key? key,
  }) : super(key: key);

  @override
  State<StartButtonWidget> createState() => _StartButtonWidgetState();
}

class _StartButtonWidgetState extends State<StartButtonWidget>
    with TickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    animation = Tween<Offset>(
      begin: const Offset(0.0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastLinearToSlowEaseIn,
    ));
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.w),
          ),
          backgroundColor: widget.themeColors?.startButtonColor,
          minimumSize: Size.fromHeight(48.w),
        ),
        onPressed: widget.onPressed,
        child: Text(
          AppStrings.startButton,
          style: AppTypography.smallBoldText.copyWith(
            color: widget.themeColors?.startButtonTitleColor,
          ),
        ),
      ),
    );
  }
}
