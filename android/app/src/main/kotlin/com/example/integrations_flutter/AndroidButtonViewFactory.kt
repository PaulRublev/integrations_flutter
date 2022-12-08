package com.example.integrations_flutter

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class AndroidButtonViewFactory(messenger: BinaryMessenger, private var label: String?) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    private val binaryMessenger: BinaryMessenger = messenger

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        var creationParams: MutableMap<String?, Any?> = mutableMapOf() //args as Map<String?, Any?>?
        //creationParams?.plus(args as Map<String?, Any?>?)
        creationParams["name"] = label
//        var viewId = 111
        return AndroidButtonView(context, viewId, creationParams, binaryMessenger)
    }
}