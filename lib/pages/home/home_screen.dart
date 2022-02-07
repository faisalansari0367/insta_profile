import 'package:flutter/material.dart';
import 'package:insta_profile/pages/home/empty_data.dart';
import 'package:insta_profile/pages/home/widgets/recent_users/listview_switcher.dart';
import 'package:insta_profile/pages/home/widgets/recent_users/recent_users.dart';
import 'package:insta_profile/provider/insta_provider.dart';
import 'package:insta_profile/provider/recent_users_provider.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/theme/constans.dart';
import 'package:insta_profile/widgets/change_theme_button.dart';
import 'package:insta_profile/widgets/my_annotated_region.dart';
import 'package:insta_profile/widgets/my_cross_fade.dart';
import 'package:insta_profile/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

import 'feed_images.dart';
import 'profile_and_image_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InstaProvider>(context);

    final theme = Theme.of(context);
    return MyAnnotatedRegion(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: kPhysics,
            child: Padding(
              padding: kMargin,
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
                  Consumer<RecentUsersProvider>(
                    builder: (context, value, child) {
                      return MyCrossFade(
                        isLoading: !value.isLoading && value.recentUsers.isEmpty,
                        child: SizedBox(
                          height: 12.height,
                          child: ListViewSwitcher(
                            isLoading: value.isLoading && value.recentUsers.isEmpty,
                            scrollDirection: Axis.horizontal,
                            child: RecentUsers(
                              users: value.recentUsers,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  DataEmpty(
                    isEmpty: !provider.isLoading && provider.userData == null,
                    child: const ImageAndProfileWidget(),
                  ),
                  FeedImages(feedImages: provider.userData?.feedImages ?? []),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
