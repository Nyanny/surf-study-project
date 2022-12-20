import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/card_colors.dart';

/// Description part of Card
class CardDescription extends StatelessWidget {
  /// Card title
  final String title;

  /// Card description
  final String description;

  /// Constructor with [title] and [description]
  const CardDescription({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Text(
            title,
            style: AppTypography.text.copyWith(
              color: Theme.of(context).extension<CardColors>()?.cardTitleColor,
            ),
          ),
          SizedBox(
            height: 2.w,
            width: double.infinity,
          ),

          /// description
          Text(
            description,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: AppTypography.superSmallText.copyWith(
              color: Theme.of(context)
                  .extension<CardColors>()
                  ?.cardDescriptionColor,
            ),
          ),
        ],
      ),
    );
  }
}
