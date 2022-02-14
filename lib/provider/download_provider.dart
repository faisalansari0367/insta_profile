import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:insta_profile/services/path_provider_service.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadProvider with ChangeNotifier {
  DownloadTaskStatus? status;
  int? progress = 0;
  ReceivePort _port = ReceivePort();
  static const _portName = 'downloader_send_port';
  Directory? cacheDir;

  DownloadProvider() {
    // _init();
  }

  void _init() {
    IsolateNameServer.registerPortWithName(_port.sendPort, _portName);
    FlutterDownloader.registerCallback(_downloadCallback);
  }

  static void _downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort? sendPort = IsolateNameServer.lookupPortByName(_portName);
    sendPort!.send([id, status, progress]);
  }

  Future<String?> addToQueue(String url, {String? name,bool isVideo = false}) async {
    _port = ReceivePort();
    _init();
    _listener();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    // initState();
    cacheDir ??= await PathProviderService.getCacheDir();
    try {
      final ext = isVideo ? 'mp4' : 'png';
      final taskId = await FlutterDownloader.enqueue(
        fileName: '$url.$ext',
        url: url,
        savedDir: cacheDir!.path,
        showNotification: true,
        openFileFromNotification: true,
      );
      return taskId;
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

  void _listener() {
    _port.listen((data) {
      // final int id = data[0];
      status = data[1];
      progress = data[2];
      _getStatus(status!);
      notifyListeners();
    });
  }

  void _getStatus(DownloadTaskStatus status) {
    if (status == DownloadTaskStatus.complete) {
      progress = 0;
      _port.close();
      stopService();
      Future.delayed(const Duration(milliseconds: 1000), () {
        status = DownloadTaskStatus.undefined;
        notifyListeners();
      });
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
