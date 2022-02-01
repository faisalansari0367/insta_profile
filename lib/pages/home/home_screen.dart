import 'package:flutter/material.dart';
import 'package:insta_profile/pages/home/widgets/recent_users/listview_switcher.dart';
import 'package:insta_profile/pages/home/widgets/recent_users/recent_users.dart';
import 'package:insta_profile/provider/insta_downloader_provider.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/utils/my_decoration.dart';
import 'package:insta_profile/widgets/my_network_image.dart';
import 'package:insta_profile/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

import 'widgets/profile_image/profile_image.dart';
import 'widgets/user_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Insta>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: MyDecoration.margin,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 1.height),
                MyTextField(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search username',
                  onSubmitted: provider.getDetailsFromUsername,
                ),
                SizedBox(height: 1.height),
                SizedBox(
                  height: 12.height,
                  child: ListViewSwitcher(
                    isLoading: provider.recentUsers.isEmpty,
                    scrollDirection: Axis.horizontal,
                    child: RecentUsers(
                      users: provider.recentUsers,
                    ),
                  ),
                ),
                SizedBox(height: 1.height),
                SizedBox(
                  height: 60.height,
                  child: GestureDetector(
                    child: MyNetworkImage(urlToImage: provider.userData?.hdImageUrl),
                    onLongPress: () => provider.onLongPress(
                      provider.userData!.hdImageUrl!,
                      provider.userData!.userName!,
                    ),
                  ),
                ),
                SizedBox(height: 1.height),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Profile(
                        imageUrl: provider.userData?.imageUrl,
                        userName: provider.userData?.userName,
                        size: 10,
                      ),
                    ),
                    UserDetails(name: 'Followers', value: provider.userData?.followers),
                    UserDetails(name: 'Following', value: provider.userData?.following),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
