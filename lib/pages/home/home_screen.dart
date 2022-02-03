import 'package:flutter/material.dart';
import 'package:insta_profile/pages/home/empty_data.dart';
import 'package:insta_profile/pages/home/widgets/biography/biography.dart';
import 'package:insta_profile/pages/home/widgets/recent_users/listview_switcher.dart';
import 'package:insta_profile/pages/home/widgets/recent_users/recent_users.dart';
import 'package:insta_profile/provider/insta_downloader_provider.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/utils/my_decoration.dart';
import 'package:insta_profile/widgets/change_theme_button.dart';
import 'package:insta_profile/widgets/my_annotated_region.dart';
import 'package:insta_profile/widgets/my_network_image.dart';
import 'package:insta_profile/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

import 'widgets/profile_details/profile_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Insta>(context);
    final userData = provider.userData;
    final theme = Theme.of(context);
    return MyAnnotatedRegion(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: MyDecoration.margin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.height),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: MyTextField(
                          prefixIcon: Icon(Icons.search, color: theme.iconTheme.color!),
                          hintText: 'Search username',
                          onSubmitted: provider.getDetailsFromUsername,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: ChangeThemeIcon(),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.height),
                  DataEmpty(
                    isEmpty: !provider.isLoading && provider.userData == null && provider.recentUsers.isEmpty,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12.height,
                          child: ListViewSwitcher(
                            isLoading: provider.isLoading && provider.recentUsers.isEmpty,
                            scrollDirection: Axis.horizontal,
                            child: RecentUsers(
                              users: provider.recentUsers,
                            ),
                          ),
                        ),
                        SizedBox(height: 1.height),
                        MyNetworkImage(
                          isLoading: provider.isLoading,
                          onLongPress: () => provider.onLongPress(
                            provider.userData!.hdImageUrl!,
                            provider.userData!.userName!,
                          ),
                          urlToImage: provider.userData?.hdImageUrl,
                        ),
                        SizedBox(height: 1.height),
                        ProfileDetails(
                          isLoading: provider.isLoading && userData == null,
                          user: userData,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Biography(
                            bio: userData?.biography,
                            isLoading: provider.isLoading && userData?.biography == null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
