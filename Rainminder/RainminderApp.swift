//
//  RainminderApp.swift
//  Rainminder
//
//  Created by Richard Wise on 12/27/22.
//

import SwiftUI

@main
struct RainminderApp: App {
    private let persistenceManager = PersistenceManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceManager.container.viewContext)
                .modifier(UserColorSchemeModifier())
        }
    }
}
