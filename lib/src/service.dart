import 'platform/android/android_service.dart';

abstract class PlatformService {
  Future<void> callMethodChannel(String text);
}

PlatformService getService() {
  return PlatformServiceImpl();
}
