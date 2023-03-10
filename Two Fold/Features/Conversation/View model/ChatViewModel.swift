//
//  ChatViewModel.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 04/01/2023.
//

import Foundation
import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var lastMsgId: UUID = UUID()
    
    @Published var message: [Message] = [
        Message( text: "Hi there, β", received: true, timestamp: Date() + 2000),
        Message(text: "Oh hello, its been a while", received: false, timestamp: Date() + 120),
        Message(text: "Great how have you been? Me i have been greatπ€", received: false, timestamp: Date() + 120),
        Message(text: "love to hear that β€οΈ", received: false, timestamp: Date() + 120),
        Message(text: "Yeah thanks", received: false, timestamp: Date() + 1200),
        Message(text: "hmmm why the thanks? did i say something deserving?", received: true, timestamp: Date() + 120),
        Message(text: "You are strange πππ", received: true, timestamp: Date() + 120),
        Message(text: "π I just said it out of the blue", received: false, timestamp: Date() + 1220),
        Message(text: "But i bet you'll soon deserve the thanks", received: false, timestamp: Date() + 120),
        Message(text: "Oh yeah?", received: true, timestamp: Date()),


    ]
    
    func send() {
        message.append(Message(text: self.text, received: false, timestamp: .now))
        if let id  = message.last?.id {
            self.lastMsgId = id
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.message.append(Message(text: "Alright then π ", received: true, timestamp: .now + 3))
            
            if let id  = self.message.last?.id {
                self.lastMsgId = id
            }
        })
        
        
        
        self.text = ""
    }
}
