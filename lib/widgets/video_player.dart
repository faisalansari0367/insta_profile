import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:insta_profile/theme/constans.dart';
import 'package:insta_profile/widgets/shimmer_widget.dart';

class VideoPlayer extends StatefulWidget {
  final String videoUrl;
  final BetterPlayerListVideoPlayerController? controller;
  final double aspectRatio;
  const VideoPlayer({Key? key, required this.videoUrl, this.controller, this.aspectRatio = 1}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  // BetterPlayerConfiguration betterPlayerConfiguration = const ;
  // BetterPlayerListVideoPlayerController? controller;

  // @override
  // void initState() {
  //   super.initState();
  //   // controller = widget.controller;

  //   // betterPlayerConfiguration = const BetterPlayerConfiguration(autoPlay: true);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kBorderRadius,
      child: BetterPlayerListVideoPlayer(
        BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,

          widget.videoUrl,
          // notificationConfiguration: BetterPlayerNotificationConfiguration(
          //     showNotification: false, title: videoListData!.videoTitle, author: "Test"),
          bufferingConfiguration: const BetterPlayerBufferingConfiguration(
            minBufferMs: 2000,
            maxBufferMs: 10000,
            bufferForPlaybackMs: 1000,
            bufferForPlaybackAfterRebufferMs: 2000,
          ),
        ),
        configuration: BetterPlayerConfiguration(
          // expandToFill: true,anim
          fit: BoxFit.fitWidth,
          placeholder: ShimmerAnimation(height: 100 * widget.aspectRatio),
          autoPlay: true,
          aspectRatio: widget.aspectRatio,
          autoDetectFullscreenAspectRatio: true,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            showControls: false,

            enablePlayPause: false,
            enableFullscreen: false,
            customControlsBuilder: (controller, onPlayerVisibilityChanged) => const Icon(Icons.play_circle),

            enableSkips: false,
            //  enableMute: ,

            // overflowMenuCustomItems: [
            //   BetterPlayerOverflowMenuItem(
            //     // icon,
            //     Icons.play_circle,
            //     'Play',
            //     () {},
            //   )
            // ],
            enableOverflowMenu: false,
            enableProgressBar: false,
            enablePlaybackSpeed: false,
            enableProgressText: false,
            enableProgressBarDrag: false,
            controlsHideTime: const Duration(milliseconds: 100),
          ),
          handleLifecycle: true,
        ),
        // key: UniqueKey(),
        playFraction: 0.8,
        autoPause: true,
        autoPlay: true,

        betterPlayerListVideoPlayerController: widget.controller,
      ),
    );
  }
}
