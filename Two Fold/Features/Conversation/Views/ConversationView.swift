//
//  ConversationView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import SwiftUI

struct ConversationView: View {
    @State var search: String = ""
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack {
            
                HStack {
                    Text("Conversations")
                        .customFont(.title)
                    Spacer()
                    Image(systemName: "ellipsis")
                        .customFont(.headline, 22)
                }
                .padding()
                
                
                Spacer()
                
                ScrollView(showsIndicators: true) {
                    TextField("Search", text: $search)
                        .customTextField("magnifyingglass", true)
                        .padding(.horizontal)
                    ForEach(conversations) { chat in
                        ChatCard(chat: chat)
                        
                         Divider()
                             .padding(.horizontal)
                    }
                    
                }
               
                
                
                
                
            }
        }
        .preferredColorScheme(.dark)

    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
