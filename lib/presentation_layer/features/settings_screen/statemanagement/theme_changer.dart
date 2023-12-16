import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  var _themeMode = ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
