import 'package:insta_profile/models/insta_user.dart';
import 'package:insta_profile/services/storage/storage.dart';

class StorageServiceFake extends StorageService {
  @override
  InstaUser getUserData() {
    return const InstaUser(
      followers: 6,
      following: 2,
      fullName: 'FAISAL_EHAZ',
      hdImageUrl:
          'https://instagram.fdel2-3.fna.fbcdn.net/v/t51.2885-19/s320x320/263177161_122339033582785_2216506057137144785_n.jpg?_nc_ht=instagram.fdel2-3.fna.fbcdn.net&_nc_cat=101&_nc_ohc=U2LG1O5BfAIAX_YXbsM&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT9ek0z0sjJhtKalYMf2oQkILJ72KZ5n5IXOAk0dDcbGEQ&oe=61FFFCDD&_nc_sid=7bff83',
      imageUrl:
          'https://instagram.fdel2-3.fna.fbcdn.net/v/t51.2885-19/s150x150/263177161_122339033582785_2216506057137144785_n.jpg?_nc_ht=instagram.fdel2-3.fna.fbcdn.net&_nc_cat=101&_nc_ohc=U2LG1O5BfAIAX_YXbsM&edm=ABfd0MgBAAAA&ccb=7-4&oh=00_AT9EGr5paXInnIIMReLO-Hl9816nXogr_QB5rR4Bh84xlg&oe=6200B2E5&_nc_sid=7bff83',
      userName: 'faisal._.ehaz',
    );
  }

  @override
  Future<void> saveUserData(InstaUser data) {
    return Future.value();
  }

  @override
  Future<void> initService() {
    throw UnimplementedError();
  }

  @override
  List<InstaUser> getRecentUsers() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveRecentUsers(List<InstaUser> users) {
    throw UnimplementedError();
  }

  @override
  bool getDarkMode() => true;

  @override
  Future<void> setDarkMode(bool value) {
    return Future.value();
  }
}
