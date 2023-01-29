import 'package:elementary/elementary.dart';
import 'package:surf_study_project/features/common/domain/entity/filtered_places.dart';
import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocation_coordinates.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';
import 'package:surf_study_project/features/common/service/app_settings_service.dart';
import 'package:surf_study_project/features/geolocation/bloc/geolocation_bloc.dart';
import 'package:surf_study_project/features/places_list/screens/places_list_screen/places_list_screen.dart';
import 'package:surf_study_project/features/service/place_service.dart';

/// interface of [PlacesListScreenModel]
abstract class IPlacesListScreenModel extends ElementaryModel {
  /// Stream of [GeolocationState]
  Stream<GeolocationState> get geolocationStateStream;

  /// opens app settings
  void openAppSettings();

  /// sets filter status [bool]
  Future<void> setFilterStatus({required bool filterStatus});

  /// gets [bool] filter status
  Future<bool> getFilterStatus();

  /// get places without any filter
  Future<List<Place>> getPlaces({required int offset, int count = 10});

  /// gets [List<Place>] FILTERED places
  Future<List<Place>> getFilteredPlaces({
    required GeolocationCoordinates geolocationCoordinates,
  });

  /// requests coordinates
  void requestCoordinates();

  /// verifies geolocation permissions
  void verifyPermissions();

  /// gets filter settings: radius and list of [PlaceType]
  Future<void> getFilterSettings();
}

/// Model for [PlacesListScreen]
class PlacesListScreenModel extends ElementaryModel
    implements IPlacesListScreenModel {
  final AppSettingsService _appSettingsService;
  final PlaceService _placeService;

  /// [GeolocationBloc] instance
  GeolocationBloc geolocationBloc;

  @override
  Stream<GeolocationState> get geolocationStateStream => geolocationBloc.stream;

  late double _rangeFilter;

  late List<PlaceType> _placeTypesFilter;

  /// constructor
  PlacesListScreenModel(
    this._placeService,
    this.geolocationBloc,
    this._appSettingsService,
  );

  @override
  Future<bool> getFilterStatus() async {
    return _appSettingsService.getFilterStatus();
  }

  @override
  Future<List<Place>> getFilteredPlaces({
    required GeolocationCoordinates geolocationCoordinates,
  }) async {
    return _getFilteredPlaces(
      geolocationCoordinates: geolocationCoordinates,
    );
  }

  @override
  Future<List<Place>> getPlaces({required int offset, int count = 10}) async {
    return _placeService.getPlacesList(
      count: count,
      offset: offset,
    );
  }

  @override
  void openAppSettings() => _openAppSettings;

  @override
  void requestCoordinates() => _requestCoordinates();

  @override
  Future<void> setFilterStatus({required bool filterStatus}) async {
    await _appSettingsService.setFilterStatus(filterStatus: filterStatus);
  }

  @override
  void verifyPermissions() => _verifyPermissions();

  @override
  Future<void> getFilterSettings() => _getFilterSettings();

  Future<List<Place>> _getFilteredPlaces({
    required GeolocationCoordinates geolocationCoordinates,
  }) async {
    final placeFilter = FilteredPlaces(
      lat: geolocationCoordinates.latitude,
      lng: geolocationCoordinates.longitude,
      radius: _rangeFilter,
      typeFilter: _placeTypesFilter,
      nameFilter: '',
    );
    return _placeService.getFilteredPlacesList(placeFilter);
  }

  Future<void> _getFilterSettings() async {
    final placeFilter = await _appSettingsService.getPlaceFilter();
    _rangeFilter = placeFilter.radius;
    _placeTypesFilter =
        placeFilter.placeTypeList.map(PlaceType.fromString).toList();
  }

  void _requestCoordinates() {
    geolocationBloc.add(GetCurrentLocationEvent());
  }

  void _verifyPermissions() {
    geolocationBloc.add(VerifyThenRequestPermissionEvent());
  }

  void _openAppSettings() {
    geolocationBloc.add(OpenAppSettingsEvent());
  }
}
