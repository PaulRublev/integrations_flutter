import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class ServiceApi {
  void setLabelText(String text);
}
