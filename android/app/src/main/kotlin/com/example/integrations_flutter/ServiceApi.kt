package com.example.integrations_flutter

import android.annotation.SuppressLint
import io.flutter.plugins.Pigeon

class ServiceApi(activity: MainActivity): Pigeon.ServiceApi {
    private var activity = activity
    @SuppressLint("ResourceType")
    override fun setLabelText(text: String) {
        activity.setText(text)
    }
}