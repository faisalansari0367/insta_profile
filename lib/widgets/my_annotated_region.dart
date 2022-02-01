import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAnnotatedRegion extends StatelessWidget {
  final Widget child;
  final Color? navBarColor;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;
  const MyAnnotatedRegion({
    Key? key,
    required this.child,
    this.navBarColor,
    this.statusBarColor,
    this.statusBarIconBrightness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        systemStatusBarContrastEnforced: false,
        statusBarIconBrightness: statusBarIconBrightness ?? theme.brightness,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarColor: navBarColor,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: statusBarIconBrightness ?? theme.brightness,
      ),
      child: child,
    );
  }
}