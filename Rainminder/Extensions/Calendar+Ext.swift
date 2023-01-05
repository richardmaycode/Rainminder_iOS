//
//  Calendar+Ext.swift
//  Rainminder
//
//  Created by Richard Wise on 12/27/22.
//

import Foundation

extension Calendar {
    func nextSevenDayLabels() -> [String] {
        var labels: [String] = []
        let dayNames: [Int: String] = [
            1: "Sun",
            2: "Mon",
            3: "Tue",
            4: "Wed",
            5: "Thr",
            6: "Fri",
            7: "Sat",
            
        ]
        
        for i in 0...6 {
            let weekdayNumber: Int = Calendar.current.dateComponents([.weekday], from: Calendar.current.date(byAdding: .day, value: i, to: Date())!).weekday ?? 0
            labels.append(dayNames[weekdayNumber, default: "NA"])
        }
        return labels
        
    }
}
