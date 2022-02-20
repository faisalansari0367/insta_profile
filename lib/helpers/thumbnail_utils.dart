import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ThumbnailUtils {
  static Directory? tempDir;
  ThumbnailUtils() {
    // _init();
  }

  // void _init() async {
  //   tempDir ??= await getTemporaryDirectory();
  // }

  Future<File>? getThumbnail(String filePath) async {
    try {
      tempDir ??= await getTemporaryDirectory();
      final fileName = await VideoThumbnail.thumbnailFile(
        video: filePath,
        thumbnailPath: tempDir!.path,
        imageFormat: ImageFormat.PNG,
        quality: 100,
      );
      return File(fileName!);
    } catch (e) {
      rethrow;
    }
  }
}
