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

  ///Path to settings screen
  static const String settingsPath = 'settings';

  ///Path to main screen
  static const String mainPath = 'main';

  ///Path to splash screen
  static const String splashPath = 'splash';

  ///Path to  filter screen
  static const String filterPath = 'filter';
}
