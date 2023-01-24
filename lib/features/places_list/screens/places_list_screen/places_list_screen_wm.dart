import 'dart:async';
import 'dart:ui';

import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/place_list_colors.dart';
import 'package:surf_study_project/features/app/di/app_scope.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/common/widgets/alert_dialog/location_alert_dialog.dart';
import 'package:surf_study_project/features/geolocation/bloc/geolocation_bloc.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';
import 'package:surf_study_project/features/navigation/service/router.dart';
import 'package:surf_study_project/features/places_list/screens/places_list_screen/places_list_screen.dart';
import 'package:surf_study_project/features/places_list/screens/places_list_screen/places_list_screen_model.dart';

/// Factory for [PlacesListScreenWidgetModel].
PlacesListScreenWidgetModel placesListScreenWmFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final router = appDependencies.router;
  final geoBloc = appDependencies.geolocationBloc;

  final model = PlacesListScreenModel(appDependencies.placeService, geoBloc);
  return PlacesListScreenWidgetModel(model, router);
}

/// Widget model for [PlacesListScreen].
class PlacesListScreenWidgetModel
    extends WidgetModel<PlacesListScreen, PlacesListScreenModel>
    implements IPlacesListScreenWidgetModel {
  /// [AppRouter] instance
  final AppRouter router;

  late final PagingController<int, Place> _pagingController;

  /// substitution to the [GeolocationState]
  late final StreamSubscription<GeolocationState> _stateGeolocationSubscription;

  @override
  ValueSetter<int> get onPressedCard => _onPressedCard;

  @override
  PagingController<int, Place> get pagingController => _pagingController;

  @override
  VoidCallback get onSearchButtonTap => _onSearchButtonTap;

  @override
  VoidCallback get onFilterButtonTap => _onFilterButtonTap;

  @override
  PlaceListColors? get placeListColors =>
      Theme.of(context).extension<PlaceListColors>();

  @override
  double get statusBarHeight => MediaQueryData.fromWindow(window).padding.top;

  int _offsetPlaces = 0;

  int _pageNumber = 0;

  /// Create an instance [PlacesListScreenWidgetModel].
  PlacesListScreenWidgetModel(PlacesListScreenModel model, this.router)
      : super(model);

  @override
  void initWidgetModel() {
    _initPageController();
    _stateGeolocationSubscription =
        model.geolocationStateStream.listen(_updateState);
    super.initWidgetModel();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _stateGeolocationSubscription.cancel();
    super.dispose();
  }

  @override
  Future<void> onRefresh() async {
    _offsetPlaces = 0;
    _pagingController.refresh();
  }

  void _initPageController() {
    _pagingController =
        PagingController<int, Place>(firstPageKey: _offsetPlaces);
    pagingController.addPageRequestListener((pageKey) {
      _loadPlaces(_offsetPlaces);
    });
  }

  Future<void> _loadPlaces(int offset) async {
    await Future<void>.delayed(const Duration(milliseconds: 750));

    try {
      final places = await model.getPlaces(offset: offset);

      final isLastPage = places.length < 10;

      if (!isLastPage) {
        _pagingController.appendPage(places, _pageNumber);
        _pageNumber++;
      } else {
        _pagingController.appendLastPage(places);
      }
    } on Exception catch (err) {
      _pagingController.error = err;
    }
    _offsetPlaces += 10;
  }

  Future<void> _onPressedCard(int index) async {}

  Future<void> _updateState(GeolocationState state) async {
    if (state is GeolocationPermissionGranted) {
      await router.pushNamed(AppRoutePaths.filterPath);
    } else if (state is GeolocationError) {
      await _showGeolocationDialog();
    }
  }

  void _onSearchButtonTap() {
    router.pushNamed(AppRoutePaths.searchPath);
  }

  void _onFilterButtonTap() {
    model.verifyPermissions();
  }

  void _onAlertCloseTap() {
    router.pop();
  }

  void _onAlertSettingsTap() {
    model.openAppSettings();
  }

  Future<void> _showGeolocationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return LocationAlertDialog(
          onAlertCloseTap: _onAlertCloseTap,
          onAlertSettingsTap: _onAlertSettingsTap,
        );
      },
    );
  }
}

/// Interface of [PlacesListScreenWidgetModel].
abstract class IPlacesListScreenWidgetModel extends IWidgetModel {
  /// [PagingController] for the [PagedSliverList] used in [PlacesListScreen]
  PagingController<int, Place> get pagingController;

  /// onPressed callback handle card taps
  ValueSetter<int> get onPressedCard;

  /// Callback on search button tap
  VoidCallback get onSearchButtonTap;

  /// Callback on filter button tap
  VoidCallback get onFilterButtonTap;

  /// [PlaceListColors] is colors of the place list feature
  PlaceListColors? get placeListColors;

  /// status bar height
  double get statusBarHeight;

  /// refresh list
  Future<void> onRefresh();
}
