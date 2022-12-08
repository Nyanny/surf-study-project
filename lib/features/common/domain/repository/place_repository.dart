import 'package:surf_study_project/api/service/place_api.dart';
import 'package:surf_study_project/features/common/domain/entity/filtered_places_entity.dart';
import 'package:surf_study_project/features/common/domain/entity/place_entity.dart';
import 'package:surf_study_project/features/common/domain/repository/iplace_repository.dart';
import 'package:surf_study_project/features/common/domain/repository/place_mapper.dart';

/// Class [PlaceRepository] is a repository that implements the [IPlaceRepository] interface
class PlaceRepository implements IPlaceRepository {
  final PlaceApi _apiClient;

  /// constructor
  PlaceRepository(this._apiClient);

  /// Function argument is [FilteredPlacesEntity]
  /// Returns [List] of [PlaceEntity]
  @override
  Future<List<PlaceEntity>> getFilteredPlaces(
    FilteredPlacesEntity filteredPlacesEntity,
  ) {
    return _apiClient
        .getFilteredPlaces(
          PlaceMapper.placesFilterRequestDtoMapper(filteredPlacesEntity),
        )
        .then((value) => value
            .map<PlaceEntity>(PlaceMapper.placeEntityMapperFromPlaceDTO)
            .toList());
  }

  /// Function argument is [placeId]
  /// Returns [PlaceEntity]
  @override
  Future<PlaceEntity> getPlaceById({required int placeId}) {
    return _apiClient
        .getPlaceById(placeId.toString())
        .then(PlaceMapper.placeEntityMapperFromPlace);
  }

  /// Function argument are [count], [offset]
  /// Returns [List] of [PlaceEntity]
  @override
  Future<List<PlaceEntity>> getPlaces({int count = 1, int offset = 0}) {
    return _apiClient.getPlace(count, offset).then((value) => value
        .map<PlaceEntity>(PlaceMapper.placeEntityMapperFromPlace)
        .toList());
  }

  /// Function argument is [PlaceEntity]
  /// Returns [PlaceEntity]
  @override
  Future<PlaceEntity> postPlace(PlaceEntity placeEntity) {
    return _apiClient
        .postPlace(PlaceMapper.placeMapper(placeEntity))
        .then<PlaceEntity>(PlaceMapper.placeEntityMapperFromPlace);
  }
}
