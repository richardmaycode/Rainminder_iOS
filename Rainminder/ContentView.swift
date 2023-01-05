//
//  ContentView.swift
//  Rainminder
//
//  Created by Richard Wise on 12/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(AppStorageKeys.accent) var currentAccentColor: AccentStyle = .blue
    
    var body: some View {
        NavigationStack {
            DashboardView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
