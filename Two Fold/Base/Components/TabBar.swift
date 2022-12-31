//
//  TabBar.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 29/12/2022.
//

import SwiftUI
import RiveRuntime

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home

    var body: some View {
        VStack {
            Spacer()
            HStack {
                ForEach(tabItems) { item in
                    Button {
                        try? item.icon.setInput("active", value: true)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            try? item.icon.setInput("active", value: false)
                        })
                        
                        withAnimation() {
                            selectedTab = item.tab
                        }
                    } label: {
                        item.icon.view()
                            .frame(height: 40)
                            .opacity(selectedTab == item.tab ? 1 : 0.5)
                            .background(
                                VStack {
                                    Spacer()
                                    Circle()
                                        .fill(.white.opacity(selectedTab == item.tab ? 1 : 0))
                                        .frame(width: 5, height: 5)
                                        .offset(y: 12)
                                }
                            
                            )
                    }
                }
            }
            .padding(12)
            .background(Color("background"))
            .background(.regularMaterial)
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}


struct TabItem: Identifiable {
    var id = UUID()
    var icon: RiveViewModel
    var tab: Tab
}

var tabItems: [TabItem] = [
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), tab: .home),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), tab: .chat),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), tab: .love),
    TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"), tab: .user),
]

enum Tab: String {
    case home
    case chat
    case love
    case user
}
