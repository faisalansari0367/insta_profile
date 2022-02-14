import 'package:flutter/material.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/theme/constans.dart';

class ProfileImageLayout extends StatelessWidget {
  final Widget image;
  final Widget? name;

  final double size;
  const ProfileImageLayout({
    Key? key,
    this.size = 15,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: kMargin,
          // padding: EdgeInsets.symmetric(horizontal: 20),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          height: size.image,
          width: size.image,
          child: image,
        ),
        // SizedBox(height: 1.height),
        if (name != null) name!,
      ],
    );
  }
}
