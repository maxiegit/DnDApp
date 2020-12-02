//
//  DnDAppApp.swift
//  DnDApp
//
//  Created by Max Magill on 03/11/2020.
//

import SwiftUI
import Firebase

@main
struct DnDAppApp: App {
    
    // Configure Firebase with applicaiton start
    init() {
      FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainMenu()
        }
    }
}
