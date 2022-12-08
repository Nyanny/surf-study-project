import 'package:surf_study_project/api/data/place_request.dart';
import 'package:surf_study_project/api/data/place_response.dart';
import 'package:surf_study_project/api/data/places_filter_request.dart';
import 'package:surf_study_project/features/common/domain/entity/filtered_places.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';

/// Mapper class for Place feature
class PlaceMapper {
  /// Converts [PlaceResponse] to [Place]
  static Place placeEntityMapperFromPlaceDTO(PlaceResponse placeDTO) {
    return Place(
      id: placeDTO.id,
      lat: placeDTO.lat,
      lng: placeDTO.lng,
      distance: placeDTO.distance,
      name: placeDTO.name,
      placeType: placeTypeMapper(placeDTO.placeType),
      description: placeDTO.description,
      urls: placeDTO.urls,
    );
  }

  /// Converts [PlaceRequest] to [Place]
  static Place placeEntityMapperFromPlace(PlaceRequest place) {
    return Place(
      id: place.id,
      lat: place.lat,
      lng: place.lng,
      name: place.name,
      placeType: placeTypeMapper(place.placeType),
      description: place.description,
      urls: place.urls,
    );
  }

  /// Converts [Place] to [PlaceRequest]
  static PlaceRequest placeMapper(Place placeEntity) {
    return PlaceRequest(
      id: placeEntity.id,
      lat: placeEntity.lat,
      lng: placeEntity.lng,
      name: placeEntity.name,
      placeType: placeEntity.placeType.name,
      description: placeEntity.description,
      urls: placeEntity.urls,
    );
  }

  /// Converts [Place] to [PlaceResponse]
  static PlaceResponse placeDTOMapper(Place placeEntity) {
    return PlaceResponse(
      id: placeEntity.id,
      lat: placeEntity.lat,
      lng: placeEntity.lng,
      name: placeEntity.name,
      placeType: placeEntity.placeType.name,
      description: placeEntity.description,
      urls: placeEntity.urls,
    );
  }

  /// Converts [FilteredPlaces] to [PlacesFilterRequest]
  static PlacesFilterRequest placesFilterRequestDtoMapper(
    FilteredPlaces filteredPlacesEntity,
  ) {
    return PlacesFilterRequest(
      lat: filteredPlacesEntity.lat,
      lng: filteredPlacesEntity.lng,
      radius: filteredPlacesEntity.radius,
      typeFilter: filteredPlacesEntity.typeFilter?.map((e) => e.name).toList(),
      nameFilter: filteredPlacesEntity.nameFilter,
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
