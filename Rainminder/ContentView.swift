//
//  ContentView.swift
//  Rainminder
//
//  Created by Richard Wise on 12/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var presentingAddWatcher: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                InfoGrid()
                WeekSummary()
                
                sectionHeader("Watches", icon: "binoculars.fill")
                WatchCard(title: "Fishing", watchType: .need)
                WatchCard(title: "Running", watchType: .avoid)
            }
            .padding(.horizontal)
            .navigationTitle("Rainminder")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    
                    Button {
                        presentingAddWatcher = true
                    } label: {
                        Image(systemName: "plus")
                            .symbolVariant(.circle)
                            .symbolRenderingMode(.hierarchical)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "calendar.badge.plus")
                            .symbolVariant(.circle)
                            .symbolRenderingMode(.hierarchical)
                    }

                    


                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "person")
                            .symbolVariant(.circle)
                            .symbolRenderingMode(.hierarchical)
                    }
                }
            }
        }
        .sheet(isPresented: $presentingAddWatcher) {
            NavigationStack {
                WatchCreateView(onSubmit: nil, onCancel: nil)
            }
        }
        
    }
    
    @ViewBuilder
    func sectionHeader(_ title: String, icon: String) -> some View {
        HStack {
            Image(systemName: icon)
            Text(title)
        }
        .font(.system(.title, design: .rounded))
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
