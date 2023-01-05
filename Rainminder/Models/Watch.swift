//
//  Watch.swift
//  Rainminder
//
//  Created by Richard Wise on 1/1/23.
//

import SwiftUI

struct Watch: Identifiable {
    let id = UUID()
    var name: String
    var watchType: WatchType
    var watchDays: [WatchDay]
    var notifies: Bool
    
    public var iconColor: Color {
        switch watchType {
        case .need:
            return .green
        case .avoid:
            return .red
        }
    }
}

extension Watch: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Watch {
    static let data: [Watch] = [
        Watch(name: "Sprinklers",
              watchType: .avoid,
              watchDays: WatchDay.optionsVaried, // TODO: Implement watchDays
              notifies: true
        ),
        Watch(name: "Fishing",
              watchType: .need,
              watchDays: WatchDay.options,
              notifies: false
        )
    ]
}
