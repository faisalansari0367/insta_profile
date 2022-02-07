import 'package:flutter/material.dart';
import 'package:insta_profile/theme/constans.dart';

import 'shimmer_widget.dart';

class ImageLoadingPlaceholder extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const ImageLoadingPlaceholder({Key? key, this.isLoading = false, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kDuration,
      child: isLoading ? const ShimmerAnimation() : child,
    );
  }
}
