// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      final args = routeData.argsAs<SplashRouterArgs>(
          orElse: () => const SplashRouterArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SplashScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    OnboardingRouter.name: (routeData) {
      final args = routeData.argsAs<OnboardingRouterArgs>(
          orElse: () => const OnboardingRouterArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: OnboardingScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    MainRouter.name: (routeData) {
      final args = routeData.argsAs<MainRouterArgs>(
          orElse: () => const MainRouterArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MainScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    PlacesListRouter.name: (routeData) {
      final args = routeData.argsAs<PlacesListRouterArgs>(
          orElse: () => const PlacesListRouterArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: PlacesListScreen(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    SettingsRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        RouteConfig(
          SplashRouter.name,
          path: 'splash',
        ),
        RouteConfig(
          OnboardingRouter.name,
          path: 'onboarding',
        ),
        RouteConfig(
          MainRouter.name,
          path: 'main',
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: MainRouter.name,
              redirectTo: 'placesList',
              fullMatch: true,
            ),
            RouteConfig(
              PlacesListRouter.name,
              path: 'placesList',
              parent: MainRouter.name,
            ),
            RouteConfig(
              SettingsRouter.name,
              path: 'settings',
              parent: MainRouter.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [SplashScreen]
class SplashRouter extends PageRouteInfo<SplashRouterArgs> {
  SplashRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = splashScreenWmFactory,
  }) : super(
          SplashRouter.name,
          path: 'splash',
          args: SplashRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
        );

  static const String name = 'SplashRouter';
}

class SplashRouterArgs {
  const SplashRouterArgs({
    this.key,
    this.wmFactory = splashScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'SplashRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRouter extends PageRouteInfo<OnboardingRouterArgs> {
  OnboardingRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = onboardingScreenWmFactory,
  }) : super(
          OnboardingRouter.name,
          path: 'onboarding',
          args: OnboardingRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
        );

  static const String name = 'OnboardingRouter';
}

class OnboardingRouterArgs {
  const OnboardingRouterArgs({
    this.key,
    this.wmFactory = onboardingScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'OnboardingRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [MainScreen]
class MainRouter extends PageRouteInfo<MainRouterArgs> {
  MainRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = mainScreenWmFactory,
    List<PageRouteInfo>? children,
  }) : super(
          MainRouter.name,
          path: 'main',
          args: MainRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRouter';
}

class MainRouterArgs {
  const MainRouterArgs({
    this.key,
    this.wmFactory = mainScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'MainRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [PlacesListScreen]
class PlacesListRouter extends PageRouteInfo<PlacesListRouterArgs> {
  PlacesListRouter({
    Key? key,
    WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
            BuildContext)
        wmFactory = placesListScreenWmFactory,
  }) : super(
          PlacesListRouter.name,
          path: 'placesList',
          args: PlacesListRouterArgs(
            key: key,
            wmFactory: wmFactory,
          ),
        );

  static const String name = 'PlacesListRouter';
}

class PlacesListRouterArgs {
  const PlacesListRouterArgs({
    this.key,
    this.wmFactory = placesListScreenWmFactory,
  });

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) wmFactory;

  @override
  String toString() {
    return 'PlacesListRouterArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRouter extends PageRouteInfo<void> {
  const SettingsRouter()
      : super(
          SettingsRouter.name,
          path: 'settings',
        );

  static const String name = 'SettingsRouter';
}
