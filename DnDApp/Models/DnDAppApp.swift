import SwiftUI
import UIKit
import Firebase
import FirebaseAuth

// reinstate the appdelegate
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // init firebase
        FirebaseApp.configure()
        
        UITableView.appearance().backgroundColor = .clear
        
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
            

        // Checking if unit tests are running
        if ProcessInfo.processInfo.environment["unit_tests"] == "true" {
          print("Setting up Firebase emulator localhost:8080")
          let settings = Firestore.firestore().settings
          settings.host = "localhost:4000"
          settings.isPersistenceEnabled = false
          settings.isSSLEnabled = false
          Firestore.firestore().settings = settings
        }

        Auth.auth().signInAnonymously()
        return true
    }
}

@main
struct DnDAppApp: App {
    // inject appdelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            MainMenu()
        }
    }
}

// This is required to replace the old scene and app delegate that was removed in swiftUI 2.0
