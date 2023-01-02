//
//  ChatView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import SwiftUI

struct ChatView: View {
    @State var text: String = ""
    @State var showSendIcon: Bool = false
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack(spacing: 0) {
                VStack{
                    ChatTitleRow()
                        .background(Color("background"))
                    
                    ScrollView(showsIndicators: true) {
                        ForEach(message) { message in
                            MessageBubble(message: message)
                        }
                        
                    }
                    .padding(.top, 10)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                    
                }
                
                inputRow
                
            }
      
        }
    }
    
    var inputRow: some View {
        HStack(spacing: 12) {
            Image(systemName: "plus")
                .customChatIcon(22)
            
            if #available(iOS 16.0, *) {
                TextField("", text: $text, axis: .vertical)
                    .customFont(.body)
                    .lineLimit(6)
                    .padding(5)
                    .background(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke()
                            .opacity(0.1)
                    })
            } else {
                TextField("", text: $text)
                    .customFont(.body)
                    .padding(5)
                    .background(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke()
                            .opacity(0.1)
                    })
                
            }
            
            
            if showSendIcon {
                Image(systemName: "paperplane.circle.fill")
                    .customChatIcon(24)
                    .transition(.move(edge: .leading).combined(with: .opacity))
                
            } else {
                
                Image(systemName: "camera")
                    .customChatIcon(22)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                
                Image(systemName: "mic")
                    .customChatIcon(22)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                
            }
            
        }
        .padding(.horizontal, 12)
        .padding(.top, 10)
        .background(Color("background"))
        .onChange(of: text, perform: { _ in
            if text.isEmpty {
                withAnimation{
                    showSendIcon = false
                }
            } else {
                withAnimation{
                    showSendIcon = true
                }
            }
        })

    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
