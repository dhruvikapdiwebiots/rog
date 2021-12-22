import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
//store String value in SharedPref
  Future<bool> save(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(key, value);
  }

  Future<bool> saveInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setInt(key, value);
  }

  //remove/clear the storage value
  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  // get string value from Shared Pref storage
  Future<String?> getSharedPref(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
