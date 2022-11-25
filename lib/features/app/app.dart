import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:surf_study_project/assets/themes/app_themes.dart';
import 'package:surf_study_project/config/app_config.dart';
import 'package:surf_study_project/config/environment/environment.dart';
import 'package:surf_study_project/features/app/di/app_scope.dart';
import 'package:surf_study_project/features/common/widgets/di_scope/di_scope.dart';
import 'package:surf_study_project/persistence/storage/config_storage/config_storage_impl.dart';

/// App widget.
class App extends StatefulWidget {
  /// Create an instance App.
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late IAppScope _scope;

  @override
  void initState() {
    super.initState();

    _scope = AppScope(applicationRebuilder: _rebuildApplication);

    final configStorage = ConfigSettingsStorageImpl();
    final environment = Environment<AppConfig>.instance();
    if (!environment.isRelease) {
      environment.refreshConfigProxy(configStorage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      key: ObjectKey(_scope),
      factory: () {
        return _scope;
      },
      child: MaterialApp.router(
        /// Themes
        theme: AppThemes.lightTheme,
        darkTheme: ThemeData.dark(),
        /// Localization.
        locale: _localizations.first,
        localizationsDelegates: _localizationsDelegates,
        supportedLocales: _localizations,
        /// This is for navigation.
        routeInformationParser: _scope.router.defaultRouteParser(),
        routerDelegate: _scope.router.delegate(),
      ),
    );
  }

  void _rebuildApplication() {
    setState(() {
      _scope = AppScope(applicationRebuilder: _rebuildApplication);
    });
  }
}

// You need to customize for your project.
const _localizations = [Locale('ru', 'RU')];

const _localizationsDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
