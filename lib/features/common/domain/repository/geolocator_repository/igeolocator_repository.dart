import 'package:geolocator/geolocator.dart';

/// Geolocation repository interface
abstract class IGeolocatorRepository {
  /// gets the current user position
  Future<Position> getCurrentPosition();

  /// opens settings with geolocation where user can enable/ disable the location services
  Future<void> openLocationSettings();

  /// opens app's settings where user can update app permissions
  Future<void> openAppSettings();
}
