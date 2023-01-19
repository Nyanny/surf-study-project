import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocation_coordinates.dart';
import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocation_problem.dart';

/// Geolocation service interface
abstract class IGeolocationService {
  /// gets the current user position
  /// returns [GeolocationCoordinates]
  Future<GeolocationCoordinates> getCurrentPosition();

  /// Verify functions
  ///
  /// Verifies permission
  Future<bool> verifyLocationPermission();

  /// Verifies is location service enable
  Future<bool> verifyLocationServiceEnabled();

  /// Verifies is location service enable and permission
  /// returns [GeolocationProblem]
  Future<GeolocationProblem> verifyLocationServiceAndPermission();

  /// Requests functions
  ///
  /// Requests location permission
  /// returns [bool]
  Future<bool> requestLocationPermission();

  /// opens settings with geolocation where user can enable/ disable the location services
  /// returns true/false whether it is enabled or not
  Future<bool> requestLocationService();

  // /// Verifies and requests if needed location service enabled and location permission
  // /// Returns [GeolocationStatus]
  // Future<GeolocationStatus> verifyAndRequestLocationServiceAndPermission();

  /// Verifies and requests if needed location service enabled and location permission
  /// Returns [GeolocationProblem]
  Future<GeolocationProblem> verifyAndRequestLocationServiceAndPermission();

  /// opens app's settings where user can update app permissions
  Future<void> openAppSettings();
}
