import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

/// Class [OnboardingIcon] is an scale animated icon
class OnboardingIcon extends StatefulWidget {
  /// Path to svg picture
  final String assetPath;

  /// Theme colors
  final Color? iconColor;

  /// constructor
  const OnboardingIcon({
    required this.assetPath,
    required this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingIcon> createState() => _OnboardingIconState();
}

class _OnboardingIconState extends State<OnboardingIcon>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInCubic,
  );

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: SizedBox(
        height: 104.w,
        width: 104.w,
        child: SvgPicture.asset(
          widget.assetPath,
          color: widget.iconColor,
        ),
      ),
    );
  }
}
