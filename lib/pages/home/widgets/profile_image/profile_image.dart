import 'package:flutter/material.dart';
import 'package:insta_profile/pages/home/widgets/profile_image/profile_image_layout.dart';
import 'package:insta_profile/widgets/my_network_image.dart';

class Profile extends StatelessWidget {
  final String? imageUrl, userName;
  final double size;
  const Profile({
    Key? key,
    required this.imageUrl,
    required this.userName,
    this.size = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ProfileImageLayout(
      size: size,
      image: MyNetworkImage(
        urlToImage: imageUrl,
        isCircle: true,
      ),
      name: Text(
        userName ?? '',
        style: theme.textTheme.bodyText2,
      ),
    );
  }
}
