import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/filters_colors.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';
import 'package:surf_study_project/features/filter/screens/filter_screen/filter_screen.dart';
import 'package:surf_study_project/features/filter/screens/filter_screen/filter_screen_model.dart';

/// Factory for [FilterScreenWidgetModel].
FilterScreenWidgetModel filterScreenWmFactory(
  BuildContext context,
) {
  final model = FilterScreenModel();
  return FilterScreenWidgetModel(model);
}

/// Class [FilterScreenWidgetModel] is widget model for [FilterScreen]
class FilterScreenWidgetModel
    extends WidgetModel<FilterScreen, FilterScreenModel>
    implements IFilterScreenWidgetModel {
  final List<bool> _placeTypeActiveList =
      List.filled(PlaceType.values.length, false);
  final double _sliderValue = 10;

  @override
  FilterColors? get filterColors => Theme.of(context).extension<FilterColors>();

  @override
  Function(bool categorySet, PlaceType placeType) get onCategoryTap =>
      _onCategoryTap;

  // TODO(nyanny): should be edited in the next special task
  @override
  List<bool> get placeTypeActiveList => _placeTypeActiveList;

  @override
  double get maxDistanceValue => 30;

  @override
  double get minDistanceValue => 0;

  @override
  ValueChanged<double>? get onSliderChanged => _onSliderChanged;

  @override
  double get sliderValue => _sliderValue;

  /// constructor
  FilterScreenWidgetModel(FilterScreenModel model) : super(model);

  // TODO(nyanny): should be edited in the next special task
  double _onSliderChanged(double value) {
    return value;
  }

  // TODO(nyanny): should be edited in the next special task
  void _onCategoryTap(bool categorySet, PlaceType placeType) {}
}

/// [IWidgetModel] interface for [FilterScreenWidgetModel]
abstract class IFilterScreenWidgetModel extends IWidgetModel {
  /// theme of Filter feature
  FilterColors? get filterColors;

  /// on category tap callback
  Function(bool categorySet, PlaceType placeType) get onCategoryTap;

  /// list of flags whether filter is active or not
  List<bool> get placeTypeActiveList;

  /// min value for slider
  double get minDistanceValue;

  /// max value for slider
  double get maxDistanceValue;

  /// slider value
  double get sliderValue;

  /// callback for slider
  ValueChanged<double>? get onSliderChanged;
}
