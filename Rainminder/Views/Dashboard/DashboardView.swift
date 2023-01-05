//
//  DashboardView.swift
//  Rainminder
//
//  Created by Richard Wise on 1/4/23.
//

import SwiftUI

struct DashboardView: View {
    
    @AppStorage(AppStorageKeys.accent) var currentAccentColor: AccentStyle = .blue
    
    @State private var presentingAddWatcher: Bool = false
    @State private var presentingWatcherDetails: Bool = false
    @State private var isEditingWatch: Bool = false
    
    @State var selectedWatch: Watch?
    @State var editWatch: Watch?
    
    var body: some View {
        ScrollView {
            InfoGrid()
            WeekSummary()
            
            sectionHeader("Watches", icon: "binoculars.fill")
            ForEach(Watch.data) { watch in
                WatchCard(watch: watch, onDetail: { showWatchDetail(for: watch)})
            }
            
            .navigationDestination(isPresented: $isEditingWatch) {
                WatchCreateView(watch: editWatch, onSubmit: { }, onCancel: { })
            }
        }
        .padding(.horizontal)
        .navigationTitle("Rainminder")
        .toolbar {
            
            ToolbarItem(placement: .principal) {
                Text(RMLocation.data().first!.name)
            }
            
            ToolbarItemGroup(placement: .primaryAction) {
                
                Button {
                    presentingAddWatcher = true
                } label: {
                    Image(systemName: "plus")
                        .symbolVariant(.circle)
                        .symbolRenderingMode(.hierarchical)
                }
                
                Button {
                    // Add Future Date Planning Screen
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
        .sheet(isPresented: $presentingAddWatcher) {
            NavigationStack {
                WatchCreateView(watch: nil, onSubmit: nil, onCancel: { closeWatchForm() })
            }
        }
        .sheet(item: $selectedWatch) { watch in
            WatchSelectionDialog(watch: watch, onEdit: { onWatchEdit(for: watch) })
                .presentationDetents([.fraction(0.30)])
                .presentationDragIndicator(.visible)
        }
        .tint(currentAccentColor.color)
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
    
    func onWatchEdit(for watch: Watch ) {
        print("Called")
        editWatch = watch
        selectedWatch = nil
        isEditingWatch = true
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DashboardView()
        }
    }
}
