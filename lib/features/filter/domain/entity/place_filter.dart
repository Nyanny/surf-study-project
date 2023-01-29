import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';

part 'place_filter.g.dart';

/// Class [PlaceFilter] is a class that holds filter
/// This class is used to hold Place filter
/// [toJson] and [factory PlaceFilter.fromJson] are needed to save this class in shared prefs
@JsonSerializable()
@immutable
class PlaceFilter {
  /// filter radius
  final double radius;

  /// [List] of [PlaceType]
  final List<String> placeTypeList;

  /// constructor
  const PlaceFilter({
    required this.radius,
    required this.placeTypeList,
  });

  /// from json method
  /// automatically generated
  factory PlaceFilter.fromJson(Map<String, dynamic> json) =>
      _$PlaceFilterFromJson(json);

  /// to json
  /// automatically generated
  Map<String, dynamic> toJson() => _$PlaceFilterToJson(this);
}
