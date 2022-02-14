import 'package:flutter/material.dart';

class PageViewAnimation extends StatelessWidget {
  final PageController controller;
  final Widget child;
  final int index;
  final double viewportFraction, pageOffset;
  const PageViewAnimation({
    Key? key,
    required this.controller,
    required this.child,
    this.viewportFraction = 1.0,
    this.pageOffset = 0.0,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: child,
      builder: (BuildContext context, Widget? child) {
        double _pageOffset = 0;
        
        try {
          _pageOffset = controller.page ?? 0;
        } on AssertionError catch (_) {
          _pageOffset = 0;
        }

        double angle = (_pageOffset - index).abs();

        if (_pageOffset == 0) angle = 0;
        if (angle > 0.5) angle = 1 - angle;

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(angle),
          alignment: Alignment.center,
          child: child,
        );
      },
    );
  }
}
