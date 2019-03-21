
import 'package:flutter/services.dart';

class NativeBridge {

  static const methodChannel = const MethodChannel('com.anggach.flutternativeplugin/channel');

  static const complexMethod = "COMPLEX";

  static Future<String> getIsyaTime() async {
    String result = await methodChannel.invokeMethod(complexMethod);

    return result;
  }

}