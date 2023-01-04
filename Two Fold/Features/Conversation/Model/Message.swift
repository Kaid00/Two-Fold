//
//  Message.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import Foundation

struct Message: Identifiable,  Codable {
    var id = UUID()
    var text: String
    var received: Bool
    var timestamp: Date
}

var message: [Message] = [
    Message( text: "Hi there, ✋ nice to meet you", received: true, timestamp: Date() + 2000),
    Message(text: "Oh hello, its been a while", received: false, timestamp: Date() + 120),
    Message(text: "Great how have you been? Me i have been great🤓", received: false, timestamp: Date() + 120),
    Message(text: "love to hear that ❤️", received: false, timestamp: Date() + 120),
    Message(text: "Yeah thanks", received: false, timestamp: Date() + 1200),
    Message(text: "hmmm why the thanks? did i say something deserving?", received: true, timestamp: Date() + 120),
    Message(text: "You are strange 😂😂😂", received: true, timestamp: Date() + 120),
    Message(text: "😅 I just said it out of the blue", received: false, timestamp: Date() + 1220),
    Message(text: "But i bet you'll soon deserve the thanks", received: false, timestamp: Date() + 120),
    Message(text: "Oh yeah?", received: true, timestamp: Date()),


]
