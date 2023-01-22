import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/geolocation/bloc/geolocation_bloc.dart';
import 'package:surf_study_project/features/places_list/screens/places_list_screen/places_list_screen.dart';
import 'package:surf_study_project/features/service/place_service.dart';

/// Model for [PlacesListScreen]
class PlacesListScreenModel extends ElementaryModel {
  final PlaceService _placeService;

  /// [GeolocationBloc] instance
  GeolocationBloc geolocationBloc;

  /// verifies locations service and app permission
  VoidCallback get verifyPermissions => _verifyPermissions;

  /// opens app settings
  VoidCallback get openAppSettings => _openAppSettings;

  /// Stream of [GeolocationState]
  Stream<GeolocationState> get geolocationStateStream => geolocationBloc.stream;

  /// constructor
  PlacesListScreenModel(this._placeService, this.geolocationBloc);

  /// get places without any filter
  Future<List<Place>> getPlaces({required int offset, int count = 10}) async {
    return _placeService.getPlacesList(
      count: count,
      offset: offset,
    );
  }

  void _verifyPermissions() {
    geolocationBloc.add(VerifyThenRequestPermissionEvent());
  }

  void _openAppSettings() {
    geolocationBloc.add(OpenAppSettingsEvent());
  }
}
