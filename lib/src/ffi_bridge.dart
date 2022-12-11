import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

typedef SimpleFunction = Int16 Function(Pointer<Utf8> text);
typedef SimpleFunctionDart = int Function(Pointer<Utf8> text);

class FFIBridge {
  late SimpleFunctionDart _getCLength;

  FFIBridge() {
    final dl = Platform.isAndroid
        ? DynamicLibrary.open('libcalc.so')
        : DynamicLibrary.process();
    _getCLength =
        dl.lookupFunction<SimpleFunction, SimpleFunctionDart>('get_length');
  }

  int getCLength(String text) {
    var textUtf8 = text.toNativeUtf8();
    return _getCLength(textUtf8);
  }
}
