import 'package:surf_study_project/api/data/place.dart';
import 'package:surf_study_project/api/data/place_dto.dart';
import 'package:surf_study_project/api/data/places_filter_request_dto.dart';
import 'package:surf_study_project/features/common/domain/entity/filtered_places_entity.dart';
import 'package:surf_study_project/features/common/domain/entity/place_entity.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';

/// Mapper class for Place feature
class PlaceMapper {
  /// Converts [PlaceDto] to [PlaceEntity]
  static PlaceEntity placeEntityMapperFromPlaceDTO(PlaceDto placeDTO) {
    return PlaceEntity(
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

  /// Converts [Place] to [PlaceEntity]
  static PlaceEntity placeEntityMapperFromPlace(Place place) {
    return PlaceEntity(
      id: place.id,
      lat: place.lat,
      lng: place.lng,
      name: place.name,
      placeType: placeTypeMapper(place.placeType),
      description: place.description,
      urls: place.urls,
    );
  }

  /// Converts [PlaceEntity] to [Place]
  static Place placeMapper(PlaceEntity placeEntity) {
    return Place(
      id: placeEntity.id,
      lat: placeEntity.lat,
      lng: placeEntity.lng,
      name: placeEntity.name,
      placeType: placeEntity.placeType.name,
      description: placeEntity.description,
      urls: placeEntity.urls,
    );
  }

  /// Converts [PlaceEntity] to [PlaceDto]
  static PlaceDto placeDTOMapper(PlaceEntity placeEntity) {
    return PlaceDto(
      id: placeEntity.id,
      lat: placeEntity.lat,
      lng: placeEntity.lng,
      name: placeEntity.name,
      placeType: placeEntity.placeType.name,
      description: placeEntity.description,
      urls: placeEntity.urls,
    );
  }

  /// Converts [FilteredPlacesEntity] to [PlacesFilterRequestDto]
  static PlacesFilterRequestDto placesFilterRequestDtoMapper(
    FilteredPlacesEntity filteredPlacesEntity,
  ) {
    return PlacesFilterRequestDto(
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
