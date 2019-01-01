import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    if let flutterVC: FlutterViewController = self.window.rootViewController as? FlutterViewController {

        FlutterMethodChannel(name: "com.farfetch.china.pandashop", binaryMessenger: flutterVC).setMethodCallHandler { (call, result) in

            result(FlutterMethodNotImplemented)
        }

    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
