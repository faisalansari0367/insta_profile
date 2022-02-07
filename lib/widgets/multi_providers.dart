import 'package:flutter/material.dart';
import 'package:insta_profile/provider/downloaded_files_provider.dart';
import 'package:insta_profile/provider/insta_provider.dart';
import 'package:insta_profile/provider/recent_users_provider.dart';
import 'package:insta_profile/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class AddMultiProviders extends StatelessWidget {
  final Widget child;
  const AddMultiProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final recentProvider = RecentUsersProvider();
    final providers = [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => InstaProvider()),
      ChangeNotifierProvider(create: (context) => DownloadedFilesProvider()),
      ChangeNotifierProvider(create: (context) => RecentUsersProvider()),
      //   ProxyProvider<RecentUsersProvider, InstaProvider>(
      //   update: (context, foo, previous) => InstaProvider(foo),
      // ),

      // ChangeNotifierProvider.value(value: RecentUsersProvider()),
    ];
    return MultiProvider(
      providers: providers,
      child: child,
    );
  }
}
