import 'package:flutter/foundation.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';

/// Entity of Place
@immutable
class PlaceEntity {
  final int id;
  final double lat;
  final double lng;
  final double? distance;
  final String name;
  final PlaceType placeType;
  final String description;
  final List<String> urls;

  PlaceEntity({
    required this.id,
    required this.lat,
    required this.lng,
    this.distance,
    required this.name,
    required this.placeType,
    required this.description,
    required this.urls,
  });
}
