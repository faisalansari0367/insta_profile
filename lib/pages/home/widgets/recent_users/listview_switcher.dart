import 'package:flutter/material.dart';
import 'package:insta_profile/pages/home/widgets/profile_image/profile_image_placeholder.dart';

class ListViewSwitcher extends StatelessWidget {
  final Widget child;
  final int itemCount;
  final Axis scrollDirection;
  final bool isLoading;
  final Widget? placeHolder;
  const ListViewSwitcher({
    Key? key,
    required this.child,
    this.itemCount = 10,
    this.scrollDirection = Axis.vertical,
    this.isLoading = false,
    this.placeHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placeHolder = ListView.builder(
      scrollDirection: scrollDirection,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );

    return !isLoading ? child : placeHolder;
  }

  Widget itemBuilder(BuildContext context, int index) => placeHolder ?? const ProfileImagePlaceHolder();
}
