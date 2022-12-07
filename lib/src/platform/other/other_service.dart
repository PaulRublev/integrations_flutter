import 'package:integrations_flutter/src/service.dart';

export 'platform_widget.dart';

class PlatformServiceImpl implements PlatformService {
  @override
  Future<String> callMethodChannel(String text) async {
    return 'null';
  }

  @override
  Stream<int> callEvent() =>
      Stream.fromIterable([5, 4, 3, 2, 1].map((event) => event));
}
