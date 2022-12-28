import 'dart:math' as math;

import 'package:flutter/material.dart';

/// To those who will try to understand how it works, I recommend this sources:
/// https://eisbaer.medium.com/flutter-circular-gradient-progress-e0f7c113484
/// https://stackoverflow.com/questions/63615001/how-to-create-gradient-progress-indicator-like-this
/// https://youtu.be/vvI_NUXK00s

/// Class [CustomProgressIndicator] paints gradient circular progress indicator
/// [size] - indicator size
/// [primaryColor] - main color gradient for
/// [secondaryColor] - secondary color, "trail"
class CustomProgressIndicator extends StatefulWidget {
  /// inicator size, default is 40
  final double size;

  /// main color gradient for
  final Color primaryColor;

  /// secondary color, "trail"
  final Color secondaryColor;

  /// lap ducation, default is 1000
  final int lapDuration;

  /// strokeWidth, default is 6
  final double strokeWidth;

  /// Constructor
  const CustomProgressIndicator({
    required this.primaryColor,
    required this.secondaryColor,
    this.size = 40,
    this.lapDuration = 1000,
    this.strokeWidth = 6.0,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.lapDuration),
    );
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(_animationController),
        child: CustomPaint(
          painter: CirclePainter(
            secondaryColor: widget.secondaryColor,
            primaryColor: widget.primaryColor,
            strokeWidth: widget.strokeWidth,
          ),
          size: Size(widget.size, widget.size),
        ),
      ),
    );
  }
}

/// Class [CirclePainter] paints gradient circle
class CirclePainter extends CustomPainter {
  /// primary color
  final Color primaryColor;

  /// secondary color
  final Color secondaryColor;

  /// stroke width
  final double strokeWidth;

  /// constructor with parameters by default
  CirclePainter({
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.strokeWidth = 15,
  });

  @override
  void paint(Canvas canvas, Size size) {
    /// helper variable, centerPoint
    final centerPoint = size.height / 2;

    /// paints object with [color], [strokeCap], [style], [strokeWidth]
    final paint = Paint()
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth

      /// [SweepGradient] helps our paint object to be able to add that gradient effect on the stroke
      ..shader = SweepGradient(
        colors: [secondaryColor, primaryColor],
        tileMode: TileMode.repeated,
        startAngle: _degreeToRad(270),
        endAngle: _degreeToRad(270 + 360.0),
      ).createShader(
        Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: 0),
      );

    /// a scapSize which will be like the 70% of the stroke width to be able to consider wider strokes
    final scapSize = strokeWidth * 0.70;

    /// scapToDegree which will be this scapSize / centerPoint,
    /// this will provide compensation for the circumference of the arc
    final scapToDegree = scapSize / centerPoint;

    /// if set it to 0.0 and 2*pi it wont be rounded
    final startAngle = _degreeToRad(270) + scapToDegree;
    final sweepAngle = _degreeToRad(360) - (scapToDegree * 2);

    /// begin and end with strokeWidth / 2
    final rect = Offset(strokeWidth / 2, strokeWidth / 2) &
        Size(size.width - strokeWidth, size.height - strokeWidth);

    /// painting process into the canvas
    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      paint..color = primaryColor,
    );
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return true;
  }

  /// A helper function which will turn degrees into radians
  double _degreeToRad(double degree) => degree * math.pi / 180;
}
