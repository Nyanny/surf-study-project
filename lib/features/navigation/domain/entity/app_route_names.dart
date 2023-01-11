/// List of all route names used in temp feature.
///
/// Have to been filled with the entries like this:
/// ```dart
/// /// Name description.
/// static const String screenName = 'screenNameRoute';
/// ```
abstract class AppRouteNames {
  /// OnboardingScreen route name
  static const String onboardingScreen = 'onboardingRouter';

  /// PlacesListScreen route name
  static const String placesListScreen = 'placesListRouter';

  /// SettingsListScreen route name
  static const String settingsScreen = 'settingsRouter';

  /// MainListScreen route name
  static const String mainScreen = 'mainRouter';

  /// SplashScreen route name
  static const String splashScreen = 'splashRouter';
}
