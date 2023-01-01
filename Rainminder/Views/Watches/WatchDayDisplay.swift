//
//  WatchDayDisplay.swift
//  Rainminder
//
//  Created by Richard Wise on 1/1/23.
//

import SwiftUI

struct WatchDayDisplay: View {
    
    let day: WatchDay
    
    var body: some View {
        VStack(spacing: 16) {
            Text(day.shortKey)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(day.value ? .green.opacity(0.4) : .gray.opacity(0.4))
                        .frame(width: 32, height: 32)
                }
        }

    }
}

struct WatchDayDisplay_Previews: PreviewProvider {
    static var previews: some View {
        WatchDayDisplay(day: WatchDay(id: 1, key: "Monday", value: true, shortKey: "M"))
    }
}
