import 'package:flutter/material.dart';
import 'package:surf_study_project/features/common/widgets/error/custom_error_widget.dart';

/// Class [ErrorScreen] is a screen with [CustomErrorWidget] in the center
class ErrorScreen extends StatelessWidget {
  /// constructor
  const ErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomErrorWidget(),
    );
  }
}
