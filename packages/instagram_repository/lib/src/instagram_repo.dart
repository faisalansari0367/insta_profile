import 'package:instagram_api/instagram_api.dart';



class InstagramRepository {
  InstagramRepository({InstagramApiClient? instagramApiClient})
      : _instagramApiClient = instagramApiClient ?? InstagramApiClient();

  final InstagramApiClient _instagramApiClient;

  Future<InstaUser?> getUserFromUserName(String userName) async {
    final instaUser = await _instagramApiClient.userSearch(userName);
    return instaUser;
  }
}
