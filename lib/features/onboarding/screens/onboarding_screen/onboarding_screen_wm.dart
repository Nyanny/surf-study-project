import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_study_project/assets/res/app_assets.dart';
import 'package:surf_study_project/assets/strings/app_strings.dart';
import 'package:surf_study_project/assets/themes/themes_flavours/onboarding_colors.dart';
import 'package:surf_study_project/features/app/di/app_scope.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';
import 'package:surf_study_project/features/navigation/service/router.dart';
import 'package:surf_study_project/features/onboarding/domain/onboarding_page_data.dart';
import 'package:surf_study_project/features/onboarding/screens/onboarding_screen/onboarding_screen.dart';
import 'package:surf_study_project/features/onboarding/screens/onboarding_screen/onboarding_screen_model.dart';

/// Factory for [OnboardingScreenWidgetModel].
OnboardingScreenWidgetModel onboardingScreenWmFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final router = appDependencies.router;
  final appSettingsService = appDependencies.appSettingsService;
  final model = OnboardingScreenModel(appSettingsService);
  return OnboardingScreenWidgetModel(model, router);
}

/// Widget model for [OnboardingScreen].
class OnboardingScreenWidgetModel
    extends WidgetModel<OnboardingScreen, OnboardingScreenModel>
    implements IOnboardingScreenWidgetModel {
  /// [AppRouter] instance
  final AppRouter router;
  final PageController _pageController = PageController();

  final StateNotifier<bool> _isLastPage = StateNotifier<bool>(initValue: false);

  @override
  OnboardingColors? get onboardingTheme =>
      Theme.of(context).extension<OnboardingColors>();

  @override
  List<OnboardingPageData> get pageData => _pageData;

  @override
  int get itemCount => pageData.length;

  @override
  ValueSetter<int> get onPageChanged => _onPageChanged;

  @override
  ListenableState<bool> get isLastPage => _isLastPage;

  @override
  PageController get pageController => _pageController;

  @override
  VoidCallback get skipButtonAction => _onSkipButtonPressed;

  @override
  VoidCallback get startButtonAction => _onStartButtonPressed;

  /// Create an instance [OnboardingScreenModel].
  OnboardingScreenWidgetModel(
    OnboardingScreenModel model,
    this.router,
  ) : super(model);

  /// onPageChanged callback
  void _onPageChanged(int pageIndex) {
    _isLastPage.accept(pageIndex == itemCount - 1);
  }

  /// skips tutorial
  Future<void> _onSkipButtonPressed() async {
    await _routeFromOnboarding();
  }

  /// action on StartButton
  /// Passes to new screen - main
  Future<void> _onStartButtonPressed() async {
    await _routeFromOnboarding();
  }

  /// routes from onboarding
  Future<void> _routeFromOnboarding() async {
    await model.setOnboardingIsPassed();
    router.removeLast();
    await router.replaceNamed(AppRoutePaths.mainPath);
  }
}

/// Interface of [IOnboardingScreenWidgetModel].
abstract class IOnboardingScreenWidgetModel extends IWidgetModel {
  /// theme of Onboarding feature
  OnboardingColors? get onboardingTheme;

  /// data displayed on OnboardingPage
  List<OnboardingPageData> get pageData;

  /// pages item count
  int get itemCount;

  /// last page flag
  ListenableState<bool> get isLastPage;

  /// onPageChanged for page_view
  ValueSetter<int> get onPageChanged;

  /// PageController for page_view
  PageController get pageController;

  /// action for SkipButton
  VoidCallback get skipButtonAction;

  /// action for StartButton
  VoidCallback get startButtonAction;
}

List<OnboardingPageData> _pageData = [
  /// first page - "map"
  OnboardingPageData(
    picturePath: AppAssets.roadSign,
    title: AppStrings.onboardingScreenMapPageTitle,
    subtitle: AppStrings.onboardingScreenMapPageSubitle,
  ),

  /// second page - "routes"
  OnboardingPageData(
    picturePath: AppAssets.backpack,
    title: AppStrings.onboardingScreenRoutePageTitle,
    subtitle: AppStrings.onboardingScreenRoutePageSubitle,
  ),

  /// last page - "tap"
  OnboardingPageData(
    picturePath: AppAssets.tap,
    title: AppStrings.onboardingScreenPlacesPageTitle,
    subtitle: AppStrings.onboardingScreenPlacesPageSubitle,
  ),
];
