import 'package:shared_preferences/shared_preferences.dart';

String? token;

class CacheNetwork {
  static late SharedPreferences sharedPref;
  static sharedPreferencesIntilization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future insertToCache({required String key, required String value}) {
    return sharedPref.setString(key, value);
  }

  static String getFromCache({required String key}) {
    return sharedPref.getString(key) ?? "";
  }

  static Future deleteFromCache({required String key}) {
    return sharedPref.remove(key);
  }
}
