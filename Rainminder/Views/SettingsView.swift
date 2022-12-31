//
//  SettingsView.swift
//  Rainminder
//
//  Created by Richard Wise on 12/31/22.
//

import SwiftUI

struct SettingsView: View {
    
    @State var sound: Bool = true
    @State var haptics: Bool = true
    
    var body: some View {
        VStack {
            
            
            
            List {
                
                pro
                
                cosmetics
                general
                getInTouch
                other
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var pro: some View {
        NavigationLink {
            Text("Pro")
        } label: {
            Label("Pro", systemImage: "drop")
        }

    }
    
    var cosmetics: some View {
        Section {
            NavigationLink {
                Text("Accents")
            } label: {
                Label("Accents", systemImage: "paintpalette")
            }
            
            NavigationLink {
                Text("App Icons")
            } label: {
                Label("App Icons", systemImage: "square.grid.2x2.fill")
            }
            
        } header: {
            Text("Cosmetics")
        }
    }
    
    var general: some View {
        Section {
            LabeledContent {
                Toggle("", isOn: $sound)
            } label: {
                Label("Sound", systemImage: "music.note")
            }
            LabeledContent {
                Toggle("", isOn: $sound)
            } label: {
                Label("Haptics", systemImage: "directcurrent")
            }
            
            NavigationLink {
                Text("Cloud Backups")
            } label: {
                Label("Backups", systemImage: "cloud.fill")
            }


        } header: {
            Text("General")
        }
    }
    
    
    var getInTouch: some View {
        Section {
            
            Link(destination: URL(string: "mailto:richard.wise@hey.com")!) {
                LabeledContent {
                    Image(systemName: "line.diagonal.arrow")
                } label: {
                    Label("Email", systemImage: "envelope")
                }
            }
            .buttonStyle(.plain)
            
            Link(destination: URL(string: "https://www.twitter.com/richardmaycode")!) {
                LabeledContent {
                    Image(systemName: "line.diagonal.arrow")
                } label: {
                    Label("Twitter", systemImage: "bubble.right.fill")
                }
            }
            .buttonStyle(.plain)
            
            LabeledContent {
                Image(systemName: "line.diagonal.arrow")
            } label: {
                Label("Rate in AppStore", systemImage: "star.fill")
            }
            
            NavigationLink {
                Text("Tip Jar")
            } label: {
                Label("Tip Jar", systemImage: "dollarsign.circle.fill")
            }

            
            
        } header: {
            Text("Get in touch")
        }
    }
    
    var other: some View {
        Section {
            NavigationLink {
                Text("Credits")
            } label: {
                Label("Credits", systemImage: "text.aligncenter")
            }
            
            NavigationLink {
                Text("Privacy Policy")
            } label: {
                Label("Privacy Policy", systemImage: "doc.text")
            }

        } header: {
            Text("Other")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingsView()
        }
    }
}
