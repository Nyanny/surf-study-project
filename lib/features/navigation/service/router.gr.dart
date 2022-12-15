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
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'onboarding',
          fullMatch: true,
        ),
        RouteConfig(
          OnboardingRouter.name,
          path: 'onboarding',
        ),
      ];
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
