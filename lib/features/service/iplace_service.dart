import 'package:surf_study_project/features/common/domain/entity/filtered_places_entity.dart';
import 'package:surf_study_project/features/common/domain/entity/place_entity.dart';

/// Basic Place service interface.
abstract class IPlaceService {
  /// Send [Place].
  Future<Place> sendPlace(Place placeEntity);

  /// Gets [Place] specified by id.
  Future<Place> getPlace({required int id});

  /// Gets [List] of [Place]
  /// optional parameters
  /// [count] - count of places in the list
  /// [offset] - offset from the first Place
  Future<List<Place>> getPlacesList({int count = 10, int offset = 0});

  /// Gets [List] of [Place]
  /// [Place] has the specified [Place.distance]
  Future<List<Place>> getFilteredPlacesList(
    FilteredPlaces filteredPlacesEntity,
  );
}
