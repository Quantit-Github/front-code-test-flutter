import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static void saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else {
      debugPrint("Invalid Type");
    }
  }

  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Future<bool> logout() async {
    const List<String> protectedKey = ['themeMode', 'locale'];
    final prefs = await SharedPreferences.getInstance();
    List prefKeys = List<String>.from(prefs.getKeys().toList());
    for (String key in prefKeys) {
      if (!protectedKey.contains(key)) {
        await deleteData(key);
      }
    }
    return true;
  }
}
