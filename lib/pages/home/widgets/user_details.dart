import 'package:flutter/material.dart';
import 'package:insta_profile/size_config.dart';

class UserDetails extends StatelessWidget {
  final String name;
  final String? value;
  const UserDetails({Key? key, required this.name, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value ?? '',
          style: theme.textTheme.headline4,
        ),
        SizedBox(height: 1.height),
        Text(
          name,
          style: theme.textTheme.caption,
        ),
      ],
    );
  }
}
