import 'package:surf_study_project/features/common/domain/entity/filtered_places.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';

/// Basic Place repository interface.
abstract class IPlaceRepository {
  /// Requests [List] of [Place] from a source.
  /// optional parameters
  /// [count] - count of places in the list
  /// [offset] - offset from the first Place in the source
  Future<List<Place>> getPlaces({int count = 1, int offset = 0});

  /// Requests [Place] specified by id from a source.
  Future<Place> getPlaceById({required int placeId});

  /// Requests [List] of [Place] from a source.
  /// [Place] has the specified [Place.distance]
  Future<List<Place>> getFilteredPlaces(
    FilteredPlaces filteredPlaces,
  );

  /// Send [Place] to an external source
  Future<Place> postPlace(Place place);
}
