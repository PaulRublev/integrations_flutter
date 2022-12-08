package com.example.integrations_flutter

import android.annotation.SuppressLint
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.widget.Button
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
//import kotlin.random.Random

//import kotlinx.coroutines.*

class MainActivity: FlutterActivity() {
    private val androidViewId = "INTEGRATION_ANDROID"
    private val eventsChannel = "CALL_EVENTS"
    private val methodChannel = "CALL_METHOD"
    private val intentName = "EVENTS"
    private val intentMessageId = "CALL" 

    private var receiver: BroadcastReceiver? = null
    private var text: String? = "button"
//    lateinit var job: Job

    @SuppressLint("ResourceType")
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(androidViewId, AndroidButtonViewFactory(flutterEngine.dartExecutor.binaryMessenger, text))

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannel).setMethodCallHandler {
            call, result ->
            if (call.method == intentMessageId) {
                var args = call.arguments as List<*>
                text = args.first().toString()
                val button = findViewById<Button>(123)
                button.text = text
                button.refreshDrawableState()
                result.success(args.first().toString())
//                result.success(Random.nextInt(0,500))
            } else {
                result.notImplemented()
            }
        }

        EventChannel(flutterEngine.dartExecutor, eventsChannel).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(args: Any?, events: EventChannel.EventSink) {
//                    val intent = Intent(intentName)
                    receiver = createReceiver(events)
                    applicationContext?.registerReceiver(receiver, IntentFilter(intentName))
//                    job = CoroutineScope(Dispatchers.Default).launch {
//                        for (i in 1..20) {
//                            intent.putExtra(intentMessageId, Random.nextInt(0,500))
//                            applicationContext?.sendBroadcast(intent)
//                            delay(1000)
//                        }
//                    }
                }

                override fun onCancel(args: Any?) {
//                    job.cancel()
                    receiver = null
                }
            }
        )
    }

    fun createReceiver(events: EventChannel.EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                events.success(intent.getIntExtra(intentMessageId, 0))
            }
        }
    }
}
