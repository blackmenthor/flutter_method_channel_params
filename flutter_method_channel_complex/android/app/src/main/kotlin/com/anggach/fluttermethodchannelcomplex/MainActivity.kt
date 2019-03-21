package com.anggach.fluttermethodchannelcomplex

import android.os.Bundle
import android.os.Handler

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

  private val channelName = "com.anggach.flutternativeplugin/channel"
  private val complexMethod = "COMPLEX"

  private var result: MethodChannel.Result? = null

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
      complexMethod -> complex(methodCall, result)
      else -> result.notImplemented()
    }
  }

  private fun getIsyaTime() {
    if (this.result == null) return
    this.result?.success("19.35")
  }

  private fun complex(methodCall: MethodCall, result: MethodChannel.Result) {
    this.result = result

    Handler().postDelayed({
      getIsyaTime()
    }, 4000)
  }

}
