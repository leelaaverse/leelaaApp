import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHandler {
  static final SharedPreferencesHandler _instance =
  SharedPreferencesHandler._internal();
  SharedPreferences? prefs;

  factory SharedPreferencesHandler() {
    return _instance;
  }

  SharedPreferencesHandler._internal();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> storeBoolData(String key, bool value) async {
    if (prefs != null) {
      return await prefs!.setBool(key, value);
    }
    return false;
  }

  bool getBoolData(String key) {
    if (prefs != null) {
      return prefs!.getBool(key) ?? false;
    }
    return false;
  }

  Future<bool> storeStringData(String key, String value) async {
    if (prefs != null) {
      return await prefs!.setString(key, value);
    }
    return false;
  }

  String getStringData(String key) {
    if (prefs != null) {
      return prefs!.getString(key) ?? "";
    }
    return "";
  }

  Future<bool> storeIntData(String key, int value) async {
    if (prefs != null) {
      return await prefs!.setInt(key, value);
    }
    return false;
  }

  int getIntData(String key) {
    if (prefs != null) {
      return prefs!.getInt(key) ?? 0;
    }
    return 0;
  }

  clearPreference() {
    if (prefs != null) {
      prefs!.clear();
    }
  }
}
