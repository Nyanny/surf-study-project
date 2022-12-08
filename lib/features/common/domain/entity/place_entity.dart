// ignore_for_file: public_member_api_docs
import 'package:flutter/foundation.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';

/// Entity of Place
@immutable
class Place {
  final int id;
  final double lat;
  final double lng;
  final double? distance;
  final String name;
  final PlaceType placeType;
  final String description;
  final List<String> urls;

  const Place({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.placeType,
    required this.description,
    required this.urls,
    this.distance,
  });
}
