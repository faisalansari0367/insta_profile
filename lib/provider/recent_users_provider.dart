import 'package:flutter/material.dart';
import 'package:insta_profile/models/insta_user.dart';
import 'package:insta_profile/services/storage/storage_service_hive.dart';

class RecentUsersProvider extends ChangeNotifier {
  List<InstaUser> recentUsers = [];
  final storage = HiveStorage();
  bool isLoading = false;
  RecentUsersProvider() {
    _getUsersFromStorage();
    _listenToBox();
  }
  void _listenToBox() async {
    storage.watchRecentUsers().listen((event) {
      _getUsersFromStorage(eventValue: event.value);
    });
  }

  // ignore: unused_element
  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void _getUsersFromStorage({eventValue}) {
    recentUsers = storage.getRecentUsers(value: eventValue);
    if (recentUsers.isEmpty) return;
    notifyListeners();
  }
}
