//
//  AccentStyle.swift
//  Rainminder
//
//  Created by Richard Wise on 12/31/22.
//

import SwiftUI

enum AccentStyle: Int, Identifiable, CaseIterable {
    case red, orange, green, blue, pink, indigo, mint, teal
    
    var id: Int { self.rawValue }
    
    var label: String {
        switch self {
        case .red:
            return "red"
        case .orange:
            return "orange"
        case .green:
            return "green"
        case .blue:
            return "blue"
        case .pink:
            return "pink"
        case .indigo:
            return "indigo"
        case .mint:
            return "mint"
        case .teal:
            return "teal"
        }
    }
    
    var color: Color {
        switch self {
        case .red:
            return .red
        case .orange:
            return .orange
        case .green:
            return .green
        case .blue:
            return .blue
        case .pink:
            return .pink
        case .indigo:
            return .indigo
        case .mint:
            return .mint
        case .teal:
            return .teal
        }
    }
}
