import 'package:flutter/material.dart';
import 'package:insta_profile/pages/home/widgets/profile_details/profile_details_layout.dart';
import 'package:insta_profile/pages/home/widgets/profile_image/profile_image_placeholder.dart';

class ProfileDetailsPlaceholder extends StatelessWidget {
  const ProfileDetailsPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileDetailsLayout(
      profile: ProfileImagePlaceHolder(),
      followers: ProfileImagePlaceHolder(),
      following: ProfileImagePlaceHolder(),
    );
  }
}
