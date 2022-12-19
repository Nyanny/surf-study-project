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

  /// icon size
  final Size iconSize;

  /// size of whole button
  final Size buttonSize;

  /// padding between icon and button edges
  final EdgeInsetsGeometry iconPadding;

  /// constructor
  const CardIconButton({
    required this.iconPath,
    required this.onPressed,
    required this.color,
    required this.iconSize,
    required this.buttonSize,
    required this.iconPadding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: buttonSize.height,
        width: buttonSize.width,
        padding: iconPadding,
        child: SvgPicture.asset(
          iconPath,
          color: color,
          height: iconSize.height,
          width: iconSize.width,
        ),
      ),
    );
  }
}
