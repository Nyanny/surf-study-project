// ignore_for_file: public_member_api_docs
// ignore_for_file: avoid_catching_errors

import 'package:surf_study_project/assets/res/app_assets.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';

/// supported by API types
enum PlaceType {
  hotel(
    iconPath: AppAssets.hotel,
    title: AppStrings.hotelFilterCategory,
  ),
  restaurant(
    iconPath: AppAssets.restaurant,
    title: AppStrings.restaurantFilterCategory,
  ),
  other(
    iconPath: AppAssets.particularPlace,
    title: AppStrings.specialPlaceFilterCategory,
  ),
  park(
    iconPath: AppAssets.park,
    title: AppStrings.parkFilterCategory,
  ),
  museum(
    iconPath: AppAssets.museum,
    title: AppStrings.museumFilterCategory,
  ),
  cafe(
    iconPath: AppAssets.cafe,
    title: AppStrings.cafeFilterCategory,
  );

  const PlaceType({required this.iconPath, required this.title});

  factory PlaceType.fromString(String placeTypeString) {
    late PlaceType placeType;

    try {
      placeType = PlaceType.values.byName(placeTypeString);
    } on Error catch (_) {
      placeType = PlaceType.other;
    }
    return placeType;
  }

  final String iconPath;
  final String title;
}
