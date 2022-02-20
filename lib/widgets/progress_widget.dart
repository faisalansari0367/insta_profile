import 'package:flutter/material.dart';
import 'package:insta_profile/theme/constans.dart';

class ProgressWidget extends StatefulWidget {
  final double progress;
  const ProgressWidget({Key? key, required this.progress}) : super(key: key);

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  var tween = Tween<double>(begin: 0.0, end: 0.0);

  @override
  void didUpdateWidget(covariant ProgressWidget oldWidget) {
    if (widget.progress != oldWidget.progress) {
      tween = Tween<double>(begin: oldWidget.progress, end: widget.progress);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: tween,
      duration: kDuration,
      curve: Curves.fastOutSlowIn,
      builder: (context, double value, child) {
        final text = value.toStringAsFixed(0);
        return Text(
          text,
          style: TextStyle(
            color: Colors.grey.shade100,
          ),
        );
      },
    );
  }
}
