import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_profile/helpers/debouncer.dart';
import 'package:insta_profile/services/download_service.dart';

class DownloadedFilesProvider extends ChangeNotifier {
  late Directory cacheDir;
  List<File> downloadedFiles = [];
  DownloadedFilesProvider() {
    _init();
  }

  Future<void> _init() async {
    cacheDir = await DownloadService.getCacheDir();
    await cacheDir.list().forEach((element) async {
      if (element is File) {
        downloadedFiles.add(element);
      }
    });

    final debouncer = Debouncer();
    cacheDir.watch().listen((event) {
      debouncer.run(() {
        cacheDirListener(event);
      });
    });
    notifyListeners();
  }

  void cacheDirListener(FileSystemEvent event) async {
    if (event is FileSystemModifyEvent) {
      final file = File(event.path);
      final items = downloadedFiles.where((element) => element.path == event.path);
      if (items.isEmpty) {
        downloadedFiles.add(file);
        notifyListeners();
        return;
      }
      final index = downloadedFiles.indexOf(items.first);
      downloadedFiles[index] = file;
      notifyListeners();
    }
  }
}
