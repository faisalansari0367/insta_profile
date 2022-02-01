import 'package:flutter/material.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/utils/my_decoration.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAnimation extends StatelessWidget {
  final double? width, height;
  const ShimmerAnimation({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageBgColor = theme.cardColor;
    final shimmer = Container(
      width: width ?? 100.width,
      height: height ?? 5.image,
      decoration: MyDecoration.decoration(color: imageBgColor),
    );
    final placeHolder = Shimmer.fromColors(
      highlightColor: theme.cardColor,
      baseColor: theme.backgroundColor,
      direction: ShimmerDirection.ltr,
      child: shimmer,
    );
    return placeHolder;
  }
}
