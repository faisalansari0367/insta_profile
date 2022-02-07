import 'package:flutter/material.dart';
import 'package:insta_profile/theme/constans.dart';

class MyDecoration {
  // static const Radius circularRadius = Radius.circular(12);
  // static const BorderRadius borderRadius = BorderRadius.all(circularRadius);
  // static const physics = BouncingScrollPhysics();
  // static const Curve curve = Curves.fastOutSlowIn;
  // static const margin = EdgeInsets.all(10);
  // static const splashDuration = Duration(milliseconds: 2000);
  // static const duration = Duration(milliseconds: 500);

  static final inputBorderRadius = BorderRadius.circular(kInputRadius);
  static final inputBorder = OutlineInputBorder(
    borderRadius: inputBorderRadius,
    borderSide: kBorderSide,
  );

  static BoxDecoration decoration({Color color = Colors.white}) {
    return BoxDecoration(color: color, borderRadius: kBorderRadius);
  }
}
