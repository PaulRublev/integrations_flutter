import 'package:integrations_flutter/src/service.dart';

import 'web_interop.dart';

class PlatformServiceImpl implements PlatformService {
  final _manager = InteropManager();

  @override
  Stream<int> callEvent() {
    return _manager.buttonClicked;
  }

  @override
  Future<String> callMethodChannel(String text) async {
    return _manager.getValueFromJs(text);
  }
}
