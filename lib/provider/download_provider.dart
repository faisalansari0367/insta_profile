import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:insta_profile/services/path_provider_service.dart';
import 'package:insta_profile/widgets/my_snack_bar.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadProvider with ChangeNotifier {
  DownloadTaskStatus status = DownloadTaskStatus.undefined;
  int? progress = 0;
  ReceivePort _port = ReceivePort();
  static const _portName = 'downloader_send_port';
  Directory? cacheDir;
  List<DownloadTask> tasks = [];

  DownloadProvider() {
    // _init();
    loadAllTasks();
  }

  Future<void> loadAllTasks() async {
    final _tasks = await FlutterDownloader.loadTasks();
    if (_tasks != null) tasks = _tasks;
  }

  void _init() {
    _port = ReceivePort();
    IsolateNameServer.registerPortWithName(_port.sendPort, _portName);
    FlutterDownloader.registerCallback(_downloadCallback);
    _port.listen(_listener, onDone: () => {status = DownloadTaskStatus.undefined, notifyListeners()});
  }

  static void _downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort? sendPort = IsolateNameServer.lookupPortByName(_portName);
    sendPort!.send([id, status, progress]);
  }

  bool isAlreadyDownloaded(String url) {
    final split = url.split('?').first;
    final list = tasks.where((element) => element.url.split('?').first == split);
    if (list.isEmpty) return false;
    return true;
  }

  Future<void> addToQueue(String url, {String? name, bool isVideo = false}) async {
    if (isAlreadyDownloaded(url)) {
      MySnackBar.show('Already downloaded');
      return;
    }
    _init();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    cacheDir ??= await PathProviderService.getCacheDir();
    try {
      final ext = isVideo ? 'mp4' : 'png';
      await FlutterDownloader.enqueue(
        fileName: '${UniqueKey().toString()}.$ext',
        url: url,
        savedDir: cacheDir!.path,
        showNotification: true,
        openFileFromNotification: true,
      );
      loadAllTasks();
    } catch (e) {
      rethrow;
    }
  }

  void stopService() {
    IsolateNameServer.removePortNameMapping(_portName);
    _port.close();
  }

  // @override
  // void dispose() {
  //   IsolateNameServer.removePortNameMapping(_portName);
  //   _port.close();
  //   super.dispose();
  // }

  void _listener(data) {
    status = data[1];
    progress = data[2];
    _getStatus(status);
    notifyListeners();
  }

  void _getStatus(DownloadTaskStatus status) {
    if (status == DownloadTaskStatus.complete) {
      progress = 0;
      stopService();
    } else if (status == DownloadTaskStatus.enqueued) {
      log('status: enqueued');
      progress = null;
    } else {
      if (status == DownloadTaskStatus.running) {
        log('status: running');
        if (progress == 0) {
          progress = null;
        }
      } else if (status == DownloadTaskStatus.undefined) {
        log('status: undefined');
      }
    }
  }

  // void getStatus(DownloadTaskStatus status) {
  //   if (status == DownloadTaskStatus.complete) {
  //     log('status: enqueued');
  //   } else if (status == DownloadTaskStatus.enqueued) {
  //     log('status: enqueued');
  //   } else if (status == DownloadTaskStatus.running) {
  //     log('status: running');
  //   } else if (status == DownloadTaskStatus.undefined) {
  //     log('status: undefined');
  //   } else if (status == DownloadTaskStatus.canceled) {
  //     log('status: undefined');
  //   }
  // }
}
