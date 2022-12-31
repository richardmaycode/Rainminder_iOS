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
                WatchCard(title: "Fishing", notify: true, watchType: .need)
                WatchCard(title: "Running", notify: false, watchType: .avoid)
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
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gear")
                                .symbolRenderingMode(.hierarchical)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .sheet(isPresented: $presentingAddWatcher) {
            NavigationStack {
                WatchCreateView(onSubmit: nil, onCancel: { closeWatchForm() })
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
    
    func closeWatchForm() {
        presentingAddWatcher = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
