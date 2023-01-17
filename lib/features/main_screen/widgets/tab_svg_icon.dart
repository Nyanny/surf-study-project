import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/main_colors.dart';

/// Class [TabSvgIcon] is class that creates default icon for [BottomNavigationBar] in the Main feature
class TabSvgIcon extends StatelessWidget {
  /// path to svg icon to show
  final String iconSVGPath;

  /// Constructor
  const TabSvgIcon({
    required this.iconSVGPath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MainColors>();
    return SvgPicture.asset(
      iconSVGPath,
      height: 24.w,
      width: 24.w,
      color: theme?.bottomNavBarItemColor,
    );
  }
}
