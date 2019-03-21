import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    let CHANNEL = "com.anggach.flutternativeplugin/channel"
    let METHOD_CALCULATE = "CALCULATE"
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    setUpMethodChannel()
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func setUpMethodChannel() {
        guard let controller: FlutterViewController = window?.rootViewController as? FlutterViewController else {
            fatalError("Invalid root view controller")
        }
        
        let methodChannel = FlutterMethodChannel(name: CHANNEL,
                                                 binaryMessenger: controller)
        
        methodChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            switch call.method {
            case self.METHOD_CALCULATE:
                self.calculate(call: call, result: result)
                break
            default:
                result(FlutterMethodNotImplemented)
            }
        })
    }
    
    private func calculate(call: FlutterMethodCall,
                           result: FlutterResult) {
        let args = call.arguments as? [String: Any?]
        let a = args?["a"] as! Int?
        let b = args?["b"] as! Int?
        
        let res = a! + b!
        result(res)
    }
    
}
