import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_study_project/assets/res/app_assets.dart';
import 'package:surf_study_project/assets/res/app_typography.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/features/screens/onboarding/onboarding_screen.dart';
import 'package:surf_study_project/features/screens/onboarding/onboarding_screen_model.dart';
import 'package:surf_study_project/features/widgets/onboarding_widgets/onboarding_page_widget.dart';

/// Factory for [OnboardingScreenWidgetModel].
OnboardingScreenWidgetModel onboardingScreenWmFactory(
  BuildContext context,
) {
  final model = OnboardingScreenModel();
  return OnboardingScreenWidgetModel(model);
}

/// Widget model for [OnboardingScreen].
class OnboardingScreenWidgetModel
    extends WidgetModel<OnboardingScreen, OnboardingScreenModel>
    implements IOnboardingScreenWidgetModel {
  final PageController _pageController = PageController();

  @override
  int get itemCount => _pages.length;

  @override
  PageController get pageController => _pageController;

  @override
  IndexedWidgetBuilder get itemBuilder => _itemBuilder;

  /// The value may be seem weird, but it is the same on the left and right. like left and right 185.7
  @override
  double get dotsPositionHorizontal =>
      MediaQuery.of(context).size.width * 0.0000001;

  /// value based on design
  @override
  double get dotsPaddingVerticalBottom => 136;

  @override
  Color get activeDotColor => Theme.of(context).colorScheme.secondary;

  @override
  Color get dotColor => Theme.of(context).colorScheme.tertiary;

  @override
  double get dotSize => 8.0;

  List<Widget> _pages = [];

  /// Create an instance [OnboardingScreenModel].
  OnboardingScreenWidgetModel(OnboardingScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    _initOnboardingPages();
    super.initWidgetModel();
  }

  /// transition to a next page
  void _onSkipButtonPressed() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  /// pages initialisation
  void _initOnboardingPages() {
    _pages = [
      /// first page - "map"
      OnboardingPageWidget(
        isLastPage: false,
        picture: _picture(AppAssets.roadSign),
        title: _title(AppStrings.onboardingScreenMapPageTitle),
        subtitle: _subtitle(AppStrings.onboardingScreenMapPageSubitle),
        onPressed: _onSkipButtonPressed,
      ),

      /// second page - "routes"
      OnboardingPageWidget(
        isLastPage: false,
        picture: _picture(AppAssets.backpack),
        title: _title(AppStrings.onboardingScreenRoutePageTitle),
        subtitle: _subtitle(AppStrings.onboardingScreenRoutePageSubitle),
        onPressed: _onSkipButtonPressed,
      ),

      /// last page - "tap"
      OnboardingPageWidget(
        isLastPage: true,
        picture: _picture(AppAssets.tap),
        title: _title(AppStrings.onboardingScreenPlacesPageTitle),
        subtitle: _subtitle(AppStrings.onboardingScreenPlacesPageSubitle),
        onPressed: _onSkipButtonPressed,
      ),
    ];
  }

  /// itembuilder that builds pages
  Widget _itemBuilder(BuildContext context, int index) {
    return _pages[index % _pages.length];
  }

  /// description [SvgPicture]
  SvgPicture _picture(String assetPath) {
    return SvgPicture.asset(
      assetPath,
      color: Theme.of(context).colorScheme.onBackground,
    );
  }

  /// description title
  Text _title(String title) {
    return Text(
      title,
      style: AppTypography.title
          .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      textAlign: TextAlign.center,
    );
  }

  /// description subtitle
  Text _subtitle(String title) {
    return Text(
      title,
      style: AppTypography.smallText
          .copyWith(color: Theme.of(context).colorScheme.onTertiary),
      textAlign: TextAlign.center,
    );
  }
}

/// Interface of [IOnboardingScreenWidgetModel].
abstract class IOnboardingScreenWidgetModel extends IWidgetModel {
  PageController get pageController;

  /// Itembuilder that builds content of [OnboardingScreen]
  /// Current realization - PageView.builder
  IndexedWidgetBuilder get itemBuilder;

  /// itemcount of pages
  int get itemCount;

  /// horizontal dots position, ex. for Alignment
  double get dotsPositionHorizontal;

  /// Dots padding from the bottom
  double get dotsPaddingVerticalBottom;

  /// dots inactive color
  Color get dotColor;

  /// dots active color
  Color get activeDotColor;

  /// dots size
  double get dotSize;
}
