import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PathProviderService {
  static Future<Directory> getCacheDir() async {
    final cacheDir = await getExternalStorageDirectory();
    return cacheDir!;
  }
}
