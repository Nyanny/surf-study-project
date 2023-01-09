import 'package:surf_study_project/features/common/domain/entity/filtered_places.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/common/domain/repository/place_repository/place_repository.dart';
import 'package:surf_study_project/features/service/iplace_service.dart';

/// Class [PlaceService] is a service that implements the [IPlaceService] interface
class PlaceService implements IPlaceService {
  final PlaceRepository _placeRepository;

  /// [PlaceService] constructor
  PlaceService(this._placeRepository);

  /// Function argument is [Place]
  /// Returns [Place]
  @override
  Future<Place> sendPlace(Place place) {
    return _placeRepository.postPlace(place);
  }

  /// Function argument is [FilteredPlaces]
  /// Returns [List] of [Place]
  @override
  Future<List<Place>> getFilteredPlacesList(
    FilteredPlaces filteredPlaces,
  ) {
    return _placeRepository.getFilteredPlaces(filteredPlaces);
  }

  /// Function argument is [id]
  /// Returns [Place]
  @override
  Future<Place> getPlace({required int id}) {
    return _placeRepository.getPlaceById(placeId: id);
  }

  /// Function argument are [count], [offset]
  /// Returns [List] of [Place]
  @override
  Future<List<Place>> getPlacesList({int count = 10, int offset = 0}) {
    return _placeRepository.getPlaces(count: count, offset: offset);
  }
}
