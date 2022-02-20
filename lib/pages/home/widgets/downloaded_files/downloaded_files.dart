import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:insta_profile/helpers/redirect.dart';
import 'package:insta_profile/helpers/thumbnail_utils.dart';
import 'package:insta_profile/size_config.dart';
import 'package:insta_profile/theme/constans.dart';
import 'package:insta_profile/widgets/my_grid_view.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';

import 'open_downloaded_file_widget.dart';

class DownloadedFilesView extends StatelessWidget {
  final List data;
  const DownloadedFilesView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<DownloadedFilesProvider>(context);
    // if (provider.downloadedFiles.isEmpty) return const SizedBox.shrink();

    return MyGridView(
      // shrinkWrap: true,
      padding: kMargin,
      data: data,
      physics: kPhysics,
      itemBuilder: itemBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    // final provider = Provider.of<DownloadedFilesProvider>(context);

    final file = data.elementAt(index);
    final size = 15.image.toInt();
    final isVideo = lookupMimeType(file.path)!.split('/').first == 'video';

    return ClipRRect(
      borderRadius: kBorderRadius,
      child: isVideo
          ? ShowVideoImage(filePath: file.path)
          : InkWell(
              onTap: () => Redirect.to(
                context,
                OpenDownloadedImage(
                  images: data as List<File>,
                  index: index,
                ),
              ),
              child: Image.file(
                file,
                width: size.toDouble(),
                cacheWidth: size * 3,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}

class ShowVideoImage extends StatelessWidget {
  final String filePath;
  const ShowVideoImage({Key? key, required this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = 15.image.toInt();

    return FutureBuilder<File>(
      future: ThumbnailUtils().getThumbnail(filePath),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 20,
              width: 20,
              child: const CircularProgressIndicator(),
            );

          case ConnectionState.done:
            return InkWell(
              onTap: () => OpenFile.open(filePath),
              child: Image.file(
                snapshot.data!,
                width: size.toDouble(),
                cacheWidth: size * 3,
                fit: BoxFit.cover,
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class OpenVideoFileWidget extends StatelessWidget {
  final String filePath;

  const OpenVideoFileWidget({Key? key, required this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer.file(
        filePath,
        betterPlayerConfiguration: const BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
