// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceFilter _$PlaceFilterFromJson(Map<String, dynamic> json) => PlaceFilter(
      radius: (json['radius'] as num).toDouble(),
      placeTypeList: (json['placeTypeList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PlaceFilterToJson(PlaceFilter instance) =>
    <String, dynamic>{
      'radius': instance.radius,
      'placeTypeList': instance.placeTypeList,
    };
