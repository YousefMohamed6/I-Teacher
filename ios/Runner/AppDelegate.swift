import UIKit
import AVFoundation

@main
@objc class AppDelegate: FlutterAppDelegate {
    var window: UIWindow?

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(screenCaptureStatusChanged),
            name: UIScreen.capturedDidChangeNotification,
            object: nil
        )
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    @objc func screenCaptureStatusChanged() {
        if UIScreen.main.isCaptured {
            window?.isHidden = true
        } else {
            window?.isHidden = false
        }
    }
}
