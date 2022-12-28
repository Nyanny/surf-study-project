import 'package:elementary/elementary.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/places_list/screens/places_list_screen/places_list_screen.dart';
import 'package:surf_study_project/features/service/place_service.dart';

/// Model for [PlacesListScreen]
class PlacesListScreenModel extends ElementaryModel {
  final PlaceService _placeService;

  /// constructor
  PlacesListScreenModel(this._placeService);

  /// get places without any filter
  Future<List<Place>> getPlaces({required int offset, int count = 10}) async {
    return _placeService.getPlacesList(
      count: count,
      offset: offset,
    );
  }
}
