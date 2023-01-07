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
    
    var isCompact: Bool = true
    
    var body: some View {
        GroupBox {
            Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                gridHeaderRow
                if isCompact {
                    compact
                } else {
                    expanded
                        .frame(maxWidth: .infinity)
                }
                
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
        } label: {
            Text("Weekly Summary")
                .font(.system(.headline, design: .rounded))
        }
        .overlay(alignment: .topTrailing) {
            if isCompact {
                NavigationLink {
                    NavigationStack {
                        ScrollView {
                            WeekSummary(isCompact: false)
                                .navigationTitle("Summary Expanded")
                                .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                } label: {
                    Image(systemName: "chevron.right.circle")
                }
                .padding([.top, .trailing],10)
                
                
            }
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
    var compact: some View {
        gridDataRow(icon: "sunrise", data: DataPoint(value: "---").generateRow(count: 7), useImage: true)
        gridDataRow(icon: "sun.max", data: DataPoint(value: "---").generateRow(count: 7), useImage: true)
        gridDataRow(icon: "sunset", data: DataPoint(value: "---").generateRow(count: 7), useImage: true)
        gridDataRow(icon: "moon.stars", data: DataPoint(value: "---").generateRow(count: 7), useImage: true)
    }
    
    @ViewBuilder
    var expanded: some View {
        ForEach(1..<24) { i in
            gridDataRow(icon: "\(i)", data: DataPoint(value: "---").generateRow(count: 7), useImage: false)
        }
    }
    
    
    @ViewBuilder
    func gridDataRow(icon: String, data: [DataPoint], useImage: Bool) -> some View {
        GridRow {
            if useImage {
                Image(systemName: icon)
            } else {
                Text(icon)
            }
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
