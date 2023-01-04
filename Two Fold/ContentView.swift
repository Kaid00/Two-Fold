//
//  ContentView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 27/12/2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var dismissTabBar: Bool = false
    var body: some View {
        ZStack {
            switch selectedTab {
            case .home:
                HomeView()
            case .chat:
                ConversationView(dismissTabBar: $dismissTabBar)
            case .love:
                LoveView()
            case .user:
                ProfileView()
            }
            
            if !dismissTabBar {
                TabBar()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
