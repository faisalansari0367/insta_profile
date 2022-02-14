import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:insta_profile/domain/api/api.dart';
import 'package:insta_profile/models/insta_user.dart';
import 'package:insta_profile/services/download_service.dart';
import 'package:insta_profile/services/storage/storage_service_hive.dart';
import 'package:insta_profile/services/storage/storage_utils.dart';
import 'package:insta_profile/widgets/my_snack_bar.dart';

class InstaProvider extends ChangeNotifier {
  bool _isLoading = false;
  InstaUser? userData;
  bool get isLoading => _isLoading;
  final storage = HiveStorage();
  List<InstaUser> _recentUsers = [];
  List<String> feedImages = [];

  InstaProvider() {
    _listenToBox();
  }

  void _listenToBox() async {
    _recentUsers = storage.getRecentUsers();
    storage.watchRecentUsers().listen((event) {
      _recentUsers = storage.getRecentUsers(value: event.value);
    });
  }

  void setUser(InstaUser user) {
    userData = user;
    notifyListeners();
    getDetailsFromUsername(user.userName);
  }

  void onLongPress(String imageUrl, String userName) async {
    final taskId = await DownloadService.addToQueue(imageUrl, userName);
    MySnackBar.show('Task $taskId added to download queue');
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> updateUser(InstaUser user) async {
    final equals = const DeepCollectionEquality().equals;
    final list = StorageUtils().updateRecentUsers(_recentUsers, user);
    final isEquals = equals(list, _recentUsers);
    if (!isEquals) await storage.saveRecentUsers(list);
  }

  Future<void> getDetailsFromUsername(String? userName) async {
    if (userName == null) return;
    _setLoading(true);
    try {
      final _userData = await Api.getUserData(userName);
      userData = _userData;
      updateUser(_userData);
      getFeedImages();
    } on Exception catch (_) {
      MySnackBar.show(userName + 'not found');
    }
    _setLoading(false);
  }

  void getFeedImages() {
    final _feedImages = userData?.edgeOwnerToTimelineMedia?.edges?.map((e) => e.nodeData?.displayUrl).toList();
    if (_feedImages == null) return;
    feedImages = List<String>.from(_feedImages);
  }
}
