import 'package:elementary/elementary.dart';
import 'package:surf_study_project/features/common/domain/entity/filtered_places.dart';
import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocation_coordinates.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';
import 'package:surf_study_project/features/common/service/app_settings_service.dart';
import 'package:surf_study_project/features/filter/domain/entity/place_filter.dart';
import 'package:surf_study_project/features/geolocation/bloc/geolocation_bloc.dart';
import 'package:surf_study_project/features/service/place_service.dart';

/// Model interface for [FilterScreenModel]
abstract class IFilterScreenModel extends ElementaryModel {
  /// Stream of [GeolocationState]
  Stream<GeolocationState> get geolocationStateStream;

  /// filter range (radius)
  ListenableState<double> get range;

  /// count of found places
  ListenableState<EntityState<int>> get foundPlacesCount;

  /// filter categories
  ListenableState<Set<PlaceType>> get categoriesListenableState;

  /// get places filtered method
  Future<List<Place>> getFilteredPlaces({
    required GeolocationCoordinates geolocationCoordinates,
  });

  /// clears filter data (currently [range] and [categoriesListenableState])
  void clearFilterData();

  /// get coordinates method
  void getCoordinates();

  /// opens app settings
  void openAppSettings();

  /// verifies and requests geo permissions
  void verifyPermissions();

  /// sets selected [PlaceType]
  bool setFilterPlaceType({required PlaceType placeType});

  /// sets [double] range
  void setRange(double range);

  /// save filter settings
  Future<void> saveFilterSettings();
}

/// Model for filter feature elementary module
// class FilterScreenModel extends ElementaryModel {
class FilterScreenModel extends ElementaryModel implements IFilterScreenModel {
  /// default filter
  static const placeFilterConst = PlaceFilter(
    radius: 10,
    placeTypeList: [
      'hotel',
      'restaurant',
      'other',
      'park',
      'museum',
      'cafe',
    ],
  );

  final _foundPlacesCount = EntityStateNotifier<int>();
  final AppSettingsService _appSettingsService;
  final PlaceService _placeService;

  /// [GeolocationBloc] instance
  GeolocationBloc geolocationBloc;

  @override
  ListenableState<Set<PlaceType>> get categoriesListenableState => _categories;

  @override
  ListenableState<EntityState<int>> get foundPlacesCount => _foundPlacesCount;

  @override
  ListenableState<double> get range => _range;

  @override
  Stream<GeolocationState> get geolocationStateStream => geolocationBloc.stream;

  late StateNotifier<Set<PlaceType>> _categories;

  late StateNotifier<double> _range;

  /// constructor
  FilterScreenModel(
    this.geolocationBloc,
    this._appSettingsService,
    this._placeService,
  );

  @override
  bool setFilterPlaceType({required PlaceType placeType}) =>
      _setFilterPlaceType(placeType: placeType);

  @override
  Future<void> saveFilterSettings() => _saveFilterSettings();

  /// verifies locations service and app permission
  @override
  void verifyPermissions() => _verifyPermissions;

  @override
  Future<List<Place>> getFilteredPlaces({
    required GeolocationCoordinates geolocationCoordinates,
  }) =>
      _getFilteredPlaces(geolocationCoordinates: geolocationCoordinates);

  @override
  void getCoordinates() => _getCoordinates();

  @override
  void clearFilterData() => _clearFilterData();

  /// opens app settings
  @override
  void openAppSettings() => _openAppSettings;

  @override
  void setRange(double range) => _setRange(range);

  @override
  void init() {
    super.init();
    _categories = StateNotifier<Set<PlaceType>>(
      initValue:
          placeFilterConst.placeTypeList.map(PlaceType.fromString).toSet(),
    );
    _range = StateNotifier<double>(initValue: placeFilterConst.radius);
    _initData();
  }

  void _setRange(double range) {
    _range.accept(range);
  }

  Future<void> _saveFilterSettings() async {
    final placeFilter = PlaceFilter(
      radius: _range.value ?? placeFilterConst.radius,
      placeTypeList: _categories.value?.map((e) => e.name).toList() ??
          List<String>.from(placeFilterConst.placeTypeList),
    );
    await _appSettingsService.setPlaceFilter(placeFilter);
  }

  Future<void> _initData() async {
    final placeFilter = await _appSettingsService.getPlaceFilter();
    _categories.accept(Set<PlaceType>.from(
      placeFilter.placeTypeList.map(PlaceType.fromString).toSet(),
    ));
    _range.accept(placeFilter.radius);
  }

  bool _setFilterPlaceType({required PlaceType placeType}) {
    final categoriesTemp = Set<PlaceType>.from(_categories.value!);
    final placeTypeIsSet = categoriesTemp.add(placeType);
    if (!placeTypeIsSet) {
      categoriesTemp.remove(placeType);
    }
    _categories.accept(Set<PlaceType>.from(categoriesTemp));
    return placeTypeIsSet;
  }

  Future<List<Place>> _getFilteredPlaces({
    required GeolocationCoordinates geolocationCoordinates,
  }) async {
    final placeFilter = FilteredPlaces(
      lat: geolocationCoordinates.latitude,
      lng: geolocationCoordinates.longitude,
      radius: _range.value,
      typeFilter: _categories.value?.toList(),
      nameFilter: '',
    );
    return _placeService.getFilteredPlacesList(placeFilter);
  }

  void _verifyPermissions() {
    geolocationBloc.add(VerifyThenRequestPermissionEvent());
  }

  void _openAppSettings() {
    geolocationBloc.add(OpenAppSettingsEvent());
  }

  void _clearFilterData() {
    _categories.accept(
      placeFilterConst.placeTypeList.map(PlaceType.fromString).toSet(),
    );
    _range.accept(placeFilterConst.radius);
    _saveFilterSettings();
  }

  void _getCoordinates() {
    geolocationBloc.add(GetCurrentLocationEvent());
  }
}
