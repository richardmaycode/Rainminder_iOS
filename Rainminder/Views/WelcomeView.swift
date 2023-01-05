//
//  WelcomeView.swift
//  Rainminder
//
//  Created by Richard Wise on 1/5/23.
//

import SwiftUI

struct WelcomeItem: Identifiable {
    let id = UUID()
    let title: String
    let body: String
    let icon: String
    let bgColor: Color
    
    static let data: [WelcomeItem] = [
        WelcomeItem(title: "Do Stuff", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", icon: "drop.keypad.rectangle.fill", bgColor: .purple),
        WelcomeItem(title: "Watch Stuff", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", icon: "binoculars.fill", bgColor: .orange),
        WelcomeItem(title: "Get Reminders", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", icon: "envelope.badge", bgColor: .pink)
    ]
}


struct WelcomeView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            
            Spacer()
            title
                
            Spacer()
            
            ForEach(WelcomeItem.data) { item in
                welcomeRow(for: item)
            }
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                Text("Get Started")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
            }
            .buttonStyle(.borderedProminent)
            .tint(.teal)
            .padding()

        }
    }
    
    @ViewBuilder
    func welcomeRow(for welcomeItem: WelcomeItem) -> some View {
        GeometryReader { proxy in
            HStack {
                
                Image(systemName: welcomeItem.icon)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .frame(maxWidth: proxy.size.width / 3, maxHeight: .infinity, alignment: .center)
                    .background {
                        Circle()
                            .fill(welcomeItem.bgColor.opacity(0.6))
                            .padding()
                            
                    }
                VStack(spacing: 10) {
                    Text(welcomeItem.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                    Text(welcomeItem.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: (proxy.size.width / 3) * 2)
            }
            
        }
        .frame(maxHeight: 100)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    var title: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(maxWidth: .infinity, maxHeight: 2)
            .padding(.horizontal, 30)
        HStack {
            Image(systemName: "drop.circle.fill")
                .foregroundColor(.teal)
            Text("Rainminder")
        }
        .font(.system(size: 44, weight: .semibold, design: .rounded))
        RoundedRectangle(cornerRadius: 5)
            .frame(maxWidth: .infinity, maxHeight: 2)
            .padding(.horizontal, 30)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
