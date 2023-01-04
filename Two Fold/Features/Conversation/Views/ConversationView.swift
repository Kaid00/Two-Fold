//
//  ConversationView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import SwiftUI

struct ConversationView: View {
    @ObservedObject var viewModel = ConversationViewModel()
    @State var openChat: Bool = false
    @Binding var dismissTabBar: Bool
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            if openChat {
                ChatView(openChat: $openChat, dismissTabBar: $dismissTabBar)
                    .transition(.move(edge: .trailing).combined(with: .opacity))

            } else {
                content
                    .transition(.move(edge: .leading).combined(with: .opacity))
            }

        }
        .preferredColorScheme(.dark)

    }
    
    var content: some View {
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

                HStack {
                    TextField("", text: $viewModel.search)
                        .customFont(.body)
                        .padding(6)
                        .padding(.leading, 30)
                        .background(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke()
                                .opacity(0.1)
                        })
                        .overlay(content: {
                            Image(systemName: "magnifyingglass")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 5)
                                .foregroundColor(.secondary)
                        })
                    
                    Image(systemName: "line.3.horizontal.decrease")
                        .foregroundColor(Color("highlight 2"))
                        .padding(.leading, 10)
                }
                .padding(.horizontal)
                
                ForEach(conversations) { chat in
                    ChatCard(chat: chat)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)){
                                openChat = true
                                dismissTabBar = true
                            }
                        }
                    
                     Divider()
                         .padding(.horizontal)
                }
                
            }
           
            
            
            
            
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView(dismissTabBar: .constant(false))
    }
}
