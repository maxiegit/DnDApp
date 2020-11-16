//
//  DnDAppApp.swift
//  DnDApp
//
//  Created by Max Magill on 03/11/2020.
//

import SwiftUI

@main
struct DnDAppApp: App {
    
    
    
    let persistenceContainer = PersistenceContainer.shared
    
    var body: some Scene {
        WindowGroup {
            MainMenu()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
