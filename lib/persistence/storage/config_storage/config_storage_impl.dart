import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_study_project/persistence/storage/config_storage/config_storage.dart';

/// Persistent storage for config settings.
///
/// Based on SharedPreferences.
class ConfigSettingsStorageImpl implements IConfigSettingsStorage {
  static const String _proxyKey = 'proxy_url';

  /// Create an instance [ConfigSettingsStorageImpl].
  ConfigSettingsStorageImpl();

  @override
  Future<String?> getProxyUrl() async {
    return (await SharedPreferences.getInstance()).getString(_proxyKey);
  }

  @override
  Future<void> setProxyUrl({required String proxy}) async {
    await (await SharedPreferences.getInstance()).setString(_proxyKey, proxy);
  }
}
