import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';

/// [LocationAlertDialog] showing message to permit location
class LocationAlertDialog extends StatelessWidget {
  /// [VoidCallback] on close button
  final VoidCallback onAlertCloseTap;

  /// [VoidCallback] on go to settings button
  final VoidCallback onAlertSettingsTap;

  /// constructor
  const LocationAlertDialog({
    required this.onAlertCloseTap,
    required this.onAlertSettingsTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(AppStrings.filterAlertTitle),
      content: const SingleChildScrollView(
        child: Text(AppStrings.filterAlertMessage),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(AppStrings.filterAlertClose),
          onPressed: onAlertCloseTap,
          // onPressed: router.pop,
        ),
        TextButton(
          child: const Text(AppStrings.filterAlertGotoSettings),
          onPressed: onAlertSettingsTap,
        ),
      ],
    );
  }
}
