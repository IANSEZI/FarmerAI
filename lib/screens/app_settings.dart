import 'package:flutter/material.dart';

class AppSettings extends ChangeNotifier {
  bool _darkMode = false;
  double _fontSize = 16.0;
  Color _themeColor = Colors.green;
  String _fontFamily = 'Default';

  bool get darkMode => _darkMode;
  double get fontSize => _fontSize;
  Color get themeColor => _themeColor;
  String get fontFamily => _fontFamily;

  void toggleDarkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }

  void setFontSize(double value) {
    _fontSize = value;
    notifyListeners();
  }

  void setThemeColor(Color color) {
    _themeColor = color;
    notifyListeners();
  }

  void setFontFamily(String family) {
    _fontFamily = family;
    notifyListeners();
  }
}
