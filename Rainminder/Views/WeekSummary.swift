//
//  WeekSummary.swift
//  Rainminder
//
//  Created by Richard Wise on 12/27/22.
//

import SwiftUI

struct WeekSummary: View {
    var body: some View {
        GroupBox {
            Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                gridHeaderRow
                gridDataRow(icon: "sunrise", data: Array(repeating: "---", count: 7))
                gridDataRow(icon: "sun.max", data: Array(repeating: "---", count: 7))
                gridDataRow(icon: "sunset", data: Array(repeating: "---", count: 7))
                gridDataRow(icon: "moon.stars", data: Array(repeating: "---", count: 7))
            }
            .padding(.vertical, 8)
        } label: {
            Text("Weekly Summary")
                .font(.system(.headline, design: .rounded))
        }
    }
    
    var gridHeaderRow: some View {
        GridRow {
            Text("-")
            ForEach(Calendar.current.nextSevenDayLabels(), id: \.self)  { label in
                Text(label)
                    .bold()
            }
        }
    }
    
    @ViewBuilder
    func gridDataRow(icon: String, data: [String]) -> some View {
        GridRow {
            Image(systemName: icon)
            ForEach(data, id: \.self) { data in
                Text(data)
            }
        }
    }
}

struct WeekSummary_Previews: PreviewProvider {
    static var previews: some View {
        WeekSummary()
    }
}
