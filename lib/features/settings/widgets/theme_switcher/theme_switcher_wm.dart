import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_study_project/features/app/di/app_scope.dart';
import 'package:surf_study_project/features/settings/widgets/theme_switcher/theme_switcher_model.dart';
import 'package:surf_study_project/features/settings/widgets/theme_switcher/theme_switcher_widget.dart';

/// Factory for [ThemeSwitcherWidgetModel].
ThemeSwitcherWidgetModel themeSwitcherWmFactory(
  BuildContext context,
) {
  final appScope = context.read<IAppScope>();
  final model = ThemeSwitcherModel(appScope.appSettingsService);
  return ThemeSwitcherWidgetModel(model);
}

/// Class [ThemeSwitcherWidgetModel] is a [WidgetModel] for [ThemeSwitcherWidget]
class ThemeSwitcherWidgetModel
    extends WidgetModel<ThemeSwitcherWidget, ThemeSwitcherModel>
    implements IThemeSwitcherWidgetModel {
  /// bool [StateNotifier] for theme feature
  final _themeState = StateNotifier<bool>();

  /// returns [_themeLightingChanged]
  @override
  ValueChanged<bool> get themeLightingChanged => _themeLightingChanged;

  /// returns [_themeState]
  @override
  ListenableState<bool> get themeState => _themeState;

  /// constructor
  ThemeSwitcherWidgetModel(ThemeSwitcherModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    final isDark = model.initData();
    _themeState.accept(isDark);
  }

  /// sets new theme boolean value
  void _themeLightingChanged(bool isDark) {
    _themeState.accept(isDark);
    model.setThemeLighting(isDark: isDark);
  }
}

/// Interface of [IThemeSwitcherWidgetModel].
abstract class IThemeSwitcherWidgetModel extends IWidgetModel {
  /// [ListenableState] that returns theme value to listen
  ListenableState<bool> get themeState;

  /// [ValueChanged] callback to set theme value
  ValueChanged<bool> get themeLightingChanged;
}
