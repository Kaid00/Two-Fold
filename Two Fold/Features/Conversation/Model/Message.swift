//
//  Message.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import Foundation

struct Message: Identifiable,  Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}

var message: [Message] = [
    Message(id: "123443", text: "Hi there, ✋ nice to meet you", received: true, timestamp: Date() + 2000),
    Message(id: "123473", text: "Oh hello, its been a while", received: false, timestamp: Date() + 120),
    Message(id: "123423", text: "Great how have you been? Me i have been great🤓", received: false, timestamp: Date() + 120),
    Message(id: "123413", text: "love to hear that ❤️", received: false, timestamp: Date() + 120),
    Message(id: "126473", text: "Yeah thanks", received: false, timestamp: Date() + 1200),
    Message(id: "126443", text: "hmmm why the thanks? did i say something deserving?", received: true, timestamp: Date() + 120),
    Message(id: "123773", text: "You are strange 😂😂😂", received: true, timestamp: Date() + 120),
    Message(id: "123403", text: "😅 I just said it out of the blue", received: false, timestamp: Date() + 1220),
    Message(id: "113473", text: "But i bet you'll soon deserve the thanks", received: false, timestamp: Date() + 120),
    Message(id: "183473", text: "Oh yeah?", received: true, timestamp: Date()),


]
