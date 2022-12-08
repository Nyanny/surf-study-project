import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';

/// Class [SkipButtonWidget] - a skip button that animates to the next page
/// Presents [TextButton]
/// [onPressed] is a [VoidCallback] that is supplied with the class initialization
class SkipButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const SkipButtonWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        AppStrings.skipButton,
        style: AppTypography.text
            .copyWith(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
