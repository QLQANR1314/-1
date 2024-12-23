import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> set(String key, String value) {
    return prefs.setString(key, value);
  }

  static String? get(String key) {
    return prefs.getString(key);
  }

  static Future<bool> remove(String key) {
    return prefs.remove(key);
  }

  static Future<bool> clear() {
    return prefs.clear();
  }
}
