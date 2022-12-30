//
//  WatchCreateView.swift
//  Rainminder
//
//  Created by Richard Wise on 12/28/22.
//

import SwiftUI

struct WatchDay: Identifiable, Equatable {
    let id: Int
    let key: String
    var value: Bool
    let shortKey: String
    
    static let options: [WatchDay] = [
        WatchDay(id: 1, key: "Sun", value: true, shortKey: "S"),
        WatchDay(id: 2, key: "Mon", value: true, shortKey: "M"),
        WatchDay(id: 3, key: "Tue", value: true, shortKey: "T"),
        WatchDay(id: 4, key: "Wed", value: true, shortKey: "W"),
        WatchDay(id: 5, key: "Thr", value: true, shortKey: "R"),
        WatchDay(id: 6, key: "Fri", value: true, shortKey: "F"),
        WatchDay(id: 7, key: "Sat", value: true, shortKey: "S"),
    ]
    
}

struct WatchCreateView: View {
    
    @State private var name: String = ""
    @State private var watchType: WatchType = .avoid
    @State private var watchDays: [WatchDay] = WatchDay.options

    @State private var notify: Bool = false
    @State private var weekly: Bool = false
    @State private var daily: Bool = false
    
    @State private var selectionLabel: String = "Everyday"
        
    let onSubmit: (() -> Void)?
    let onCancel: (() -> Void)?
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            Picker("Type", selection: $watchType) {
                ForEach(WatchType.allCases) { watchtype in
                    Text(watchtype.label)
                        .tag(watchtype)
                }
            }
            
            Section {
                Grid(horizontalSpacing: 8) {
                    GridRow {
                        ForEach($watchDays) { $day in
                            WatchDayToggle(label: day.shortKey, choice: $day.value)
                        }
                        .onChange(of: watchDays) { newValue in
                            let filteredDays = watchDays.filter { $0.value == true }.map { $0.id }
                            
                            selectionLabel = watchDayLabel(for: filteredDays)
                        }
                        .padding(.vertical)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
            } header: {
                Label("Watch Days", systemImage: "calendar")
            } footer: {
                Text(selectionLabel)
            }
            
            Section {
                Toggle("Notify Me", isOn: $notify)
                if notify {
                    Toggle("Weekly", isOn: $weekly)
                    Toggle("Daily", isOn: $daily)
                }
            } header: {
                Label("Notifications", systemImage: "bell.fill")
            }
            
            
        }
        .navigationTitle("Create Watch")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(action: { }) {
                    Text("Dismiss")
                }
            }
            
            ToolbarItem(placement: .principal) {
                Image(systemName: "binoculars.fill")
            }
            
            ToolbarItem(placement: .primaryAction) {
                Button(action: { }) {
                    Text("Submit")
                }
            }
            

        }
    }
    
    func watchDayLabel(for selection: [Int]) -> String {
        let options = [
            [1, 2, 3, 4, 5, 6, 7]: "Everyday",
            [2, 3, 4, 5, 6]: "Weekdays",
            [1, 7]: "Weekends"
        ]
        
        return options[selection, default: "Custom"]
    }
}

struct WatchCreateView_Previews: PreviewProvider {
    static var previews: some View {
        return NavigationStack {
            WatchCreateView(onSubmit: nil, onCancel: nil)
        }
    }
}
