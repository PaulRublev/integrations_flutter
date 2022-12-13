import 'package:flutter/services.dart';

class PlatformService {
  static const method = MethodChannel('CALL_METHOD');

  Future<int> callMethodChannel() async {
    try {
      return await method.invokeMethod('CALL');
    } on PlatformException catch (e) {
      print("Failed to get value: '${e.message}'.");
      return -2;
    }
  }
}
