import 'package:flutter/material.dart';
import 'package:insta_profile/services/storage/storage_service_hive.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;
  final _storage = HiveStorage();

  ThemeProvider() {
    isDarkMode = _storage.getDarkMode();
  }

  void changeTheme() async {
    isDarkMode = !isDarkMode;
    notifyListeners();
    await _storage.setDarkMode(isDarkMode);
  }
}

