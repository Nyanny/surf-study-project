/// defines problems with geolocation operations
enum GeolocationProblem {
  /// problem with geolocation permission
  locationPermission,

  /// problem with geolocation service
  locationService,

  /// problem with geolocation permission and with geolocation service
  both,

  /// there are no problems with geolocation
  noProblems,

  /// unknown problem
  unknown
}
