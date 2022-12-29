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
    
    static let options: [WatchDay] = [
        WatchDay(id: 1, key: "Sun", value: true),
        WatchDay(id: 2, key: "Mon", value: true),
        WatchDay(id: 3, key: "Tue", value: true),
        WatchDay(id: 4, key: "Wed", value: true),
        WatchDay(id: 5, key: "Thr", value: true),
        WatchDay(id: 6, key: "Fri", value: true),
        WatchDay(id: 7, key: "Sat", value: true),
    ]
}

enum WatchSelection: String, Identifiable, CaseIterable {
    case everyday, weekdays, weekends, custom
    
    var id: String { self.rawValue}
    
    var label: String {
        switch self {
        case .everyday:
            return "Mon, Tues, Wed, Thr, Fri, Sat, Sun"
        case .weekdays:
            return "Mon, Tues, Wed, Thr, Fri"
        case .weekends:
            return "Sat, Sun"
        case .custom:
            return "Mon, Tues, Wed, Thr, Fri, Sat, Sun"
        }
    }
    
    var values: [Bool] {
        switch self {
        case .everyday:
            return [true, true, true, true, true, true, true]
        case .weekdays:
            return [false, true, true, true, true, true, false]
        case .weekends:
            return [true, false, false, false, false, false, true]
        case .custom:
            return [true, true, true, true, true, true, true]
        }
    }
}

struct WatchCreateView: View {
    
    @State private var name: String = ""
    @State private var watchType: WatchType = .avoid
    @State private var watchDays: [WatchDay] = WatchDay.options
    
    @State private var watchSelection: WatchSelection = .everyday
    @State private var selectionLabel: String = WatchSelection.everyday.label
        
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
                Picker("Days to Watch", selection: $watchSelection) {
                    ForEach(WatchSelection.allCases) { selection in
                        Text(selection.rawValue.capitalized)
                            .tag(selection)
                    }
                }
                .onChange(of: watchSelection) { newValue in
                    selectionLabel = newValue.label
                    
                    for index in watchDays.indices {
                        watchDays[index].value = newValue.values[index]
                    }
                }
                
                if(watchSelection == .custom) {
                    ForEach($watchDays) { $day in
                        Toggle(day.key, isOn: $day.value)
                    }
                    .onChange(of: watchDays) { newValue in
                        
                        selectionLabel = newValue.filter { $0.value }.map { $0.key }.joined(separator: ", ")
                        
                        
                    }
                }
            } header: {
                Text("Watch Days")
            } footer: {
                Text(selectionLabel)
                    .font(.caption2)
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
}

struct WatchCreateView_Previews: PreviewProvider {
    static var previews: some View {
        return NavigationStack {
            WatchCreateView(onSubmit: nil, onCancel: nil)
        }
    }
}
