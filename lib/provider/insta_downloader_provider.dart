import 'package:flutter/material.dart';
import 'package:insta_profile/domain/api/api.dart';
import 'package:insta_profile/models/insta_user.dart';
import 'package:insta_profile/services/download_service.dart';
import 'package:insta_profile/services/storage/storage_service_hive.dart';
import 'package:insta_profile/widgets/my_snack_bar.dart';

class Insta extends ChangeNotifier {
  bool _isLoading = false;
  InstaUser? userData;
  bool get isLoading => _isLoading;
  final storage = HiveStorage();
  List<InstaUser> recentUsers = [];

  Insta() {
    // const userName = 'faisal._.ehaz';
    // getDetailsFromUsername(userName);
    // storage.box.clear();
    getUsersFromStorage();
    listenToBox();
  }

  void listenToBox() async {
    storage.box.watch().listen((event) {
      // final boxItems = storage.box.values.toList();
      // if (recentUsers.length < boxItems.length)
      getUsersFromStorage();
    });
  }

  void setUserFromRecents(int index) {
    userData = recentUsers.elementAt(index);
    notifyListeners();
    getDetailsFromUsername(userData!.userName);
  }

  void getUsersFromStorage() {
    recentUsers = storage.getRecentUsers();
    print(recentUsers);
    if (recentUsers.isEmpty) return;
    userData ??= recentUsers.first;
    notifyListeners();
  }

  void onLongPress(String imageUrl, String userName) async {
    final taskId = await DownloadService.addToQueue(imageUrl, userName);
    MySnackBar.show('Task $taskId added to download queue');
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> getDetailsFromUsername(String? userName) async {
    if (userName == null) return;
    setLoading(true);
    try {
      // await Future.delayed(const Duration(minutes: 5));
      final _userData = await Api.getUserData(userName);
      // final userAlreadyExist = recentUsers.contains(userData);
      // if (userAlreadyExist) return;
      userData = _userData;
      storage.saveUserData(userData!);
    } on Exception catch (e) {
      MySnackBar.show(e.toString());
    }
    setLoading(false);
  }
}
