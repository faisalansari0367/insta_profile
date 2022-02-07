import 'package:flutter/material.dart';
import 'package:insta_profile/theme/constans.dart';

class ShowLoading extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  const ShowLoading({Key? key, required this.child, required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kDuration,
      child: isLoading ? const Center(child: CircularProgressIndicator()) : child,
    );
  }
}
