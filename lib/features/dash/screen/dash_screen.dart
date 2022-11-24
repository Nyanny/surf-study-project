import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_study_project/features/dash/screen/dash_screen_wm.dart';

/// Main widget for DashScreen feature
class DashScreen extends ElementaryWidget<IDashScreenWidgetModel> {
  /// Create an instance [DashScreen].
  const DashScreen({
    Key? key,
    WidgetModelFactory wmFactory = dashScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDashScreenWidgetModel wm) {
    return ColoredBox(
      color: Colors.blue.shade50,
      child: const Center(
        child: Text('Dash screen view'),
      ),
    );
  }
}
