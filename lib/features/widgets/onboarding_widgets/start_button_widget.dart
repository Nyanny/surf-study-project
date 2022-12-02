import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';

/// Class [StartButtonWidget] - a start button that ends
/// Presents [ElevatedButton]
/// [onPressed] is a [VoidCallback] that is supplied with the class initialization
class StartButtonWidget extends StatelessWidget {
  const StartButtonWidget({Key? key, required this.onPressed})
      : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          minimumSize: const Size.fromHeight(48),
        ),
        onPressed: onPressed,
        child: const Text(
          AppStrings.startButton,
          style: AppTypography.smallBoldText,
        ),
      ),
    );
  }
}
