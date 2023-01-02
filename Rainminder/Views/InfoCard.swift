//
//  InfoCard.swift
//  Rainminder
//
//  Created by Richard Wise on 12/27/22.
//

import SwiftUI

struct InfoCard: View {
    
    let title: String
    let icon: String
    let stat: String
    
    var body: some View {
        VStack {
            
            HStack {
                Text(title)
                    .font(.headline)
                    .lineLimit(2, reservesSpace: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: icon)
                    .font(.system(size: 32))
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            
            Text(stat)
                .font(.system(size: 56, weight: .bold, design: .rounded))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .padding()
        .foregroundColor(.white)
        .frame(maxHeight: 150)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.blue.gradient)
        }
    }
}

struct InfoCard_Previews: PreviewProvider {
    static var previews: some View {
        InfoCard(title: "Today Chance", icon: "umbrella.percent", stat: "33.3")
            .previewLayout(.fixed(width: 250, height: 250))
    }
}
