import 'package:flutter/material.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/theme/constans.dart';
import 'package:insta_profile/widgets/my_cross_fade.dart';

class DataEmpty extends StatelessWidget {
  final bool isEmpty;
  final Widget child;
  const DataEmpty({Key? key, this.isEmpty = false, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCrossFade(
      isLoading: isEmpty,
      placeHolder: SizedBox(
        height: 60.height,
        child: Center(
          child: Text(
            'Please search for user',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
      child: child,
    );
  }
}
