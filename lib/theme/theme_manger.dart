import 'package:flutter/material.dart';

class ThemeManger with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;
  get themeMode => _themeMode;

  togglThemeData(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
