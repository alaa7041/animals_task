import 'package:shared_preferences/shared_preferences.dart';

class CachingUtils {
  static late SharedPreferences _sharedPreferences;

  static const String _darkThemeKey = 'dark_theme';

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> get getDarkTheme async {
    bool isDark = _sharedPreferences.getBool(_darkThemeKey) ?? false;
    return isDark;
  }

  static Future<void> cacheDarkTheme(bool value) async {
    await _sharedPreferences.setBool(_darkThemeKey, value);
  }
}
