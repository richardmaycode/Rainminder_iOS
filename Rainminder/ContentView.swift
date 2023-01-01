//
//  ContentView.swift
//  Rainminder
//
//  Created by Richard Wise on 12/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage(AppStorageKeys.accent) var currentAccentColor: AccentStyle = .blue
    
    @State private var presentingAddWatcher: Bool = false
    @State private var presentingWatcherDetails: Bool = false
    
    @State var selectedWatch: Watch?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                InfoGrid()
                WeekSummary()
                
                sectionHeader("Watches", icon: "binoculars.fill")
                ForEach(Watch.data) { watch in
                    WatchCard(watch: watch, onDetail: { showWatchDetail(for: watch)})
                }
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
        .tint(currentAccentColor.color)
        .sheet(isPresented: $presentingAddWatcher) {
            NavigationStack {
                WatchCreateView(onSubmit: nil, onCancel: { closeWatchForm() })
            }
        }
        .sheet(item: $selectedWatch) { watch in
            
                VStack {
                    
                    HStack {
                        Text(watch.name)
                            .font(.title)
                        Spacer()
                        Button {
                            selectedWatch = nil
                        } label: {
                            Label("Close", systemImage: "xmark.circle.fill")
                                .font(.title3)
                                .labelStyle(.iconOnly)
                        }
                        .tint(.gray)
                    }
                    .padding(.vertical)
                    
                    Grid(horizontalSpacing: 8) {
                        GridRow {
                            ForEach(selectedWatch?.watchDays ?? [WatchDay]()) { day in
                                WatchDayDisplay(day: day)
                            }

                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Edit")
                                .font(.title2)
                                .frame(maxWidth: .infinity)
                                .padding(10)
                        }
                        .buttonStyle(.borderedProminent)
                        
                        
                        
                        Button {
                            
                        } label: {
                            Label("Share", systemImage: "square.and.arrow.up")
                                .font(.title2)
                                .labelStyle(.iconOnly)
                                .padding(10)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.yellow)
                        
                        Button(role: .destructive) {
                            
                        } label: {
                            Label("Delete", systemImage: "trash")
                                .font(.title2)
                                .labelStyle(.iconOnly)
                                .padding(10)
                        }
                        .buttonStyle(.borderedProminent)
                        
                        
                    }
                    .padding(.vertical)
                    Spacer()
                }
                .padding()
                .presentationDetents([.fraction(0.33)])
                
                
                
                    
            
            
        }
        .modifier(UserColorSchemeModifier())

        
        
        
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
    
    func showWatchDetail(for watch: Watch) {
        selectedWatch = watch
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
