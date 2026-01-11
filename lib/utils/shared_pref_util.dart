import 'package:shared_preferences/shared_preferences.dart';
import 'pref_const.dart';

class SharedPrefUtil {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _prefs?.getBool(key) ?? defaultValue;
  }

  static Future<void> clear() async {
    await _prefs?.clear();
  }

  static bool get isLoggedIn => getBool(PrefConst.isLoggedIn);
  static Future<void> setLoggedIn(bool value) =>
      setBool(PrefConst.isLoggedIn, value);
}
