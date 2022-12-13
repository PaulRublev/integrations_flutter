package com.example.myapplication

import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
import kotlin.random.Random

class FlutterEmbeddingActivity : FlutterActivity() {

    companion object : FlutterActivity() {

        private const val methodChannel = "CALL_METHOD"
        private const val intentMessageId = "CALL"
        private lateinit var cachedFlutterEngine: FlutterEngine

        fun initialiseFlutterEngine(
            context: Context,
            engineId: String,
        ): FlutterEngine {
            cachedFlutterEngine = FlutterEngine(context)
            cachedFlutterEngine.dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
            )
            FlutterEngineCache
                .getInstance()
                .put(engineId, cachedFlutterEngine)

            configureFlutterEngine(cachedFlutterEngine)

            return cachedFlutterEngine
        }

        override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
            MethodChannel(
                flutterEngine.dartExecutor.binaryMessenger,
                methodChannel
            ).setMethodCallHandler { call, result ->
                if (call.method == intentMessageId) {
                    result.success(Random.nextInt(0, 500))
                } else {
                    result.notImplemented()
                }
            }
        }
    }
}
