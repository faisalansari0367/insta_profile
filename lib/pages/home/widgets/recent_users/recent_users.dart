import 'package:flutter/material.dart';
import 'package:insta_profile/models/insta_user.dart';
import 'package:insta_profile/provider/insta_downloader_provider.dart';
import 'package:insta_profile/utils/my_decoration.dart';
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
      physics: MyDecoration.physics,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final user = users.elementAt(index);
    return InkWell(
      borderRadius: MyDecoration.borderRadius,
      onTap: () => setUser(context, index),
      child: Profile(
        imageUrl: user.imageUrl,
        userName: user.userName,
        size: 15,
      ),
    );
  }

  void setUser(BuildContext context, int index) {
    final provider = Provider.of<Insta>(context, listen: false);
    provider.setUserFromRecents(index);
  }
}
