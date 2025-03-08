import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Flutter 엔진 초기화
    let controller = self.window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "com.gachtaxi.app/maps", binaryMessenger: controller.binaryMessenger)
    
    // .env에서 API 키를 Flutter 코드에서 가져오도록 함
    channel.setMethodCallHandler { [weak self] (call, result) in
      guard call.method == "setGoogleMapsApiKey" else {
        result(FlutterMethodNotImplemented)
        return
      }
      
      if let apiKey = call.arguments as? String {
        GMSServices.provideAPIKey(apiKey)
        result(true)
      } else {
        result(FlutterError(code: "INVALID_API_KEY", message: "API 키가 유효하지 않습니다", details: nil))
      }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
