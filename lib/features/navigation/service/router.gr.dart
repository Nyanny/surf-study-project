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
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'placesList',
          fullMatch: true,
        ),
        RouteConfig(
          PlacesListRouter.name,
          path: 'placesList',
        ),
      ];
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
