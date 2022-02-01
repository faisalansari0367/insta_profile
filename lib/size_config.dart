import 'package:flutter/material.dart';

class Responsive {
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _blockSizeHorizontal = 0;
  static late double _blockSizeVertical = 0;

  static late double _textMultiplier;
  static late double _imageSizeMultiplier;
  static late double _heightMultiplier;
  static late double _widthMultiplier;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      if (_screenWidth < 450) {}
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }

    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    _textMultiplier = _blockSizeVertical;
    _imageSizeMultiplier = _blockSizeHorizontal;
    _heightMultiplier = _blockSizeVertical;
    _widthMultiplier = _blockSizeHorizontal;
  }

  static double imageSize(num value) {
    return value * Responsive._imageSizeMultiplier;
  }

  static double width(num value) {
    return value * Responsive._widthMultiplier;
  }

  static double height(num value) {
    return value * Responsive._heightMultiplier;
  }

  static double text(num value) {
    return value * Responsive._textMultiplier;
  }
}

extension ResponsiveDouble on double {
  double get height => Responsive.height(this);
  double get width => Responsive.width(this);
  double get image => Responsive.imageSize(this);
  double get padding => Responsive.imageSize(this);
  double get text => Responsive.text(this);
}

extension ResponsiveInt on int {
  double get height => Responsive.height(this);
  double get width => Responsive.width(this);
  double get image => Responsive.imageSize(this);
  double get padding => Responsive.imageSize(this);
  double get text => Responsive.text(this);
}
