import 'package:flutter/material.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/theme/constans.dart';

class PlayPauseButton extends StatefulWidget {
  final void Function(bool)? onPressed;
  final double? size;
  const PlayPauseButton({Key? key, required this.onPressed, this.size}) : super(key: key);

  @override
  _PlayPauseButtonState createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isPlaying = true;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: kDuration,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size ?? 15;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: size.padding,
        width: size.padding,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.black38,
          shape: BoxShape.circle,
        ),
        // highlightColor: Colors.black54,
        // color: color,
        child: AnimatedIcon(
          icon: AnimatedIcons.play_pause,
          progress: _controller,
          color: Colors.white,
        ),
      ),
    );
  }

  void onPressed() async {
    isPlaying ? _controller.forward() : _controller.reverse();
    widget.onPressed!(isPlaying);
    isPlaying = !isPlaying;
    setState(() {});
  }
}
