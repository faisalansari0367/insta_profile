import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:insta_profile/domain/api/api_methods.dart';
import 'package:insta_profile/models/insta_user.dart';

class Api {
  static Future<InstaUser> getUserData(String userName) async {
    try {
      final url = '${userName.trim()}/?__a=1';
      final res = await ApiMethods.myGet(url);
      final map = jsonDecode(res.body);
      final user = map['graphql']['user'];
      final instaUser = InstaUser.fromJson(user);
      return instaUser;
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> searchUsers() async {
    const url = 'https://api.instagram.com/v1/users/search?q=faisal._.ehaz';
    final encodeFull = Uri.encodeFull(url);
    final uri = Uri.parse(encodeFull);
    final response = await http.get(uri);
    log(response.body);
  }
}
