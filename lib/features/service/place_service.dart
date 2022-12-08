import 'package:surf_study_project/features/common/domain/entity/filtered_places_entity.dart';
import 'package:surf_study_project/features/common/domain/entity/place_entity.dart';
import 'package:surf_study_project/features/common/domain/repository/place_repository.dart';
import 'package:surf_study_project/features/service/iplace_service.dart';

/// Class [PlaceService] is a service that implements the [IPlaceService] interface
class PlaceService implements IPlaceService {
  final PlaceRepository _placeRepository;

  /// [PlaceService] constructor
  PlaceService(this._placeRepository);

  /// Function argument is [PlaceEntity]
  /// Returns [PlaceEntity]
  @override
  Future<PlaceEntity> sendPlace(PlaceEntity placeEntity) {
    return _placeRepository.postPlace(placeEntity);
  }

  /// Function argument is [FilteredPlacesEntity]
  /// Returns [List] of [PlaceEntity]
  @override
  Future<List<PlaceEntity>> getFilteredPlacesList(
    FilteredPlacesEntity filteredPlacesEntity,
  ) {
    return _placeRepository.getFilteredPlaces(filteredPlacesEntity);
  }

  /// Function argument is [id]
  /// Returns [PlaceEntity]
  @override
  Future<PlaceEntity> getPlace({required int id}) {
    return _placeRepository.getPlaceById(placeId: id);
  }

  /// Fu
  /// Function argument are [count], [offset]
  /// Returns [List] of [PlaceEntity]
  @override
  Future<List<PlaceEntity>> getPlacesList({int count = 10, int offset = 0}) {
    return _placeRepository.getPlaces(count: count, offset: offset);
  }
}
