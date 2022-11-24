import 'package:surf_study_project/config/app_config.dart';
import 'package:surf_study_project/config/environment/build_types.dart';
import 'package:surf_study_project/config/environment/environment.dart';
import 'package:surf_study_project/config/urls.dart';
import 'package:surf_study_project/runner.dart';

/// Main entry point of app.
void main() {
  Environment.init(
    buildType: BuildType.debug,
    config: AppConfig(
      url: Url.testUrl,
    ),
  );

  run();
}
