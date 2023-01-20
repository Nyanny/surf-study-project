part of 'geolocation_bloc.dart';

/// RedSquare coordinates
const _defaultCoordinates =
    GeolocationCoordinates(longitude: 55.753223, latitude: 621505);

/// [GeolocationState] is abstract state class for bloc
@immutable
abstract class GeolocationState extends Equatable {}

/// initial state class
class GeolocationInitial extends GeolocationState {
  @override
  List<Object> get props => [];
}

/// loading state class
class GeolocationLoading extends GeolocationState {
  @override
  List<Object> get props => [];
}

/// All permissions granted state
class GeolocationPermissionGranted extends GeolocationState {
  @override
  List<Object> get props => [];
}

/// geolocation error state
/// [geolocationProblem] defines where was the problem
class GeolocationError extends GeolocationState {
  /// [GeolocationCoordinates] data, basically some
  final GeolocationCoordinates geolocationCoordinatesOnError;

  /// defines what kind of problem was
  final GeolocationProblem geolocationProblem;

  @override
  List<Object> get props => [geolocationCoordinatesOnError, geolocationProblem];

  /// constructor
  GeolocationError({
    required this.geolocationProblem,
    this.geolocationCoordinatesOnError = _defaultCoordinates,
  });
}

/// geolocation loaded state
/// [geolocation] holds geolocation data
class GeolocationLoaded extends GeolocationState {
  /// holds geolocation data
  final GeolocationCoordinates geolocation;

  @override
  List<Object> get props => [geolocation];

  /// constructor
  GeolocationLoaded({required this.geolocation});
}

/// app settings openning state
class AppSettingsIsOpenning extends GeolocationState {
  @override
  List<Object?> get props => [];
}
