import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// [CardIconButton] is a common widget.
/// Used as button on cards
class CardIconButton extends StatelessWidget {
  /// path to SVG icon
  final String iconPath;

  /// onPressed callback
  final VoidCallback? onPressed;

  /// icon color
  final Color color;

  /// size of whole button
  final Size buttonSize;

  /// constructor
  const CardIconButton({
    required this.iconPath,
    required this.onPressed,
    required this.color,
    required this.buttonSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: buttonSize.height,
        width: buttonSize.width,
        child: SvgPicture.asset(
          iconPath,
          color: color,
        ),
      ),
    );
  }
}
