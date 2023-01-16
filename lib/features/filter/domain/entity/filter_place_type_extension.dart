import 'package:surf_study_project/assets/res/app_assets.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/features/common/domain/entity/place_type.dart';
import 'package:surf_study_project/features/filter/domain/entity/place_type_filter.dart';

/// [PlaceType] extension
extension FilterPlaceTypeExtension on PlaceType {
  /// gets [PlaceTypeFilter] object depends on current [PlaceType]
  PlaceTypeFilter get getPlaceTypeData {
    switch (this) {
      case PlaceType.hotel:
        return PlaceTypeFilter(
          iconPath: AppAssets.hotel,
          title: AppStrings.hotelFilterCategory,
        );
      case PlaceType.restaurant:
        return PlaceTypeFilter(
          iconPath: AppAssets.restaurant,
          title: AppStrings.restaurantFilterCategory,
        );
      case PlaceType.other:
        return PlaceTypeFilter(
          iconPath: AppAssets.particularPlace,
          title: AppStrings.specialPlaceFilterCategory,
        );

      case PlaceType.park:
        return PlaceTypeFilter(
          iconPath: AppAssets.park,
          title: AppStrings.parkFilterCategory,
        );
      case PlaceType.museum:
        return PlaceTypeFilter(
          iconPath: AppAssets.museum,
          title: AppStrings.museumFilterCategory,
        );
      case PlaceType.cafe:
        return PlaceTypeFilter(
          iconPath: AppAssets.cafe,
          title: AppStrings.cafeFilterCategory,
        );

      default:
        return PlaceTypeFilter(
          iconPath: AppAssets.park,
          title: AppStrings.specialPlaceFilterCategory,
        );
    }
  }
}
