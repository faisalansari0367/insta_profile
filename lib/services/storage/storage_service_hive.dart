import 'package:hive/hive.dart';
import 'package:insta_profile/models/insta_user.dart';
import 'package:insta_profile/services/storage/hive_init_mixin.dart';
import 'package:insta_profile/services/storage/storage.dart';
import 'package:insta_profile/services/storage/storage_keys.dart';

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

  Box get box => _box;

  @override
  Future<void> saveUserData(InstaUser data) async {
    final json = data.toJson();
    await _box.put(data.userName, json);
  }

  @override
  Future<void> initService() async {
    final box = await init(StorageKeys.boxName);
    _box = box;
  }

  @override
  List<InstaUser> getRecentUsers() {
    var list = <InstaUser>[];
    for (var element in box.values) {
      if (element is Map) {
        final map = Map<String, dynamic>.from(element);
        final instaUser = InstaUser.fromJson(map);
        list.add(instaUser);
      }
    }
    return list;
  }
}
