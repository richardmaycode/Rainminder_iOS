//
//  InfoGrid.swift
//  Rainminder
//
//  Created by Richard Wise on 12/27/22.
//

import SwiftUI

struct InfoItem: Identifiable {
    let id: UUID = UUID()
    let title: String
    let icon: String
    let stat: String
}


struct InfoGrid: View {
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    let items: [InfoItem] = [InfoItem(title: "Today's Change", icon: "umbrella.percent", stat: "33.3"),
    InfoItem(title: "Weekly Total", icon: "arrow.up.bin", stat: "1.3")]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(items) { item in
                InfoCard(title: item.title, icon: item.icon, stat: item.stat)
            }
        }
        .padding(.horizontal)
    }
}

struct InfoGrid_Previews: PreviewProvider {
    static var previews: some View {
        InfoGrid()
    }
}
