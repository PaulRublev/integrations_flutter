@JS('ClicksNamespace')
library interop;

import 'dart:ui' as ui;

import 'package:js/js.dart';

@JS('JsInteropManager')
class _JsInteropManager {
  external dynamic get labelElement;

  external setValueToJs(String value);
}

class InteropManager {
  final _interop = _JsInteropManager();

  InteropManager() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'web-label',
      (viewId) => _interop.labelElement,
    );
  }

  setValueToJs(String text) => _interop.setValueToJs(text);
}
