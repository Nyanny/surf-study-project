import 'package:surf_study_project/api/service/place_api.dart';
import 'package:surf_study_project/features/common/domain/entity/filtered_places.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/common/domain/repository/iplace_repository.dart';
import 'package:surf_study_project/features/common/domain/repository/place_mapper.dart';

/// Class [PlaceRepository] is a repository that implements the [IPlaceRepository] interface
class PlaceRepository implements IPlaceRepository {
  final PlaceApi _apiClient;

  /// constructor
  PlaceRepository(this._apiClient);

  /// Function argument is [FilteredPlaces]
  /// Returns [List] of [Place]
  @override
  Future<List<Place>> getFilteredPlaces(
    FilteredPlaces filteredPlacesEntity,
  ) {
    return _apiClient
        .getFilteredPlaces(
          PlaceMapper.placesFilterRequestMapperFromFilteredPlaces(
            filteredPlacesEntity,
          ),
        )
        .then((value) => value
            .map<Place>(PlaceMapper.placeMapperFromPlaceResponse)
            .toList());
  }

  /// Function argument is [placeId]
  /// Returns [Place]
  @override
  Future<Place> getPlaceById({required int placeId}) {
    return _apiClient
        .getPlaceById(placeId.toString())
        .then(PlaceMapper.placeMapperFromPlaceRequest);
  }

  /// Function argument are [count], [offset]
  /// Returns [List] of [Place]
  @override
  Future<List<Place>> getPlaces({int count = 1, int offset = 0}) {
    return _apiClient.getPlace(count, offset).then((value) =>
        value.map<Place>(PlaceMapper.placeMapperFromPlaceRequest).toList());
  }

  /// Function argument is [Place]
  /// Returns [Place]
  @override
  Future<Place> postPlace(Place placeEntity) {
    return _apiClient
        .postPlace(PlaceMapper.placeRequestMapperFromPlace(placeEntity))
        .then<Place>(PlaceMapper.placeMapperFromPlaceRequest);
  }
}
