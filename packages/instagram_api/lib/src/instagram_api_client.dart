import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instagram_api/src/custom_exception.dart';
import 'package:instagram_api/src/models/insta_user.dart';

class InstagramApiClient {
  /// {@macro InstagramApiClient}
  InstagramApiClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  static const String _baseUrl = 'www.instagram.com';


  Future<InstaUser?> userSearch(String userName) async {
    try {
      final query = <String, String>{'__a': '1'};
      final request = Uri.https(_baseUrl, userName.trim(), query);
      final res = await _httpClient.get(request);
      if(res.statusCode != 200) {
        throw FetchDataException();
      }
      final userJson = jsonDecode(res.body);
      final user = userJson['graphql']['user'];
      final instaUser = InstaUser.fromJson(user);
      return instaUser;
    } catch (e) {
      rethrow;
    }
  }
}
