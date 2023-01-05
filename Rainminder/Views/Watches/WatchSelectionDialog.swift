//
//  WatchSelectionDialog.swift
//  Rainminder
//
//  Created by Richard Wise on 1/4/23.
//

import SwiftUI

struct WatchSelectionDialog: View {
    
    let watch: Watch
    let onEdit: (() -> Void)?
    
    var body: some View {
        VStack {
            
            HStack {
                Text(watch.name)
                    .font(.title)
                Spacer()
                Image(systemName: "bell")
                    .symbolVariant(watch.notifies ? .fill : .slash)
            }
            .padding(.vertical)
            
            Grid(horizontalSpacing: 8) {
                GridRow {
                    ForEach(watch.watchDays) { day in
                        WatchDayDisplay(day: day)
                    }
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
            }
            .frame(minHeight: 35)
            
            HStack {
                Button {
                    onEdit?()
                } label: {
                    Text("Edit")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding(10)
                }
                .buttonStyle(.borderedProminent)
                
                ShareLink(item: watch.name) {
                    Label("Share", systemImage: "square.and.arrow.up")
                        .font(.title2.bold())
                        .labelStyle(.iconOnly)
                        .padding(10)
                        .foregroundColor(.yellow)
                }
                .buttonStyle(.borderedProminent)
                .tint(.yellow.opacity(0.3))
                
                Button {
                    // Delete Action
                } label: {
                    Label("Delete", systemImage: "trash")
                        .font(.title2)
                        .labelStyle(.iconOnly)
                        .padding(10)
                        .foregroundColor(.red)
                }
                .buttonStyle(.borderedProminent)
                .tint(.red.opacity(0.3))
                
                
            }
            .padding(.vertical)
            Spacer()
        }
        .padding()
    }
}

struct WatchSelectionDialog_Previews: PreviewProvider {
    static var previews: some View {
        WatchSelectionDialog(watch: Watch.data.first!, onEdit: {})
    }
}
