import 'package:geolocator/geolocator.dart';
import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocator_exception.dart';
import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocator_status.dart';
import 'package:surf_study_project/features/common/domain/repository/geolocator_repository/igeolocator_repository.dart';

/// Class [GeolocatorRepository] is a geolocation repository implements
class GeolocatorRepository implements IGeolocatorRepository {
  @override
  Future<Position> getCurrentPosition() async {
    Position position;

    try {
      await _handleLocationService();
      await _handlePermission();
      position = await Geolocator.getCurrentPosition();
    } on GeolocatorException catch (_) {
      rethrow;
    }
    return position;
  }

  @override
  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  @override
  Future<void> openAppSettings() async {
    await Geolocator.openAppSettings();
  }

  /// handles location service
  Future<void> _handleLocationService() async {
    var isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      await openLocationSettings();
    }
    isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      return Future.error(GeolocatorException(
        geolocatorStatus: GeolocatorStatus.locationServiceDisabled,
        exceptionMessage: 'Location permissions are denied',
      ));
    }
  }

  /// handles location permission
  Future<void> _handlePermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      return Future.error(GeolocatorException(
        geolocatorStatus: GeolocatorStatus.permissionDenied,
        exceptionMessage: 'Location permissions are denied',
      ));
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(GeolocatorException(
        geolocatorStatus: GeolocatorStatus.permissionDeniedForever,
        exceptionMessage:
            'Location permissions are denied forever service cannot work',
      ));
    }
  }
}
