import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:insta_profile/helpers/debouncer.dart';
import 'package:insta_profile/services/path_provider_service.dart';

class DownloadedFilesProvider extends ChangeNotifier {
  late Directory cacheDir;
  List<File> downloadedFiles = [];
  DownloadedFilesProvider() {
    _init();
  }

  Future<void> _init() async {
    cacheDir = await PathProviderService.getCacheDir();
    // await cacheDir.delete(recursive: true);
    await cacheDir.list().forEach((element) async {
      if (element is File) downloadedFiles.add(element);
    });
    notifyListeners();

    final debouncer = Debouncer();
    cacheDir.watch().listen((event) {
      debouncer.run(() {
        cacheDirListener(event);
      });
    });
  }

  // getExt(String url) {
  //   return extension(url);
  // }

  bool contains(String file) {
    final list = downloadedFiles.where((element) => basename(element.path) == file);
    if(list.isEmpty) return false;
    return true;
  }

  void cacheDirListener(FileSystemEvent event) async {
    log('FileSystemEvent ${event.toString()}');
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
