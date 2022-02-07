import 'dart:math';

extension FormatSize on int {
  String formatBytes({bool inGB = false, int decimals = 2}) {
    final bytes = this;
    if (bytes == 0 || bytes.isNegative) return '0 B';
    var k = 1024,
        dm = decimals <= 0 ? 0 : decimals,
        sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
        i = inGB ? 3 : (log(bytes) / log(k)).floor();
    return ((bytes / pow(k, i)).toStringAsFixed(dm)) + ' ' + sizes[i];
  }
}
