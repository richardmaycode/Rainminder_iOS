//
//  WatchCard.swift
//  Rainminder
//
//  Created by Richard Wise on 12/28/22.
//

import SwiftUI

enum WatchType: Int, Identifiable, Hashable, CaseIterable {
    case need, avoid
    
    var id: Int { self.rawValue }
    
    var label: String {
        switch self {
        case .need:
            return "Need"
        case .avoid:
            return "Avoid"
        }
    }
}


struct WatchCard: View {
    
    let watch: Watch
    let onDetail: (( ) -> Void)?
    
    var body: some View {
        VStack {
            GroupBox {
                Grid(horizontalSpacing: 10, verticalSpacing: 10) {
                    gridHeaderRow
                    dataRow(icon: "plus.slash.minus", data: Array(repeating: "---", count: 7))
                    dataRow(icon: "percent", data: Array(repeating: "---", count: 7))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 5)
            } label: {
                boxHeader
            }
            
            HStack {
                Image(systemName: "bell")
                Text("Weekly")
                
            }
            .font(.caption2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        }
        .padding(.bottom)
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
    
    var boxHeader: some View {
        HStack {
            icon
            
            Text(watch.name)
                .font(.system(.headline, design: .rounded))
            
            Spacer()
            Button {
                onDetail?()
            } label: {
                Image(systemName: "ellipsis")
            }
        }
    }
    
    var icon: some View {
        Circle()
            .foregroundColor(watch.iconColor)
            .frame(width: 10, height: 10, alignment: .center)
            .shadow(color: watch.iconColor, radius: 2)
    }
    
    @ViewBuilder
    func dataRow(icon: String, data: [String]) -> some View {
        GridRow {
            Image(systemName: icon)
            ForEach(data, id: \.self) { data in
                Text(data)
            }
        }
    }

}

struct WatchCard_Previews: PreviewProvider {
    static var previews: some View {
        WatchCard(watch: Watch.data.first!, onDetail: { })
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
