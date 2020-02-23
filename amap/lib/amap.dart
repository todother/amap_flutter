import 'dart:async';

import 'package:flutter/services.dart';

class Amap {
  static const MethodChannel _channel = const MethodChannel('amap');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> initAmap() async {
    var result = await _channel.invokeMethod("init");
    if (result["result"] == "OK") {
      return "OK";
    } else {
      return "Failed";
    }
  }
}
