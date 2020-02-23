import 'dart:async';

import 'package:flutter/services.dart';

class Amap {
  static const MethodChannel _channel = const MethodChannel('amap');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  initAmap(String key) async {
    var result = await _channel.invokeMethod("init",{"key":key});
    if (result["result"] == "OK") {
      return "OK";
    } else {
      return "Failed";
    }
  }
}
