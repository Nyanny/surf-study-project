// ignore_for_file: public_member_api_docs
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_response.g.dart';

// Модель данных ответа на запрос фильтра мест.
// От модели данных места Place отличается наличием поля distance,
// в котором при ответе будет расстояние от запрошенной точки
@JsonSerializable()
@immutable
class PlaceResponse {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final List<String> urls;
  final String placeType;
  final String description;
  final double? distance;

  const PlaceResponse({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.urls,
    required this.placeType,
    required this.description,
    this.distance,
  });

  factory PlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceResponseToJson(this);
}
