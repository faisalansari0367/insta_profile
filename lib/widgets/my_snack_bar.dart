import 'package:flutter/material.dart';
import 'package:insta_profile/global/global_key.dart';
import 'package:insta_profile/theme/constans.dart';

class MySnackBar {
  static void show(String msg) {
    final context = globalKey.currentContext;
    if (context == null) return;
    final messenger = globalKey.currentState;
    final snackBar = SnackBar(
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
      margin: kMargin,
    );
    messenger?.removeCurrentSnackBar();
    messenger?.showSnackBar(snackBar);
  }
}
