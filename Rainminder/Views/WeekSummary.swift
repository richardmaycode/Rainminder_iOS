//
//  WeekSummary.swift
//  Rainminder
//
//  Created by Richard Wise on 12/27/22.
//

import SwiftUI

struct WeekSummary: View {
    var body: some View {
        Grid {
            gridHeaderRow
        }
    }
    
    var gridHeaderRow: some View {
        GridRow {
            Text("--")
            ForEach(Calendar.current.nextSevenDayLabels(), id: \.self)  { label in
                Text(label)
            }
        }
    }
}

struct WeekSummary_Previews: PreviewProvider {
    static var previews: some View {
        WeekSummary()
    }
}
