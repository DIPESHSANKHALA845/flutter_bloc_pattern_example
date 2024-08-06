import 'package:flutter/cupertino.dart';

class Logger {
  static LogMode _logMode = LogMode.debug;

  static void init(LogMode mode) {
    Logger._logMode = mode;
  }

  static void log(dynamic data, {StackTrace? stackTrace}) {
    if (_logMode == LogMode.debug) {
      final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
      pattern.allMatches(data).forEach((match) => debugPrint("Info:=> ${match.group(0)}${stackTrace??''}"));
     // debugPrint("Logger Info:== $data${stackTrace??''}");
    }
  }
}

enum LogMode { debug, live }
