import 'package:flutter/services.dart';
import 'package:integrations_flutter/src/service.dart';

class PlatformServiceImpl implements PlatformService {
  static const method = MethodChannel('CALL_METHOD');
  static const stream = EventChannel('CALL_EVENTS');

  @override
  Future<String> callMethodChannel(String text) async {
    try {
      return await method.invokeMethod('CALL', [text]);
    } on PlatformException catch (e) {
      print("Failed to get value: '${e.message}'.");
      return '';
    }
  }

  @override
  Stream<int> callEvent() =>
      stream.receiveBroadcastStream().map((event) => event as int);
}
