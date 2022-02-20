import 'package:flutter/material.dart';
import 'package:insta_profile/pages/home/widgets/profile_image/profile_image_layout.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/widgets/shimmer_widget.dart';

class ProfileImagePlaceHolder extends StatelessWidget {
  const ProfileImagePlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileImageLayout(
      
      // size: 15.image,
      image: ShimmerAnimation(
        height: 25.image,
        width: 25.image,
      ),
      name: ShimmerAnimation(
        width: 15.width,
        height: 1.height,
      ),
    );
  }
}
