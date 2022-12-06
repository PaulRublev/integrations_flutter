import 'platform/other/other_service.dart'
    if (dart.library.html) 'platform/web/web_service.dart'
    if (dart.library.io) 'platform/android/android_service.dart';

abstract class PlatformService {
  Future<String> callMethodChannel(String text);

  Stream<int> callEvent();
}

PlatformService getService() {
  return PlatformServiceImpl();
}
