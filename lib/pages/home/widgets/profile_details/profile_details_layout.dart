import 'package:flutter/material.dart';

class ProfileDetailsLayout extends StatelessWidget {
  final Widget profile, followers, following;
  const ProfileDetailsLayout({
    Key? key,
    required this.profile,
    required this.followers,
    required this.following,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: profile,
          ),
          followers,
          following,
        ],
      ),
    );
  }
}
