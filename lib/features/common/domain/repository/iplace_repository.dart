import 'package:surf_study_project/features/common/domain/entity/filtered_places_entity.dart';
import 'package:surf_study_project/features/common/domain/entity/place_entity.dart';

/// Basic Place repository interface.
abstract class IPlaceRepository {
  /// Requests [List] of [PlaceEntity] from a source.
  /// optional parameters
  /// [count] - count of places in the list
  /// [offset] - offset from the first Place in the source
  Future<List<PlaceEntity>> getPlaces({int count = 1, int offset = 0});

  /// Requests [PlaceEntity] specified by id from a source.
  Future<PlaceEntity> getPlaceById({required int placeId});

  /// Requests [List] of [PlaceEntity] from a source.
  /// [PlaceEntity] has the specified [PlaceEntity.distance]
  Future<List<PlaceEntity>> getFilteredPlaces(
    FilteredPlacesEntity filteredPlacesEntity,
  );

  /// Send [PlaceEntity] to an external source
  Future<PlaceEntity> postPlace(PlaceEntity placeEntity);
}
