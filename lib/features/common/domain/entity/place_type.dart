// ignore_for_file: public_member_api_docs

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

  final String iconPath;
  final String title;
}
