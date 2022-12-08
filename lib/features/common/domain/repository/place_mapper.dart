import 'package:surf_study_project/api/data/place_request.dart';
import 'package:surf_study_project/api/data/place_response.dart';
import 'package:surf_study_project/api/data/places_filter_request.dart';
import 'package:surf_study_project/features/common/domain/entity/filtered_places.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';

/// Mapper class for Place feature
class PlaceMapper {
  /// Converts [PlaceResponse] to [Place]
  static Place placeMapperFromPlaceResponse(PlaceResponse placeResponse) {
    return Place(
      id: placeResponse.id,
      lat: placeResponse.lat,
      lng: placeResponse.lng,
      distance: placeResponse.distance,
      name: placeResponse.name,
      placeType: placeTypeMapper(placeResponse.placeType),
      description: placeResponse.description,
      urls: placeResponse.urls,
    );
  }

  /// Converts [PlaceRequest] to [Place]
  static Place placeMapperFromPlaceRequest(PlaceRequest placeRequest) {
    return Place(
      id: placeRequest.id,
      lat: placeRequest.lat,
      lng: placeRequest.lng,
      name: placeRequest.name,
      placeType: placeTypeMapper(placeRequest.placeType),
      description: placeRequest.description,
      urls: placeRequest.urls,
    );
  }

  /// Converts [Place] to [PlaceRequest]
  static PlaceRequest placeRequestMapperFromPlace(Place place) {
    return PlaceRequest(
      id: place.id,
      lat: place.lat,
      lng: place.lng,
      name: place.name,
      placeType: place.placeType.name,
      description: place.description,
      urls: place.urls,
    );
  }

  /// Converts [Place] to [PlaceResponse]
  static PlaceResponse placeResponseMapperFromPlace(Place place) {
    return PlaceResponse(
      id: place.id,
      lat: place.lat,
      lng: place.lng,
      name: place.name,
      placeType: place.placeType.name,
      description: place.description,
      urls: place.urls,
    );
  }

  /// Converts [FilteredPlaces] to [PlacesFilterRequest]
  static PlacesFilterRequest placesFilterRequestMapperFromFilteredPlaces(
    FilteredPlaces filteredPlaces,
  ) {
    return PlacesFilterRequest(
      lat: filteredPlaces.lat,
      lng: filteredPlaces.lng,
      radius: filteredPlaces.radius,
      typeFilter: filteredPlaces.typeFilter?.map((e) => e.name).toList(),
      nameFilter: filteredPlaces.nameFilter,
    );
  }

  /// Mapper for [PlaceType]
  static PlaceType placeTypeMapper(String placeType) {
    if (placeType == PlaceType.hotel.name) {
      return PlaceType.hotel;
    }
    if (placeType == PlaceType.cafe.name) {
      return PlaceType.cafe;
    }
    if (placeType == PlaceType.museum.name) {
      return PlaceType.museum;
    }
    if (placeType == PlaceType.restaurant.name) {
      return PlaceType.restaurant;
    }
    if (placeType == PlaceType.park.name) {
      return PlaceType.park;
    }
    return PlaceType.other;
  }
}
