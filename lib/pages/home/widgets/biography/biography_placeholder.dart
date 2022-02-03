import 'package:flutter/material.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/widgets/shimmer_widget.dart';

class BiographyPlaceholder extends StatelessWidget {
  const BiographyPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerAnimation(height: 1.5.height, width: 20.width),
        SizedBox(height: 1.height),
        ShimmerAnimation(height: 1.5.height, width: 40.width),
        SizedBox(height: 1.height),
        ShimmerAnimation(height: 1.5.height, width: 60.width),
        SizedBox(height: 1.height),
        ShimmerAnimation(height: 1.5.height, width: 80.width),
      ],
    );
  }
}
