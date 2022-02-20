import 'dart:io';

import 'path_provider_service.dart';
import 'package:path/path.dart' as p;

class ExportService {
  static final dir = Directory('/storage/emulated/0/Insta profile');
  Future<void> startExporting() async {
    if (!await dir.exists()) await dir.create();
    final cacheDir = await PathProviderService.getCacheDir();
    cacheDir.list().listen(_listner);
  }

  void _listner(event) async {
    if (event is File) {
      final filePath = p.join(dir.path, p.basename(event.path));
      final file = await File(filePath).exists();
      if (!file) await event.copy(filePath);
    }
  }
}
