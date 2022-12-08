// ignore_for_file: public_member_api_docs
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'places_filter_request.g.dart';

// Модель данных с параметрами фильтра.
// Все поля не обязательные, но параметры "lat", "lat" и "radius" зависят друг от друга,
// поэтому если указан один из них, то остальные два становятся обязательными
@JsonSerializable()
@immutable
class PlacesFilterRequest {
  final double? lat;
  final double? lng;
  final double? radius;
  final List<String>? typeFilter;
  final String? nameFilter;

  const PlacesFilterRequest({
    required this.lat,
    required this.lng,
    required this.radius,
    required this.typeFilter,
    required this.nameFilter,
  });

  factory PlacesFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$PlacesFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesFilterRequestToJson(this);
}
