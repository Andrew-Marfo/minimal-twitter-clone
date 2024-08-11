import 'package:flutter/material.dart';
import 'package:twitter_clone/themes/dark_mode.dart';
import 'package:twitter_clone/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;

    notifyListeners();
  }

  void toggleTheme() {
    themeData = isDarkMode ? lightMode : darkMode;
  }
}
