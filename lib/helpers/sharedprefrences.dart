import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrences {
  static Future addBoolToSharedPref(String key, bool value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(key, value);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future addStringToSharedPref(String key, String value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future addIntToSharedPref(String key, int value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt(key, value);
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future addDoubleToSharedPref(String key, double value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setDouble(key, value);
    } catch (e) {
      print(e);
      return false;
    }
  }
}
