//
//  LocationCell.swift
//  Rainminder
//
//  Created by Richard Wise on 1/3/23.
//

import SwiftUI
import CoreLocation

struct RMLocation: Identifiable {
    let id = UUID()
    let name: String
    let cordinates: CLLocationCoordinate2D
    let order: Int
}

extension RMLocation {
    static let data = {
        [
            RMLocation(name: "Parkland, FL", cordinates: CLLocationCoordinate2D(latitude: 1, longitude: 1), order: 0),
            RMLocation(name: "Kansas City, Kansas", cordinates: CLLocationCoordinate2D(latitude: 2, longitude: 2), order: 1)
        ]
    }
}


struct LocationCell: View {
    
    let location: RMLocation
    
    var body: some View {
        GroupBox {
            VStack {
                Text(location.name)
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                Text("lat: \(location.cordinates.latitude) lon: \(location.cordinates.longitude)")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .topLeading)

        }
        .overlay(alignment: .topTrailing) {
            if location.order == 0 {
                Label("Primary", systemImage: "checkmark.circle")
                    .labelStyle(.iconOnly)
                    .foregroundColor(.accentColor)
                    .padding([.vertical, .trailing], 10)
                    
                    
            }
        }
        .padding(.horizontal)

    }
}

struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        LocationCell(location: RMLocation.data().first!)
    }
}
