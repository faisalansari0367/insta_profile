import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadService {
  static final _port = ReceivePort();
  static ReceivePort get port => _port;
  static const portName = 'downloader_send_port';

  static void initState() {
    IsolateNameServer.registerPortWithName(_port.sendPort, portName);
    FlutterDownloader.registerCallback(downloadCallback);
  }

  // port.listen((dynamic data) {
  //     final id = data[0];
  //     final status = data[1];
  //     final progress = data[2];
  //   });

  static void dispose() {
    IsolateNameServer.removePortNameMapping(portName);
  }

  static Future<String?> addToQueue(String url, String name) async {
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    initState();
    // final _downloads = ExtStorage.DIRECTORY_DOWNLOADS;
    final dir = Directory('/storage/emulated/0/Download');
    final downloadDir = dir.absolute.path;
    try {
      final taskId = await FlutterDownloader.enqueue(
        fileName: '$name ${DateTime.now().microsecond}.png',
        url: url,
        savedDir: downloadDir,
        showNotification: true, // show download progress in status bar (for Android)
        openFileFromNotification: true, // click on notification to open downloaded file (for Android)
      );
      return taskId;
    } catch (e) {
      rethrow;
    }
  }

  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort? send = IsolateNameServer.lookupPortByName(portName);
    send!.send([id, status, progress]);
  }
}
