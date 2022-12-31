//
//  AccentsPicker.swift
//  Rainminder
//
//  Created by Richard Wise on 12/31/22.
//

import SwiftUI

struct AccentsPicker: View {
    
    @Binding var accentColor: AccentStyle
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(AccentStyle.allCases) { style in
                    
                    let selected = accentColor == style
                    
                    VStack {
                        Circle()
                            .fill(style.color)
                            .frame(width: 100)
                        Text(style.label.capitalized)
                        Image(systemName: selected ? "checkmark.circle" : "circlebadge")
                            .symbolVariant(selected ? .fill : .none)
                        // FIXME: Update sizing of symbol so height doesn't bounce
                    }
                    .padding(.bottom)
                    .onTapGesture {
                        accentColor = style
                    }
                }
            }
        }
        .padding(.vertical)
        .navigationTitle("Accent Colors")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AccentsPicker_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AccentsPicker(accentColor: .constant(.red))
        }
    }
}
