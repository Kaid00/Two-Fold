//
//  MessageBubble.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    var body: some View {
        HStack {
            VStack(alignment: message.received ? .leading : .trailing) {
                HStack {
                    if message.received {
                        VStack {
                            Image("user 1")
                                .resizable()
                                .scaledToFill()
                                .mask(Circle())
                                .frame(width: 25, height: 25)
                        }

                    }
                    Text(message.text)
                        .customFont(.body)
                        .padding(8)
                        .background(message.received ? Color(.gray).opacity(0.4) : Color("highlight 2"))
                        .cornerRadius(10, corners: message.received ? [.topLeft, .topRight, .bottomRight] : [.topLeft, .topRight, .bottomLeft])
                    
                    
                }
                .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
             
            }
            .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
            .padding(message.received ? .leading : .trailing , 10)
            
          
        }
        

    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: message[0])
    }
}
