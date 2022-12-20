import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:surf_study_project/assets/res/app_assets.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/common/widgets/buttons/icon_button_card.dart';
import 'package:surf_study_project/features/places_list/widgets/favorite_button/favorite_button_wm.dart';

/// Main widget for FavoriteButton feature
class FavoriteButtonWidget extends ElementaryWidget<FavoriteButtonWidgetModel> {
  /// Gets [Place] to operate with
  final Place place;

  /// Creates an instance [FavoriteButtonWidget].
  const FavoriteButtonWidget({
    required this.place,
    Key? key,
    WidgetModelFactory wmFactory = favoriteButtonWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IFavoriteButtonWidgetModel wm) {
    return StateNotifierBuilder<bool>(
      listenableState: wm.isFavorite,
      builder: (_, isFavorite) {
        return CardIconButton(
          iconPath: !isFavorite! ? AppAssets.heart : AppAssets.heartFull,
          onPressed: wm.onFavoriteButtonPressed,
          buttonSize: Size(24.w, 24.w),
        );
      },
    );
  }
}
