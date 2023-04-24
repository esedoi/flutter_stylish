package com.example.flutter_stylish

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val CHANNEL = "com.example.channel"

        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))

        flutterEngine?.dartExecutor?.let {
            MethodChannel(it.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
                if (call.method == "getNativeString") {
                    val message = "Hello from Kotlin!"
                    result.success(message)
                } else {
                    result.notImplemented()
                }
            }
        }
    }
}
