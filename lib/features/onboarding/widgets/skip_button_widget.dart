import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/onboarding_colors.dart';

/// Class [SkipButtonWidget] - a skip button that animates to the next page
/// Presents [TextButton] that can be animated opacity and then de;eted from widget tree if [shouldDisappear] is true
/// [shouldDisappear] is a flag for opacity
/// [onPressed] is a [VoidCallback] that is supplied with the class initialization
class SkipButtonWidget extends StatefulWidget {
  /// callback for the button [SkipButtonWidget]
  final VoidCallback? onPressed;

  /// flag whether this widget should disappear
  final bool shouldDisappear;

  /// [SkipButtonWidget] constructor
  const SkipButtonWidget({
    required this.onPressed,
    required this.shouldDisappear,
    Key? key,
  }) : super(key: key);

  @override
  State<SkipButtonWidget> createState() => _SkipButtonWidgetState();
}

class _SkipButtonWidgetState extends State<SkipButtonWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  );
  late final Animation<double> _animation = Tween<double>(
    begin: 1,
    end: 0,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  /// flag fot [Visibility]
  bool _visibility = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.forward();

    /// removes fully transparent widget from widget tree
    if (widget.shouldDisappear) {
      Future.delayed(const Duration(microseconds: 700001), () {
        if (mounted) {
          setState(() {
            _visibility = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final child = TextButton(
      onPressed: widget.onPressed,
      child: Text(
        AppStrings.skipButton,
        style: AppTypography.text.copyWith(
          color: Theme.of(context)
              .extension<OnboardingColors>()
              ?.skipButtonTitleColor,
        ),
      ),
    );
    return Visibility(
      visible: _visibility,
      child: widget.shouldDisappear
          ? FadeTransition(
              opacity: _animation,
              child: child,
            )
          : child,
    );
  }
}
