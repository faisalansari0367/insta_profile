import 'package:flutter/material.dart';
import 'package:insta_profile/helpers/provider_helper.dart';
import 'package:insta_profile/provider/theme_provider.dart';

class ChangeThemeIcon extends StatelessWidget {
  const ChangeThemeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = getProvider<ThemeProvider>(context, listen: true);
    return IconButton(
      icon: Icon(
        themeProvider.isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
        color: Theme.of(context).iconTheme.color,
      ),
      onPressed: themeProvider.changeTheme,
    );
  }
}
