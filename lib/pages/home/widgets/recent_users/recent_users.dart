import 'package:flutter/material.dart';
import 'package:insta_profile/models/insta_user.dart';
import 'package:insta_profile/provider/insta_provider.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/theme/constans.dart';
import 'package:provider/provider.dart';

import '../profile_image/profile_image.dart';

class RecentUsers extends StatelessWidget {
  final double? height;
  final List<InstaUser> users;
  const RecentUsers({Key? key, this.height, this.users = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (users.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: users.length,
      itemBuilder: itemBuilder,
      physics: kPhysics,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final user = users.elementAt(index);
    return InkWell(
      borderRadius: kBorderRadius,
      onTap: () => setUser(context, user),
      child: Profile(
        imageUrl: user.imageUrl,
        userName: user.userName,
        size: 15,
      ),
    );
  }

  void setUser(BuildContext context, InstaUser user) {
    final provider = Provider.of<InstaProvider>(context, listen: false);
    provider.setUser(user);
  }
}
