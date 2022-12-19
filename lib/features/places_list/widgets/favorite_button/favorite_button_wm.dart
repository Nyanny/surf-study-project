import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/card_colors.dart';
import 'package:surf_study_project/features/places_list/widgets/favorite_button/favorite_button_export.dart';

/// Factory for [FavoriteButtonWidgetModel].
FavoriteButtonWidgetModel favoriteButtonWmFactory(
  BuildContext context,
) {
  final model = FavoriteButtonModel();
  return FavoriteButtonWidgetModel(model);
}

/// Widget model for [FavoriteButtonWidget].
class FavoriteButtonWidgetModel
    extends WidgetModel<FavoriteButtonWidget, FavoriteButtonModel>
    implements IFavoriteButtonWidgetModel {
  final StateNotifier<bool> _isFavorite = StateNotifier<bool>(initValue: false);

  @override
  ListenableState<bool> get isFavorite => _isFavorite;

  @override
  VoidCallback get onFavoriteButtonPressed => _onFavoriteButtonPressed;

  @override
  Color get iconColor => Theme.of(context).extension<CardColors>()!.iconColor;

  /// Create an instance [FavoriteButtonWidgetModel].
  FavoriteButtonWidgetModel(FavoriteButtonModel model) : super(model);

  void _onFavoriteButtonPressed() {
    var isFavoriteValue = _isFavorite.value;
    isFavoriteValue = !isFavoriteValue!;
    _isFavorite.accept(isFavoriteValue);
  }
}

/// Interface of [IFavoriteButtonWidgetModel].
abstract class IFavoriteButtonWidgetModel extends IWidgetModel {
  /// [ListenableState] that returns bool value
  /// when true - current Place is favorite
  ListenableState<bool> get isFavorite;

  /// [VoidCallback] that called when the button is pressed
  VoidCallback get onFavoriteButtonPressed;

  /// icon color
  Color get iconColor;
}
