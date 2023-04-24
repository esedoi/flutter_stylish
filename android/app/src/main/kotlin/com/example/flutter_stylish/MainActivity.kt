package com.example.flutter_stylish

import android.os.Bundle
import com.example.test_tappay.PrimeDialog
import com.google.android.material.dialog.MaterialAlertDialogBuilder
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity() {
//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//
//        val CHANNEL = "com.example.channel"
//
//        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
//
//        flutterEngine?.dartExecutor?.let {
//            MethodChannel(it.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
//                if (call.method == "getNativeString") {
//                    val message = "Hello from Kotlin!"
//                    result.success(message)
//                } else {
//                    result.notImplemented()
//                }
//            }
//        }
//    }
private val CHANNEL = "test_tappay"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        Log.d(TAG, "configureFlutterEngine")

        setChannelByCustomDialog(flutterEngine)

    }

    fun setChannelByCustomDialog(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->

                if (call.method == "tappay") {
                    Log.d(TAG, "i got u ^.<")

                    val dialog = PrimeDialog(context, object : PrimeDialog.PrimeDialogListener {
                        override fun onSuccess(prime: String) {
                            Log.d(TAG, "onSuccess, prime=$prime")
                            result.success(prime)
                        }

                        override fun onFailure(error: String) {
                            Log.d(TAG, "onFailure, error=$error")
                            result.success(error)
                        }

                    })

                    dialog.show()

                } else {
                    Log.d(TAG, "u know nothing ${call.method}")

                    result.error("404", "404", null)
                }

//                result.error("404", "404", null)
            }

    }

    fun setChannelByAlertDialog(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->

                if (call.method == "tappay") {
                    Log.d(TAG, "i got u ^.<")

                    val dialog = MaterialAlertDialogBuilder(context)
                        .setTitle("Dialog")
                        .setMessage("Write your message here. ....")
                        .setPositiveButton("Ok") { _, _ ->

                            result.success("Ok got u")
                        }
                        .setNegativeButton("Cancel") { _, _ ->

                            result.success("Cancel got u")
                        }

                    dialog.show()

                } else {
                    Log.d(TAG, "u know nothing ${call.method}")

                    result.error("404", "404", null)
                }

//                result.error("404", "404", null)
            }

    }

    companion object {
        const val TAG = "anan-android"
    }



}
