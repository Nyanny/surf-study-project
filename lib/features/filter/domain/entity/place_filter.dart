import 'package:surf_study_project/features/common/domain/entity/place_type.dart';

/// Class [PlaceFilter] is a class that holds filter
/// This class is used to hold Place filter
/// [toJson] and [factory PlaceFilter.fromJson] are needed to save this class in shared prefs
class PlaceFilter {
  /// filter radius
  final double radius;

  /// [List] of [PlaceType]
  final List<PlaceType> placeTypeList;

  /// constructor
  PlaceFilter({
    required this.radius,
    required this.placeTypeList,
  });

  /// factory method fromJson
  factory PlaceFilter.fromJson(Map<String, dynamic> json) {
    return PlaceFilter(
      radius: json['radius'] as double,
      placeTypeList: json['placeTypeList'] as List<PlaceType>,
    );
  }

  /// toJson method
  Map<String, dynamic> toJson() => <String, dynamic>{
        'radius': radius,
        'placeTypeList': placeTypeList,
      };
}
