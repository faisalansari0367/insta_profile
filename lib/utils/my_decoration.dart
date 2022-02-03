import 'package:flutter/material.dart';

class MyDecoration {
  static const Radius circularRadius = Radius.circular(12);
  static const BorderRadius borderRadius = BorderRadius.all(circularRadius);
  static const physics = BouncingScrollPhysics();
  static const Curve curve = Curves.fastOutSlowIn;
  static const margin = EdgeInsets.all(10);
  static const splashDuration = Duration(milliseconds: 2000);
  static const duration = Duration(milliseconds: 500);

  static const inputRadius = 50.0;
  static final inputBorderRadius = BorderRadius.circular(inputRadius);
  static const inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
    borderSide: BorderSide(color: Colors.transparent),
  );

  static BoxDecoration decoration({Color color = Colors.white}) {
    return BoxDecoration(
      color: color,
      borderRadius: borderRadius,
    );
  }
}
