import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:surf_study_project/features/app/di/app_scope.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/places_list/screens/places_list_screen/places_list_screen.dart';
import 'package:surf_study_project/features/places_list/screens/places_list_screen/places_list_screen_model.dart';

/// Factory for [PlacesListScreenWidgetModel].
PlacesListScreenWidgetModel placesListScreenWmFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final model = PlacesListScreenModel(appDependencies.placeService);
  return PlacesListScreenWidgetModel(model);
}

/// Widget model for [PlacesListScreen].
class PlacesListScreenWidgetModel
    extends WidgetModel<PlacesListScreen, PlacesListScreenModel>
    implements IPlacesListScreenWidgetModel {
  late final PagingController<int, Place> _pagingController;

  @override
  ValueSetter<int> get onPressedCard => _onPressedCard;

  @override
  PagingController<int, Place> get pagingController => _pagingController;

  int _offsetPlaces = 0;

  int _pageNumber = 0;

  /// Create an instance [PlacesListScreenWidgetModel].
  PlacesListScreenWidgetModel(PlacesListScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    _initPageController();

    super.initWidgetModel();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Future<void> onRefresh() async {
    _offsetPlaces = 0;
    _pagingController.refresh();
  }

  void _initPageController() {
    _pagingController =
        PagingController<int, Place>(firstPageKey: _offsetPlaces);
    pagingController.addPageRequestListener((pageKey) {
      _loadPlaces(_offsetPlaces);
    });
  }

  Future<void> _loadPlaces(int offset) async {
    await Future<void>.delayed(const Duration(milliseconds: 750));

    try {
      final places = await model.getPlaces(offset: offset);

      final isLastPage = places.length < 10;

      if (!isLastPage) {
        _pagingController.appendPage(places, _pageNumber);
        _pageNumber++;
      } else {
        _pagingController.appendLastPage(places);
      }
    } on Exception catch (err) {
      _pagingController.error = err;
    }
    _offsetPlaces += 10;
  }

  Future<void> _onPressedCard(int index) async {}
}

/// Interface of [PlacesListScreenWidgetModel].
abstract class IPlacesListScreenWidgetModel extends IWidgetModel {
  /// [PagingController] for the [PagedSliverList] used in [PlacesListScreen]
  PagingController<int, Place> get pagingController;

  /// onPressed callback handle card taps
  ValueSetter<int> get onPressedCard;

  /// refresh list
  Future<void> onRefresh();
}
