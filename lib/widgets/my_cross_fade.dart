import 'package:flutter/material.dart';
import 'package:insta_profile/theme/constans.dart';

class MyCrossFade extends StatelessWidget {
  final Widget child;
  final Widget? placeHolder;
  final bool isLoading;
  const MyCrossFade({Key? key, this.isLoading = false, required this.child, this.placeHolder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstCurve: kCurve,
      secondCurve: kCurve,
      duration: kDuration,
      crossFadeState: !isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: placeHolder ?? const SizedBox.shrink(),
      secondChild: child,
    );
  }
}
