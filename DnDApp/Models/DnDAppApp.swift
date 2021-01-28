import SwiftUI
import UIKit
import Firebase

//reinstate the appdelegate
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //init firebase
        FirebaseApp.configure()
        return true
    }
}

@main
struct DnDAppApp: App {
    //inject appdelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainMenu()
        }
    }
}

// This is required to replace the old scene and app delegate that was removed in swiftUI 2.0
