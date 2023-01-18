import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocation.dart';
import 'package:surf_study_project/features/common/domain/entity/geolocator/geolocator_exception.dart';
import 'package:surf_study_project/features/common/domain/repository/geolocator_repository/geolocator_repository.dart';

/// Class [GeolocationService] is location service
class GeolocationService {
  /// RedSquare coordinates
  /// [0] - Latitude
  /// [1] - Longitude
  static const _defaultCoordinates = [55.753223, 37.621505];

  final GeolocatorRepository _geolocatorRepository;

  /// constructor
  GeolocationService(this._geolocatorRepository);

  /// Gets coordinates of current position
  /// If there are any troubles getting it uses [_defaultCoordinates]
  Future<Geolocation> getCurrentPosition() async {
    Geolocation geolocation;
    try {
      final position = await _geolocatorRepository.getCurrentPosition();
      geolocation = Geolocation(
        longitude: position.longitude,
        latitude: position.latitude,
      );
    } on GeolocatorException catch (_) {
      geolocation = Geolocation(
        longitude: _defaultCoordinates.elementAt(1),
        latitude: _defaultCoordinates.elementAt(0),
      );
    }

    return geolocation;
  }
}
