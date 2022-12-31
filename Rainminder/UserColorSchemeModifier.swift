//
//  UserColorSchemeModifier.swift
//  Rainminder
//
//  Created by Richard Wise on 12/31/22.
//

import SwiftUI

struct UserColorSchemeModifier: ViewModifier {
    @AppStorage(AppStorageKeys.colorScheme) var currentStyle: InterfaceStyle = .system
    @Environment(\.colorScheme) var systemStyle
    
    func body(content: Content) -> some View {
        content
            .environment(\.colorScheme, currentStyle.overrideStyle ?? systemStyle)
    }
}

