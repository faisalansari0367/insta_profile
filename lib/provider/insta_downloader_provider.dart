import 'package:flutter/material.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:insta_profile/domain/api/api.dart';
import 'package:insta_profile/models/insta_user.dart';
import 'package:insta_profile/services/download_service.dart';
import 'package:insta_profile/services/storage/storage_service_hive.dart';
import 'package:insta_profile/widgets/my_snack_bar.dart';

class Insta extends ChangeNotifier {
  bool _isLoading = true;
  InstaUser? userData;
  bool get isLoading => _isLoading;
  final storage = HiveStorage();
  List<InstaUser> recentUsers = [];

  Insta() {
    const userName = 'faisal._.ehaz';
    getDetailsFromUsername(userName);
    getUsersFromStorage();
    listenToBox();
  }

  void listenToBox() {
    storage.box.watch().listen((event) {
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
    userData = recentUsers.first;
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
    // userData = null;
    setLoading(true);
    try {
      userData = await Api.getUserData(userName);
      if (userData != null) {
        storage.saveUserData(userData!);
      }
    } on Exception catch (e) {
      MySnackBar.show(e.toString());
      // final insta = FlutterInsta();
      // await insta.getProfileData(userName);
      // final instaUser = InstaUser(
      //   followers: insta.followers,
      //   following: insta.following,
      //   fullName: insta.username,
      //   hdImageUrl: insta.imgurl,
      //   imageUrl: insta.imgurl,
      //   userName: insta.username,
      // );
      // userData = instaUser;
    }
    setLoading(false);
  }
}
