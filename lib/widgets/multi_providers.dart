import 'package:flutter/material.dart';
import 'package:insta_profile/provider/insta_downloader_provider.dart';
import 'package:insta_profile/provider/theme_provider.dart';
import 'package:provider/provider.dart';



class AddMultiProviders extends StatelessWidget {
  final Widget child;
  const AddMultiProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providers = [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => Insta()),
    ];
    return MultiProvider(
      providers: providers,
      child: child,
    );
  }
}
