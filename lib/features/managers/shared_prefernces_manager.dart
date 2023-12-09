import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static late SharedPreferences _prefs;
  static const _tokenKey = 'TOKEN';

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setToken({required String token}) async {
    await _prefs.setString(_tokenKey, token);
  }

  static String getAuthToken(){
    return _prefs.getString(_tokenKey)!;
  }

  static bool checkIsTokenExist() {
    final token = _prefs.getString(_tokenKey);

    return token != null;
  }

  static void clearAuthToken() {
    _prefs.remove(_tokenKey);
  }
}
