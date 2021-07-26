import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrences {
  //Methods to add data to sharedprefs
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

  static Future addDoubleToSharedPref(
      {required String key, required double value}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setDouble(key, value);
    } catch (e) {
      print(e);
      return false;
    }
  }

//Methods to retrieve data from sharedPrefs

  static Future<dynamic> getDataFromSharedPref(
      {required String key, required String dataType}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    switch (dataType) {
      case 'string':
        return (pref.getString(key) ?? '');

      case 'bool':
        return (pref.getBool(key) ?? false);

      case 'double':
        return (pref.getDouble(key) ?? 0.0);

      case 'int':
        return (pref.getInt(key) ?? 0);

      default:
        return (pref.getString(key) ?? '');
    }
  }
}
