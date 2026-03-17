import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;


  static Future<void> init() async{
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async{
    await prefs.setString(key, value);
  }

  static Future<void> getString(String key) async{
    await prefs.getString(key)?? '';
  }

  static Future<void> setInt(String key, String value) async{
    await prefs.setString(key, value);
  }

  static Future<void> getInt(String key) async{
    await prefs.getInt(key)?? '';
  }

  



}