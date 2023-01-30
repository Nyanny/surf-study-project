import 'dart:async';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/filters_colors.dart';
import 'package:surf_study_project/features/app/di/app_scope.dart';
import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocation_coordinates.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';
import 'package:surf_study_project/features/common/widgets/alert_dialog/location_alert_dialog.dart';
import 'package:surf_study_project/features/filter/screens/filter_screen/filter_screen.dart';
import 'package:surf_study_project/features/filter/screens/filter_screen/filter_screen_model.dart';
import 'package:surf_study_project/features/geolocation/bloc/geolocation_bloc.dart';
import 'package:surf_study_project/features/navigation/service/router.dart';

/// Factory for [FilterScreenWidgetModel].
FilterScreenWidgetModel filterScreenWmFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final router = appDependencies.router;
  final model = FilterScreenModel(
    appDependencies.geolocationBloc,
    appDependencies.appSettingsService,
    appDependencies.placeService,
  );
  return FilterScreenWidgetModel(model, router);
}

/// Class [FilterScreenWidgetModel] is widget model for [FilterScreen]
class FilterScreenWidgetModel
    extends WidgetModel<FilterScreen, IFilterScreenModel>
    implements IFilterScreenWidgetModel {
  final AppRouter _appRouter;
  late final StreamSubscription<GeolocationState> _stateGeolocationSubscription;
  final _foundPlacesCount = EntityStateNotifier<int>();

  @override
  Function(PlaceType placeType) get onCategoryTap => _onCategoryTap;

  @override
  FilterColors? get filterColors => Theme.of(context).extension<FilterColors>();

  @override
  VoidCallback get onBackButtonTap => _onBackButtonTap;

  @override
  double get maxDistanceValue => 600000;

  @override
  double get minDistanceValue => 1;

  @override
  ValueChanged<double>? get onSliderChanged => _onSliderChanged;

  @override
  ListenableState<double> get sliderValue => model.range;

  @override
  ListenableState<Set<PlaceType>> get categoriesListenableState =>
      model.categoriesListenableState;

  @override
  VoidCallback get onClearButtonTap => _onClearButtonTap;

  @override
  VoidCallback get onShowButtonTap => _commitFilter;

  @override
  ListenableState<EntityState<int>> get foundPlacesCount => _foundPlacesCount;

  late GeolocationCoordinates _geolocationCoordinates;

  List<Place> _places = [];
  bool _initialLaunch = true;

  /// [Timer] instance
  Timer? _placeListDebounced;

  /// constructor
  FilterScreenWidgetModel(FilterScreenModel model, this._appRouter)
      : super(model);

  @override
  Future<void> initWidgetModel() async {
    super.initWidgetModel();
    _stateGeolocationSubscription =
        model.geolocationStateStream.listen(_updateState);
    model.getCoordinates();
  }

  @override
  void dispose() {
    _stateGeolocationSubscription.cancel();
    super.dispose();
  }

  void _onSliderChanged(double value) {
    model.setRange(value);
    _loadPlaceListFilteredDebounced();
  }

  void _loadPlaceListFilteredDebounced() {
    _placeListDebounced?.cancel();
    _placeListDebounced = Timer(const Duration(milliseconds: 500), () async {
      await _loadPlaceListFiltered();
    });
  }

  Future<void> _loadPlaceListFiltered() async {
    _foundPlacesCount.loading();
    model.getCoordinates();
    try {
      _places = await model.getFilteredPlaces(
        geolocationCoordinates: _geolocationCoordinates,
      );
    } on Exception catch (_) {
      _places = [];
    }

    _foundPlacesCount.content(_places.length);
  }

  void _onCategoryTap(PlaceType placeType) {
    model.setFilterPlaceType(placeType: placeType);
    _loadPlaceListFilteredDebounced();
  }

  void _onBackButtonTap() {
    _appRouter.pop(false);
  }

  Future<void> _updateState(GeolocationState state) async {
    if (state is GeolocationLoaded) {
      _geolocationCoordinates = state.geolocation;

      /// bloc state takes some time to be calculated,
      /// so if call _loadPlaceListFiltered() in initWidgetModel() _geolocationCoordinates will be null
      if (_initialLaunch) {
        _initialLaunch = false;
        await _loadPlaceListFiltered();
      }
    } else if (state is GeolocationError) {
      _geolocationCoordinates = state.geolocationCoordinatesOnError;
      await showGeolocationAlertDialog(
        context: context,
        onAlertCloseTap: _onAlertCloseTap,
        onAlertSettingsTap: _onAlertSettingsTap,
      );
    }
  }

  void _onAlertCloseTap() {
    _appRouter.pop();
  }

  void _onAlertSettingsTap() {
    model.openAppSettings();
  }

  void _onClearButtonTap() {
    model.clearFilterData();

    _loadPlaceListFilteredDebounced();
  }

  Future<void> _commitFilter() async {
    await model.saveFilterSettings();
    await _appRouter.pop(true);
    // _appRouter.pop(true);
  }
}

/// [IWidgetModel] interface for [FilterScreenWidgetModel]
abstract class IFilterScreenWidgetModel extends IWidgetModel {
  /// theme of Filter feature
  FilterColors? get filterColors;

  /// on category tap callback
  Function(PlaceType placeType) get onCategoryTap;

  // /// list of flags whether filter is active or not
  // List<bool> get placeTypeActiveList;
  //
  // Set<PlaceType> get placeTypeSet;

  /// min value for slider
  double get minDistanceValue;

  /// max value for slider
  double get maxDistanceValue;

  /// slider value
  ListenableState<double> get sliderValue;

  /// callback for slider
  ValueChanged<double>? get onSliderChanged;

  /// on back button pressed action
  VoidCallback get onBackButtonTap;

  /// on clear button pressed action
  VoidCallback get onClearButtonTap;

  /// on show button pressed action
  VoidCallback get onShowButtonTap;

  /// [ListenableState] of found places count
  ListenableState<EntityState<int>> get foundPlacesCount;

  /// [ListenableState] of  of [Set] of [PlaceType]
  ListenableState<Set<PlaceType>> get categoriesListenableState;
}
