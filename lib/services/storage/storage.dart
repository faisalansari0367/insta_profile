import 'dart:async';

import 'package:insta_profile/models/insta_user.dart';

abstract class StorageService {
  Future<void> saveRecentUsers(List<InstaUser> users);
  Future<void> initService();
  List<InstaUser> getRecentUsers();
  Future<void> saveUserData(InstaUser data);
  InstaUser getUserData();
  Future<void> setDarkMode(bool value);
  bool getDarkMode();

}
