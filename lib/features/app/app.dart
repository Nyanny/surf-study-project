import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      child: ScreenUtilInit(
        designSize: const Size(360, 760),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return EntityStateNotifierBuilder<bool>(
            listenableEntityState: _scope.appSettingsService.themeState,
            builder: (context, isDark) {
              return MaterialApp.router(
                /// Themes

                theme: (isDark ?? true)
                    ? AppThemes.darkTheme
                    : AppThemes.lightTheme,

                /// Localization.
                locale: _localizations.first,
                localizationsDelegates: _localizationsDelegates,
                supportedLocales: _localizations,

                /// This is for navigation.
                routeInformationParser: _scope.router.defaultRouteParser(),
                routerDelegate: _scope.router.delegate(),
              );
            },
            loadingBuilder: (_, __) => const SizedBox.shrink(),
          );
        },
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
