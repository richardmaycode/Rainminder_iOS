//
//  InterfaceStyle.swift
//  Rainminder
//
//  Created by Richard Wise on 12/31/22.
//

import SwiftUI

enum InterfaceStyle: Int, Identifiable, CaseIterable {
    case system, light, dark
    
    var id: Int { self.rawValue }
    
    var overrideStyle: ColorScheme? {
        switch self {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    
    var label: String {
        switch self {
        case .system:
            return "System"
        case .light:
            return "Light"
        case .dark:
            return "Dark"
        }
    }
}
