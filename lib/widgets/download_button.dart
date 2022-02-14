import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:insta_profile/helpers/provider_helper.dart';
import 'package:insta_profile/provider/download_provider.dart';
import 'package:insta_profile/provider/downloaded_files_provider.dart';
import 'package:insta_profile/provider/recent_users_provider.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/theme/constans.dart';
import 'package:insta_profile/widgets/my_snack_bar.dart';
import 'package:provider/provider.dart';

import 'rounded_progress_indicator.dart';

class DownloadButton extends StatefulWidget {
  final String fileLink;
  final double? size;
  final bool isVideo;
  final void Function()? onPressed;
  const DownloadButton({Key? key, this.onPressed, required this.fileLink, this.size, this.isVideo = false}) : super(key: key);

  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  // double percent = 0.0;
  // DownloadTaskStatus status = DownloadTaskStatus.undefined;

  // @override
  // void initState() {
  //   super.initState();
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     status = DownloadTaskStatus.running;
  //     percent += 5;
  //     if (percent == 100) {
  //       percent = 0.0;
  //       status = DownloadTaskStatus.complete;
  //     }
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: widget.onPressed ?? onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            height: 10.padding,
            width: 10.padding,
            child: Selector<DownloadProvider, DownloadTaskStatus>(
              selector: (p0, p1) => p1.status ?? DownloadTaskStatus.undefined,
              builder: (context, value, child) {
                return AnimatedSwitcher(
                  duration: kDuration,
                  child: getChild(context, value),
                );
              },
            ),
          ),
          Selector<DownloadProvider, int?>(
            selector: (p0, p1) => p1.progress ?? 0,
            builder: (context, value, child) {
              return RoundedProgressIndicator(
                strokeWidth: 3,
                duration: kDuration,
                color: theme.colorScheme.primary,
                radius: 4.5.padding,
                percentage: value!.toDouble(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget getChild(context, DownloadTaskStatus status) {
    final theme = Theme.of(context);
    if (status == DownloadTaskStatus.running) {
      return Selector<DownloadProvider, int>(
        selector: (p0, p1) => p1.progress ?? 0,
        builder: (context, value, child) {
          return _ProgressWidget(progress: value.toDouble());
        },
      );
    } else if (status == DownloadTaskStatus.complete) {
      return Icon(
        Icons.download_done_rounded,
        color: Colors.grey[300] ?? theme.iconTheme.color,
      );
    } else {
      return Icon(
        Icons.file_download_outlined,
        color: Colors.grey[300] ?? theme.iconTheme.color,
      );
    }
  }

  void onPressed() async {
    final provider = getProvider<DownloadProvider>(context);
    final downloaded = getProvider<DownloadedFilesProvider>(context);
    final isDownloaded = downloaded.contains(widget.fileLink);
    // final ext = downloaded.getExt(widget.fileLink);
    if (!isDownloaded) {
      await provider.addToQueue(widget.fileLink, isVideo: widget.isVideo);
    } else {
      MySnackBar.show('Already downloaded');
    }
  }
}

class _ProgressWidget extends StatefulWidget {
  final double progress;
  const _ProgressWidget({Key? key, required this.progress}) : super(key: key);

  @override
  State<_ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<_ProgressWidget> {
  var tween = Tween<double>(begin: 0.0, end: 0.0);

  @override
  void didUpdateWidget(covariant _ProgressWidget oldWidget) {
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
