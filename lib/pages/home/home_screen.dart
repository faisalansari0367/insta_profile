import 'package:flutter/material.dart';
import 'package:insta_profile/helpers/redirect.dart';
import 'package:insta_profile/pages/downloaded_files/downloaded_files_page.dart';
import 'package:insta_profile/pages/home/empty_data.dart';
import 'package:insta_profile/pages/home/widgets/recent_users/listview_switcher.dart';
import 'package:insta_profile/pages/home/widgets/recent_users/recent_users.dart';
import 'package:insta_profile/pages/posts/posts.dart';
import 'package:insta_profile/provider/downloaded_files_provider.dart';
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
                  MyCrossFade(
                    isLoading: provider.feedImages.isEmpty,
                    child: FeedImages(
                      feedImages: provider.feedImages,
                    ),
                  ),
                  SizedBox(height: 2.height),
                  Consumer<DownloadedFilesProvider>(
                    builder: (context, value, child) {
                      final totalFiles = value.downloadedFiles.length;
                      final s = totalFiles > 1 ? 's' : '';
                      final description = '${value.downloadedFiles.length} File$s';
                      final isLoading = value.downloadedFiles.isEmpty;
                      return MyCrossFade(
                        isLoading: isLoading,
                        child: ListTile(
                          onTap: () => Redirect.to(context, const DownloadFilesPage()),
                          title: const Text('Downloaded Files'),
                          dense: false,
                          subtitle: Text(
                            description,
                            style: TextStyle(color: theme.textTheme.subtitle1!.color),
                          ),
                          leading: SizedBox(
                            width: 5.padding,
                            height: 10.padding,
                            child: Icon(
                              Icons.download,
                              color: theme.iconTheme.color,
                              // size: 5.padding,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  MyCrossFade(
                    isLoading: (provider.userData?.edgeFelixVideoTimeline?.edges?.isEmpty ?? true) &&
                        (provider.userData?.edgeOwnerToTimelineMedia?.edges?.isEmpty ?? true),
                    child: ListTile(
                      onTap: () => Redirect.to(
                        context,
                        PostsPage(
                          videos: provider.userData?.edgeFelixVideoTimeline?.edges,
                          posts: provider.userData?.edgeOwnerToTimelineMedia?.edges,
                        ),
                      ),
                      title: const Text('Posts'),
                      leading: Icon(
                        Icons.post_add_sharp,
                        color: Theme.of(context).iconTheme.color,
                      ),
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
