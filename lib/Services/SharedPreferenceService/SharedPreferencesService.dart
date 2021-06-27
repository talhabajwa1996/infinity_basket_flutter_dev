import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.get(key);
  }
}
