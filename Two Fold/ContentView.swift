//
//  ContentView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 27/12/2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    var body: some View {
        ZStack {
            switch selectedTab {
            case .home:
                HomeView()
            case .chat:
                Text("chat")
            case .love:
                Text("love")
            case .user:
                Text("user")
            }
            
            TabBar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
