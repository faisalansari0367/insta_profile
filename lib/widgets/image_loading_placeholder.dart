import 'package:flutter/material.dart';
import 'package:insta_profile/utils/my_decoration.dart';

import 'shimmer_widget.dart';

class ImageLoadingPlaceholder extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const ImageLoadingPlaceholder({Key? key, this.isLoading = false, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: MyDecoration.duration,
      child: isLoading ? const ShimmerAnimation() : child,
    );
  }
}
