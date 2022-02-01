import 'package:flutter/material.dart';

import '../size_config.dart';

class SizeConfigWidget extends StatelessWidget {
  final Widget child;
  const SizeConfigWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            Responsive().init(constraints, orientation);
            return child;
          },
        );
      },
    );
  }
}
