import 'package:flutter/material.dart';
import 'package:insta_profile/models/insta_user.dart';
import 'package:insta_profile/pages/home/widgets/profile_details/profile_details_layout.dart';
import 'package:insta_profile/pages/home/widgets/profile_details/profile_details_placeholder.dart';
import 'package:insta_profile/utils/my_decoration.dart';

import '../profile_image/profile_image.dart';
import '../user_details/user_details.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required this.user,
    this.isLoading = false,
  }) : super(key: key);
  final bool isLoading;
  final InstaUser? user;

  @override
  Widget build(BuildContext context) {
    // if (user == null) return const SizedBox.shrink();
    return AnimatedCrossFade(
      duration: MyDecoration.duration,
      crossFadeState: isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      secondChild: const ProfileDetailsPlaceholder(),
      firstChild: ProfileDetailsLayout(
        profile: Profile(
          imageUrl: user?.imageUrl,
          userName: user?.fullName,
          size: 10,
        ),
        followers: UserDetails(name: 'Followers', value: user?.followers),
        following: UserDetails(name: 'Following', value: user?.following),
      ),
    );
  }
}
