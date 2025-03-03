import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:surf_study_project/features/common/domain/entity/place.dart';
import 'package:surf_study_project/features/common/widgets/error/error_screen.dart';
import 'package:surf_study_project/features/places_list/screens/places_list_screen/places_list_screen_wm.dart';
import 'package:surf_study_project/features/places_list/widgets/appbar/places_list_appbar.dart';
import 'package:surf_study_project/features/places_list/widgets/card/card_place.dart';
import 'package:surf_study_project/features/places_list/widgets/indicators/places_list_loading_indicator.dart';
import 'package:surf_study_project/features/places_list/widgets/search_widget/search_widget.dart';

/// Class [PlacesListScreen] is main screen for placesList feature
/// Implements [CustomScrollView] with [PlacesListAppBar] and [PagedSliverList] wrapped by [SliverPadding]
class PlacesListScreen extends ElementaryWidget<IPlacesListScreenWidgetModel> {
  /// Create an instance [PlacesListScreen].
  const PlacesListScreen({
    Key? key,
    WidgetModelFactory wmFactory = placesListScreenWmFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IPlacesListScreenWidgetModel wm) {
    final expandedHeight = 130.w + wm.statusBarHeight;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          PlacesListAppBar(
            colors: wm.placeListColors,
            maxHeight: expandedHeight,
          ),
          SearchWidget(
            onSearchButtonTap: wm.onSearchButtonTap,
            onFilterButtonTap: wm.onFilterButtonTap,
            colors: wm.placeListColors,
          ),
        ],
        body: RefreshIndicator(
          onRefresh: wm.onRefresh,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: PagedListView<int, Place>.separated(
              pagingController: wm.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Place>(
                firstPageProgressIndicatorBuilder: (_) =>
                    const PlacesListLoadingIndicator(),
                newPageProgressIndicatorBuilder: (_) =>
                    const _NewPageProgressIndicatorBuilder(),
                firstPageErrorIndicatorBuilder: (_) => const ErrorScreen(),
                newPageErrorIndicatorBuilder: (_) =>
                    const _NewPageErrorIndicatorBuilder(),
                itemBuilder: (_, item, index) {
                  return CardPlace(
                    cardIndex: index,
                    place: item,
                    onPressedCard: wm.onPressedCard,
                  );
                },
              ),
              separatorBuilder: (_, __) => SizedBox(height: 24.w),
            ),
          ),
        ),
      ),
    );
  }
}

class _NewPageProgressIndicatorBuilder extends StatelessWidget {
  const _NewPageProgressIndicatorBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PlacesListLoadingIndicator(),
        SizedBox(
          height: 24.w,
        ),
      ],
    );
  }
}

class _NewPageErrorIndicatorBuilder extends StatelessWidget {
  const _NewPageErrorIndicatorBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ErrorScreen(),
        SizedBox(
          height: 24.w,
        ),
      ],
    );
  }
}
