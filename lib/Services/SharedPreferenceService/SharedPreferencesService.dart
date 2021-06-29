import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setString(String key, String value) async {
    print(key + "" +value);
    SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);

  }

  Future<void> setInt(String key, int value) async {
    SharedPreferences prefs = await _prefs;
    prefs.setInt(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await _prefs;
    prefs.setBool(key, value);
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<int> getInt(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getInt(key);
  }

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getBool(key);
  }

  Future<void> clearLocalData() async {
    SharedPreferences prefs = await _prefs;
    await prefs.clear();
  }
}
