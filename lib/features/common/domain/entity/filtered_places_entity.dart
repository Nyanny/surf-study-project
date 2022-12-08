// ignore_for_file: public_member_api_docs
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';

/// Entity of filtered_places
class FilteredPlacesEntity {
  final double? lat;
  final double? lng;
  final double? radius;
  final List<PlaceType>? typeFilter;
  final String? nameFilter;

  FilteredPlacesEntity({
    this.lat,
    this.lng,
    this.radius,
    this.typeFilter,
    this.nameFilter,
  });
}
