import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PathProviderService {
  static Directory? _cacheDir;
  static Future<Directory> getCacheDir() async {
    _cacheDir ??= await getExternalStorageDirectory();
    return _cacheDir!;
  }
}
