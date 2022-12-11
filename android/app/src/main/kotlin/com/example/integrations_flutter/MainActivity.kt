package com.example.integrations_flutter

import android.annotation.SuppressLint
import android.widget.TextView
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.Pigeon

class MainActivity: FlutterActivity() {
    private val androidViewId = "INTEGRATION_ANDROID"

    private var text: String? = "Android label"
    @SuppressLint("ResourceType")
    fun setText(text: String) {
        val textView = findViewById<TextView>(123)
        textView.text = text
        textView.refreshDrawableState()
    }

    @SuppressLint("ResourceType")
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(
                androidViewId,
                AndroidTextViewFactory(flutterEngine.dartExecutor.binaryMessenger, text)
            )

        Pigeon.ServiceApi.setup(flutterEngine.dartExecutor.binaryMessenger, ServiceApi(this))
    }
}