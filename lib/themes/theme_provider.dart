import 'package:flutter/material.dart';
import 'package:twitter_clone/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData themeData = lightMode;
}
