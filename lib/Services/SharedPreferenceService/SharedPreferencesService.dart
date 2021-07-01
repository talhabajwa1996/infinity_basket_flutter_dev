import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await _prefs;
    if (value != null && value.isNotEmpty) {
      prefs.setString(key, value);
    }
  }

  Future<void> setInt(String key, int value) async {
    SharedPreferences prefs = await _prefs;
    if (value != null) {
      prefs.setInt(key, value);
    }
  }

  Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await _prefs;
    if (value != null) {
      prefs.setBool(key, value);
    }
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.containsKey(key) ? prefs.getString(key) : "";
  }

  Future<int> getInt(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.containsKey(key) ? prefs.getInt(key) : null;
  }

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.containsKey(key) ? prefs.getBool(key) : null;
  }

  Future<void> clearLocalData() async {
    SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }
}
