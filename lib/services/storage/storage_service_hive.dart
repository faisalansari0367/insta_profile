import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:insta_profile/models/insta_user.dart';
import 'package:insta_profile/services/storage/hive_init_mixin.dart';
import 'package:insta_profile/services/storage/storage.dart';
import 'package:insta_profile/services/storage/storage_keys.dart';
import 'package:insta_profile/widgets/my_snack_bar.dart';

class HiveStorage extends StorageService with HiveInitMixin {
  static late Box _box;

  HiveStorage() {
    initService();
  }

  @override
  InstaUser getUserData() {
    final data = _box.get(StorageKeys.userData);
    final user = InstaUser.fromJson(data);
    return user;
  }

  // Box get box => _box;

  @override
  Future<void> saveUserData(InstaUser data) async {
    final json = data.toJson();
    await _box.put(data.userName, json);
  }

  Stream<BoxEvent> watchRecentUsers() {
    final watch = _box.watch(key: StorageKeys.recentUsers);
    return watch;
  }

  @override
  Future<void> initService() async {
    final box = await init(StorageKeys.boxName);
    _box = box;
  }

  @override
  Future<void> saveRecentUsers(List<InstaUser> users) async {
    try {
      final json = jsonEncode(users);
      await _box.put(StorageKeys.recentUsers, json);
    } on Exception catch (e) {
      MySnackBar.show(e.toString());
    }
  }

  @override
  List<InstaUser> getRecentUsers({value}) {
    var list = <InstaUser>[];
    final data = value ?? _box.get(StorageKeys.recentUsers);
    if (data == null) return list;
    final json = jsonDecode(data);
    for (var element in json) {
      if (element is Map) {
        final map = Map<String, dynamic>.from(element);
        final instaUser = InstaUser.fromJson(map);
        list.add(instaUser);
      }
    }
    return list;
  }

  @override
  bool getDarkMode() => _box.get(StorageKeys.isDarkMode) ?? false;

  @override
  Future<void> setDarkMode(bool value) async => await _box.put(StorageKeys.isDarkMode, value);
}
