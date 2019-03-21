package com.anggach.fluttermethodchannelparams

import android.os.Bundle
import android.util.Log

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

  private val channelName = "com.anggach.flutternativeplugin/channel"
  private val calculateMethod = "CALCULATE"

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    setUpMethodChannel()
  }

  private fun setUpMethodChannel() {
    val channel = MethodChannel(flutterView, channelName)
    channel.setMethodCallHandler {
      methodCall, result ->
        handleMethodCall(methodCall, result)
    }
  }

  private fun handleMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
    when (methodCall.method) {
      calculateMethod -> calculate(methodCall, result)
      else -> result.notImplemented()
    }
  }

  private fun calculate(methodCall: MethodCall, result: MethodChannel.Result) {
    val params = methodCall.arguments() as Map<*, *>
    val a = params["a"] as Int?
    val b = params["b"] as Int?

    val res = a!!+b!!

    result.success(res)
  }
}
