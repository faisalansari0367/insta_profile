import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadService {
  static final _port = ReceivePort();
  static ReceivePort get port => _port;
  static const _portName = 'downloader_send_port';
  static Directory? cacheDir;

  static void initState() {
    IsolateNameServer.registerPortWithName(_port.sendPort, _portName);
    FlutterDownloader.registerCallback(downloadCallback);
    // _port.listen(print);
    // port.listen((dynamic data) {
    //   final id = data[0];
    //   final status = data[1];
    //   final progress = data[2];
    //   log(status.toString());
    // });
  }

  static Future<Directory> getCacheDir() async {
    final dir = await getExternalStorageDirectory();
    cacheDir ??= dir; // 1
    return cacheDir!;
  }

  // static progressListener(String id, DownloadTaskStatus status, int progress) {
  

  // }

  // port.listen((dynamic data) {
  //     final id = data[0];
  //     final status = data[1];
  //     final progress = data[2];
  //   });

  static void dispose() {
    IsolateNameServer.removePortNameMapping(_portName);
  }

  static Future<String?> addToQueue(String url, String name) async {
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    // initState();
    cacheDir ??= await getCacheDir();
    try {
      final taskId = await FlutterDownloader.enqueue(
        fileName: '$name ${DateTime.now().microsecond}.png',
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

  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort? sendPort = IsolateNameServer.lookupPortByName(_portName);
    sendPort!.send([id, status, progress]);
  }
}
