import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';

class Log {
  static const _tag = 'salmdroidNW';
  static int deb = 0;

  static void init() {
    Logger.root.level = kReleaseMode ? Level.OFF : Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      String time = DateFormat('MM/dd HH:mm:ss').format(rec.time);
      String stackTrace = StackTrace.current.toString();
      String topStack = '';
      int count = 12;

      while (count >= 0) {
        if (stackTrace.split("#$count").length > 1) {
          topStack = stackTrace.split("#$count")[1].split(")")[0];
          break;
        }
        count--;
      }
      String classname = topStack.substring(0, topStack.indexOf("(")).trim();
      List<String> list = _printWrapped(rec.message);
      log('this is salmdroid.', level: 2000);
      deb++;
      if (kDebugMode) {
        for (var element in list) {
          debugPrint('$_tag: $time [$classname] $element');
        }
      } else {
        for (var element in list) {
          print('$_tag: $time [$classname] $element');
        }
      }

      if (rec.level >= Level.SEVERE) {
        // AssertionErrorをthrowしてStackTraceを表示する
        throw AssertionError('View stack trace by logger');
      }
    });
  }

  static final logger = Logger('MyLogger');

  static void f(Object? o) {
    logger.fine(o);
  }

  static void d(Object? o) {
    logger.fine(o);
  }

  static void i(Object? o) {
    logger.info(o);
  }

  static void w(Object? o) {
    logger.warning(o);
  }

  static void s(Object? o) {
    logger.severe(o);
  }

  static List<String> _printWrapped(String text) {
    List<String> list = [];
    final pattern = RegExp('.{1,900}');
    pattern
        .allMatches(text)
        .forEach((match) => list.add(match.group(0).toString()));
    return list;
  }
}
