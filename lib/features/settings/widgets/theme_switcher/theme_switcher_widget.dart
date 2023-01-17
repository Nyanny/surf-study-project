import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/features/settings/widgets/theme_switcher/theme_switcher_wm.dart';

/// Class [ThemeSwitcherWidget] is [ElementaryWidget]
/// Represents [ListTile]
/// Main feature - theme switcher
class ThemeSwitcherWidget extends ElementaryWidget<IThemeSwitcherWidgetModel> {
  /// active switcher color
  final Color activeSwitcherColor;

  /// inactive switcher color
  final Color inactiveSwitcherColor;

  /// Create an instance [ThemeSwitcherWidget].
  const ThemeSwitcherWidget({
    required this.activeSwitcherColor,
    required this.inactiveSwitcherColor,
    Key? key,
    WidgetModelFactory wmFactory = themeSwitcherWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IThemeSwitcherWidgetModel wm) {
    return ListTile(
      minVerticalPadding: 18.w,
      title: const Text(
        AppStrings.settingsTheme,
      ),
      trailing: StateNotifierBuilder<bool>(
        listenableState: wm.themeState,
        builder: (_, isDark) => SizedBox(
          height: 32.w,
          width: 56.w,
          child: FittedBox(
            alignment: Alignment.centerRight,
            child: CupertinoSwitch(
              value: isDark ?? false,
              onChanged: wm.themeLightingChanged,
            ),
          ),
        ),
      ),
    );
  }
}
