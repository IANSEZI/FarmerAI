import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  bool _darkMode = false;
  double _fontSize = 16.0;
  Color _themeColor = Colors.green;
  String _fontFamily = 'Default'; 

  // Keep all your existing getters
  bool get darkMode => _darkMode;
  double get fontSize => _fontSize;
  Color get themeColor => _themeColor;
  String get fontFamily => _fontFamily;

  // Initialize preferences
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _darkMode = prefs.getBool('darkMode') ?? _darkMode;
    _fontSize = prefs.getDouble('fontSize') ?? _fontSize;
    final colorValue = prefs.getInt('themeColor');
    _themeColor = colorValue != null ? Color(colorValue) : _themeColor;
    _fontFamily = prefs.getString('fontFamily') ?? _fontFamily;
    notifyListeners();
  }

  // Modified methods to save preferences
  void toggleDarkMode(bool value) {
    _darkMode = value;
    _savePreference('darkMode', value);
    notifyListeners();
  }

  void setFontSize(double value) {
    _fontSize = value;
    _savePreference('fontSize', value);
    notifyListeners();
  }

  void setThemeColor(Color color) {
    _themeColor = color;
    _savePreference('themeColor', color.value);
    notifyListeners();
  }

  void setFontFamily(String family) {
    _fontFamily = family;
    _savePreference('fontFamily', family);
    notifyListeners();
  }

  // Helper method to save preferences
  Future<void> _savePreference<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    switch (T) {
      case bool:
        await prefs.setBool(key, value as bool);
        break;
      case double:
        await prefs.setDouble(key, value as double);
        break;
      case int:
        await prefs.setInt(key, value as int);
        break;
      case String:
        await prefs.setString(key, value as String);
        break;
    }
  }
}
