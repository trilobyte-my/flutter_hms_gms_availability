import Flutter
import UIKit

public class SwiftFlutterHmsGmsAvailabilityPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_hms_gms_availability", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterHmsGmsAvailabilityPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(false);
  }
}
