//
//  Persistence.swift
//  DnDApp
//
//  Created by Max Magill on 03/11/2020.
//

import CoreData

struct PersistenceContainer {
    static let shared = PersistenceContainer()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "DnDApp")

        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Error: \(error)")
            }
        }
    }
}
