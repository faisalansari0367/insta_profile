import 'package:flutter/material.dart';
import 'package:insta_profile/size_config.dart';
import 'package:intl/intl.dart';

class UserDetails extends StatelessWidget {
  final String name;
  final int? value;
  const UserDetails({Key? key, required this.name, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          NumberFormat.compact().format((value ?? 0)),
          style: theme.textTheme.headline6,
          textAlign: TextAlign.center,
          softWrap: true,
        ),
        SizedBox(height: 1.height),
        Text(
          name,
          style: theme.textTheme.bodyText2,
        ),
      ],
    );
  }
}
