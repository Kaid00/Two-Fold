//
//  ChatCard.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import SwiftUI

struct ChatCard: View {

    var chat: Conversations

    
    var body: some View {
        HStack(spacing: 16) {
            Image(chat.profilePicture)
                .resizable()
                .scaledToFill()
                .mask(Circle())
                .frame(width: 70, height: 70)
                .overlay(content: {
                    Circle().stroke(Color("highlight 2"), lineWidth: 3)
                })
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(chat.teamName)
                        .customFont(.headline)
                        .layoutPriority(1)
                    Spacer()
                    Text("20min")
                        .foregroundColor(Color("highlight 2"))
                        .customFont(.headline)
                }
                
                HStack(spacing: 10) {
                    Text(chat.lastMsg)
                        .customFont(.callout)
                        .foregroundColor(.secondary)
                    Spacer()
                    if chat.numberUnreadMsgs >= 1 {
                        Text("\(chat.numberUnreadMsgs)")
                            .customFont(.subhead)
                            .layoutPriority(1)
                            .padding(7)
                            .background(Circle().fill(Color("highlight 2")))
                    }
                    
                }
            }
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .preferredColorScheme(.dark)
    }
}

struct ChatCard_Previews: PreviewProvider {
    static var previews: some View {
        ChatCard(chat: conversations[0])
    }
}
