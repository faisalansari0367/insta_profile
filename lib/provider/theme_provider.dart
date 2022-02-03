import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  ThemeProvider();

  void changeTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

  // String getLogo(context) {
  //   final brightness = Theme.of(context).brightness;
  //   return brightness == Brightness.dark ? AppDetail.logo : AppDetail.logoDark;
  // }

  // ThemeData getTheme(bool value) {
  //   return !isDarkMode ? CustomTheme.lightTheme : CustomTheme.darkTheme;
  // }