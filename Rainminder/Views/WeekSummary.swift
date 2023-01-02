//
//  WeekSummary.swift
//  Rainminder
//
//  Created by Richard Wise on 12/27/22.
//

import SwiftUI

struct DataPoint: Identifiable {
    let id = UUID()
    let value: String
    
    func generateRow(count: Int) -> [DataPoint] {
        
        var items = [DataPoint]()
        
        for _ in 0..<count {
            items.append(DataPoint(value: "---"))
        }
        
        return items
    }
}


struct WeekSummary: View {
    var body: some View {
        GroupBox {
            Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                gridHeaderRow
                gridDataRow(icon: "sunrise", data: DataPoint(value: "---").generateRow(count: 7))
                gridDataRow(icon: "sun.max", data: DataPoint(value: "---").generateRow(count: 7))
                gridDataRow(icon: "sunset", data: DataPoint(value: "---").generateRow(count: 7))
                gridDataRow(icon: "moon.stars", data: DataPoint(value: "---").generateRow(count: 7))
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
    func gridDataRow(icon: String, data: [DataPoint]) -> some View {
        GridRow {
            Image(systemName: icon)
            ForEach(data) { data in
                Text(data.value)
            }
        }
    }
}

struct WeekSummary_Previews: PreviewProvider {
    static var previews: some View {
        WeekSummary()
    }
}
