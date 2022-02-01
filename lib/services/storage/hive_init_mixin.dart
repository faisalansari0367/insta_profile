import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

mixin HiveInitMixin {
  static final _completer = Completer<void>();
  static late Box _box;
  Future<void> get isReady async => await _completer.future;
  Future<Box> init(String boxName) async {
    if (!_completer.isCompleted) {
      debugPrint('initialising box $boxName');
      _box = await Hive.openBox(boxName);
      debugPrint('storage box $boxName initialised');
      _completer.complete();
    }
    return _box;
  }
}
