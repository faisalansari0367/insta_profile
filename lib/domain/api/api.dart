import 'dart:convert';

import 'package:insta_profile/domain/api/api_methods.dart';
import 'package:insta_profile/models/insta_user.dart';

class Api {
  static Future<InstaUser> getUserData(String userName) async {
    try {
      final url = '$userName/?__a=1';
      final res = await ApiMethods.myGet(url);
      final map = jsonDecode(res.body);
      final user = map['graphql']['user'];
      final instaUser = InstaUser(
        followers: user['edge_followed_by']['count'],
        fullName: user['full_name'],
        following: user['edge_follow']['count'],
        hdImageUrl: user['profile_pic_url_hd'],
        imageUrl: user['profile_pic_url'],
        userName: user['username'],
        biography: user['biography'],
        id: int.parse(user['id']),
      );
      return instaUser;
    } catch (e) {
      rethrow;
    }
  }
}
