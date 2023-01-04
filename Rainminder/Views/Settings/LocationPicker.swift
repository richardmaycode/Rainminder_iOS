//
//  PrimaryLocationPicker.swift
//  Rainminder
//
//  Created by Richard Wise on 1/3/23.
//

import SwiftUI

struct LocationPicker: View {
    
    @Binding var locations: [RMLocation]
    
    // TODO: implement city search similar to Apple Weather
    
    var body: some View {
        List {
            
            ForEach(RMLocation.data()) {location in
                LocationCell(location: location)
            }
            .onMove { from, to in
                
            }
            .onDelete { item in
                
            }
        }
        .listStyle(.plain)
        .navigationTitle("Locations")
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                EditButton()
                
                Button {
                    
                } label: {
                    Label("Add Location", systemImage: "plus.circle")
                }

            }
        }
    }
}

struct PrimaryLocationPicker_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LocationPicker(locations: .constant(RMLocation.data()))
        }
    }
}
