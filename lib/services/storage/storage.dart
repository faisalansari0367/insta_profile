import 'dart:async';

import 'package:insta_profile/models/insta_user.dart';

abstract class StorageService {
  Future<void> initService();
  List<InstaUser> getRecentUsers();
  Future<void> saveUserData(InstaUser data);
  InstaUser getUserData();
}
