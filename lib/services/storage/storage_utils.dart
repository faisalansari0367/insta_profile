import '../../models/insta_user.dart';

class StorageUtils {
  List<InstaUser> updateRecentUsers(List<InstaUser> users, InstaUser user) {
    final copyUsersList = [...users];
    final doesUserExist = users.contains(user);
    if (!doesUserExist) {
      final list = users.where((element) => element.id == user.id);
      if (list.isNotEmpty) {
        final index = users.indexOf(list.first);
        copyUsersList[index] = user;
      } else {
        copyUsersList.add(user);
      }
    }
    return copyUsersList;
  }
}
