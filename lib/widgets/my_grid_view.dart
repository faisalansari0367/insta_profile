import 'package:flutter/material.dart';
import 'package:insta_profile/theme/constans.dart';

class MyGridView extends StatelessWidget {
  final List data;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final Widget Function(BuildContext, int) itemBuilder;
  final ScrollPhysics? physics;
  const MyGridView(
      {Key? key,
      required this.data,
      this.physics = kPhysics,
      this.shrinkWrap = false,
      required this.itemBuilder,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: data.length,
      itemBuilder: itemBuilder,
    );
  }
}
