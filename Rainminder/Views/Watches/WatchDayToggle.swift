//
//  WatchDayToggle.swift
//  Rainminder
//
//  Created by Richard Wise on 12/29/22.
//

import SwiftUI

struct WatchDayToggle: View {
    
    let label: String
    @Binding var choice: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            Text(label)
            
            Image(systemName: choice ? "checkmark" : "xmark")
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(choice ? .green.opacity(0.4) : .gray.opacity(0.4))
                        .frame(width: 32, height: 32)
                }
                .animation(.linear(duration: 0.25), value: choice)
        }
        .onTapGesture {
            choice.toggle()
        }
    }
}

struct WatchDayToggle_Previews: PreviewProvider {
    static var previews: some View {
        WatchDayToggle(label: "M", choice: .constant(true))
    }
}
