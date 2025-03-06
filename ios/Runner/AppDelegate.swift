import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if let apiKey = ProcessInfo.processInfo.environment["GOOGLE_MAP_API_KEY"] {
      GMSServices.provideAPIKey(apiKey)
    } else {
      print("❌ GOOGLE_MAP_API_KEY not found")
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
