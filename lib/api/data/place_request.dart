// ignore_for_file: public_member_api_docs
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'place_request.g.dart';

/// Модель для POST request
@JsonSerializable()
@immutable
class PlaceRequest {
  final int id;
  final double lat;
  final double lng;
  final String name;
  final List<String> urls;
  final String placeType;
  final String description;

  const PlaceRequest({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.urls,
    required this.placeType,
    required this.description,
  });

  factory PlaceRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceRequestToJson(this);
}
