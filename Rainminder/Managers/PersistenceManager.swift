//
//  PersistenceManager.swift
//  Rainminder
//
//  Created by Richard Wise on 1/7/23.
//

import CoreData
import Foundation

struct PersistenceManager {
    static let shared = PersistenceManager()
    
    let container = NSPersistentContainer(name: "Rainminder")
    
    private init() {
        container.loadPersistentStores { description, error in
            if let error {
                print("CoreData failed to load: \(error.localizedDescription)")
            }
            
            print(description)
        }
    }
}
