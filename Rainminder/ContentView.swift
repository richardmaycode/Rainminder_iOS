//
//  ContentView.swift
//  Rainminder
//
//  Created by Richard Wise on 12/27/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                InfoGrid()
            }
            .navigationTitle("Rainminder")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
