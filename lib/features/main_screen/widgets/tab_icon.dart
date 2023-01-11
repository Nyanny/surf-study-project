import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/main_colors.dart';

/// Class [TabIcon] is class that creates default icon for [BottomNavigationBar] in the Main feature
class TabIcon extends StatelessWidget {
  /// path to svg icon to show
  final String iconSVGPath;

  /// Constructor
  const TabIcon({
    required this.iconSVGPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MainColors>();
    return SvgPicture.asset(
      iconSVGPath,
      color: theme?.bottomNavBarItemColor,
    );
  }
}
