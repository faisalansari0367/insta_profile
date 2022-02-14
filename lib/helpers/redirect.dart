import 'package:flutter/material.dart';

class Redirect {
  static void to(context, Widget page) async {
    final cupertinoPage = MaterialPageRoute(builder: (context) => page);
    await Navigator.push(context, cupertinoPage);
  }
}
