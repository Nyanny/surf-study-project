import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'places_filter_request_dto.g.dart';

// Модель данных с параметрами фильтра.
// Все поля не обязательные, но параметры "lat", "lat" и "radius" зависят друг от друга,
// поэтому если указан один из них, то остальные два становятся обязательными
@JsonSerializable()
@immutable
class PlacesFilterRequestDto {
  final double? lat;
  final double? lng;
  final double? radius;
  final List<String>? typeFilter;
  final String? nameFilter;

  PlacesFilterRequestDto({
    required this.lat,
    required this.lng,
    required this.radius,
    required this.typeFilter,
    required this.nameFilter,
  });

  factory PlacesFilterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$PlacesFilterRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlacesFilterRequestDtoToJson(this);
}
