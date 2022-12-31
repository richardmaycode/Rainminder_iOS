//
//  RainminderApp.swift
//  Rainminder
//
//  Created by Richard Wise on 12/27/22.
//

import SwiftUI

@main
struct RainminderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modifier(UserColorSchemeModifier())
        }
    }
}
