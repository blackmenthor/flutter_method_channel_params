
import 'package:flutter/services.dart';

class NativeBridge {

  static const methodChannel = const MethodChannel('com.anggach.flutternativeplugin/channel');

  static const calculateTheNumber = "CALCULATE";

  static Future<int> calculateWithNative(int a, int b) async {
    Map<String, dynamic> params = {};

    if (a == null || b == null) {
      throw Exception("INTS CANNOT BE NULL");
    }

    params['a'] = a;
    params['b'] = b;

    int result = await methodChannel.invokeMethod(calculateTheNumber, params);

    return result;
  }

}