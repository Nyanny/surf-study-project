import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/colors/app_colors.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/settings_colors.dart';
import 'package:surf_study_project/features/settings/widgets/onboarding_launcher/onboarding_launcher_widget.dart';
import 'package:surf_study_project/features/settings/widgets/theme_switcher/theme_switcher_widget.dart';

/// Class [SettingsScreen] is screen for settings feature
/// Represents [ListView] with [ListTile] that are ElementaryWidget
class SettingsScreen extends StatelessWidget {
  /// constructor
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SettingsColors>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.settingsAppbarTitle,
          style: AppTypography.subtitle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 24.w),
        child: ListView(
          children: [
            const _ListItem(
              listItemWidget: ThemeSwitcherWidget(
                activeSwitcherColor: AppColors.greenDarkTheme,
                inactiveSwitcherColor:
                    AppColors.secondary2WithOpacityColorLightTheme,
              ),
            ),
            _ListItem(
              listItemWidget: OnboardingLauncherWidget(
                buttonColor: theme?.buttonsGreenColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final Widget listItemWidget;

  const _ListItem({
    required this.listItemWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        listItemWidget,
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
