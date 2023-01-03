//
//  PrimaryLocationPicker.swift
//  Rainminder
//
//  Created by Richard Wise on 1/3/23.
//

import SwiftUI

struct PrimaryLocationPicker: View {
    
    @Binding var primaryLocation: String
    
    let locations: [String] = [
        "Parkland, FL",
        "Kansas City, KS",
        "Atlanta, GA"
    ]
    
    // TODO: implement city search similar to Apple Weather
    
    var body: some View {
        VStack {
            Picker("locations", selection: $primaryLocation) {
                ForEach(locations, id: \.self) { location in
                    Text(location)
                }
            }
            .pickerStyle(.inline)
        }
    }
}

struct PrimaryLocationPicker_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryLocationPicker(primaryLocation: .constant("Parkland, FL"))
    }
}
