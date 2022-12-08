import 'package:surf_study_project/features/common/domain/entity/filtered_places_entity.dart';
import 'package:surf_study_project/features/common/domain/entity/place_entity.dart';

/// Basic Place service interface.
abstract class IPlaceService {
  /// Send [PlaceEntity].
  Future<PlaceEntity> sendPlace(PlaceEntity placeEntity);

  /// Gets [PlaceEntity] specified by id.
  Future<PlaceEntity> getPlace({required int id});

  /// Gets [List] of [PlaceEntity]
  /// optional parameters
  /// [count] - count of places in the list
  /// [offset] - offset from the first Place
  Future<List<PlaceEntity>> getPlacesList({int count = 10, int offset = 0});

  /// Gets [List] of [PlaceEntity]
  /// [PlaceEntity] has the specified [PlaceEntity.distance]
  Future<List<PlaceEntity>> getFilteredPlacesList(
    FilteredPlacesEntity filteredPlacesEntity,
  );
}
