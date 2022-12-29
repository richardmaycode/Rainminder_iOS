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
    
    let title: String
    @State var watchType: WatchType
    
    var iconColor: Color {
        switch watchType {
        case .need:
            return .green
        case .avoid:
            return .red
        }
    }
    
    var body: some View {
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
            
            Text(title)
                .font(.system(.headline, design: .rounded))
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
            }
        }
    }
    
    var icon: some View {
        Circle()
            .foregroundColor(iconColor)
            .frame(width: 10, height: 10, alignment: .center)
            .shadow(color: iconColor, radius: 2)
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
        WatchCard(title: "Sprinklers", watchType: .need)
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
