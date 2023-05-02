package com.chimou.flutter_hms_gms_availability

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import android.content.Context
import com.huawei.hms.api.ConnectionResult
import com.huawei.hms.api.HuaweiApiAvailability
import com.google.android.gms.common.GoogleApiAvailability

/** FlutterHmsGmsAvailabilityPlugin */
public class FlutterHmsGmsAvailabilityPlugin : FlutterPlugin, MethodCallHandler {

 var context: Context? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "flutter_hms_gms_availability")
    context = flutterPluginBinding.applicationContext
    channel.setMethodCallHandler(this)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    // do nothing
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "isHmsAvailable") {
      result.success(isHmsAvailable())
    } else if (call.method == "isGmsAvailable") {
      result.success(isGmsAvailable())
    } else {
      result.notImplemented()
    }
  }

  private fun isHmsAvailable(): Boolean {
    var isAvailable = false
    if (null != context) {
        val result = HuaweiApiAvailability.getInstance().isHuaweiMobileServicesAvailable(context)
        isAvailable = ConnectionResult.SUCCESS == result
    }
    return isAvailable
  }

  private fun isGmsAvailable(): Boolean {
    var isAvailable = false
    
    val result: Int? = context?.let { GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(it) }
    isAvailable = com.google.android.gms.common.ConnectionResult.SUCCESS === result
    
    return isAvailable
  }
}
