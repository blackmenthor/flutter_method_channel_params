import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  
    let CHANNEL = "com.anggach.flutternativeplugin/channel"
    let METHOD_COMPLEX = "COMPLEX"
    
    var result: FlutterResult?
    
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
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch call.method {
            case self.METHOD_COMPLEX:
                self.complex(call: call, result: result)
                break
            default:
                result(FlutterMethodNotImplemented)
            }
        })
    }
    
    private func getIsyaTime() {
        if (self.result == nil) {
            return
            
        }
        self.result?("19.35")
    }
    
    private func complex(call: FlutterMethodCall,
                         result: @escaping FlutterResult) {
        self.result = result
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0, execute: {
            self.getIsyaTime()
        })
    }
    
}
