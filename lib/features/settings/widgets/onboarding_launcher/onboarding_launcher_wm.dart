import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_study_project/features/app/di/app_scope.dart';
import 'package:surf_study_project/features/navigation/domain/entity/app_route_paths.dart';
import 'package:surf_study_project/features/navigation/service/router.dart';
import 'package:surf_study_project/features/settings/widgets/onboarding_launcher/onboarding_launcher_model.dart';
import 'package:surf_study_project/features/settings/widgets/onboarding_launcher/onboarding_launcher_widget.dart';

/// Factory for [OnboardingLauncherWidgetModel].
OnboardingLauncherWidgetModel onboardingScreenWmFactory(
  BuildContext context,
) {
  final appDependencies = context.read<IAppScope>();
  final router = appDependencies.router;

  final model = OnboardingLauncherModel();
  return OnboardingLauncherWidgetModel(model, router);
}

/// Class [OnboardingLauncherWidgetModel] is [WidgetModel]
/// Function [_launchOnboarding] launches onboarding
class OnboardingLauncherWidgetModel
    extends WidgetModel<OnboardingLauncherWidget, OnboardingLauncherModel>
    implements IOnboardingLauncherWidgetModel {
  /// [AppRouter] instance
  final AppRouter router;

  /// public function that returns [_launchOnboarding]
  @override
  VoidCallback get launchOnboarding => _launchOnboarding;

  /// constructor
  OnboardingLauncherWidgetModel(OnboardingLauncherModel model, this.router)
      : super(model);

  /// launches onboarding
  /// uses [router] to push to new page
  void _launchOnboarding() {
    router.pushNamed(AppRoutePaths.onboardingPath);
  }
}

/// Interface of [IOnboardingLauncherWidgetModel].
abstract class IOnboardingLauncherWidgetModel extends IWidgetModel {
  /// [VoidCallback] to launch onboarding
  VoidCallback get launchOnboarding;
}
