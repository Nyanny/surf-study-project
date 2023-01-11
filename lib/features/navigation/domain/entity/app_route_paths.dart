/// List of all the paths that are used to navigate in temp feature.
///
/// Have to been filled with the entries like this:
/// ```dart
/// /// Path description.
/// static const String screenPath = 'screenPath';
/// ```
abstract class AppRoutePaths {
  ///Path to onboarding screen
  static const String onboardingPath = 'onboarding';

  ///Path to places list screen
  static const String placesListPath = 'placesList';

  ///Path to places list screen
  static const String settingsPath = 'settings';
}
