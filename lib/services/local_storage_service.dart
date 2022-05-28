// local_storage_service.dart:
// In this file, we write all the code needed to store and get data from the local storage using the plugin
// shared_preferences.In this file, there will be getters and setters for each and every data to be stored in the local storage.

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future save(String key, value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, json.encode(value));
}

Future read(String key) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString(key) != null) {
    return json.decode(prefs.getString(key) ?? '');
  } else
    return null;
}

class SharedPreferencesConstant {
  static const USER_ID = 'USER_ID';
}
