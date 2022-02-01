import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:insta_profile/global/global_key.dart';
import 'package:insta_profile/pages/home/home_screen.dart';
import 'package:insta_profile/services/storage/storage_service_hive.dart';
import 'package:insta_profile/size_config_widget.dart';

import 'widgets/multi_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
  await Hive.initFlutter();

  await HiveStorage().isReady;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizeConfigWidget(
      child: AddMultiProviders(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: globalKey,
          title: 'Insta Profile',
          theme: ThemeData.dark().copyWith(),
          themeMode: ThemeMode.dark,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
