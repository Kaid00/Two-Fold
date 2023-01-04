//
//  Conversations.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import Foundation

struct Conversations: Identifiable {
    var id = UUID()
    var teamName: String
    var lastMsg: String
    var lastMsgTimeSent: Date
    var numberUnreadMsgs: Int
    var profilePicture: String
    
}

var conversations: [Conversations] = [
    Conversations(teamName: "Joey & Julie", lastMsg: "Let's make pizza🤤. It's been so long", lastMsgTimeSent: Date.now, numberUnreadMsgs: 0, profilePicture: "Team 1"),
    Conversations(teamName: "Anabelle & Keren", lastMsg: "Oh yeah?", lastMsgTimeSent: Date.now, numberUnreadMsgs: 0, profilePicture: "Team 2"),
    Conversations(teamName: "Aria & Estelle", lastMsg: "Hey we are coming to Washington this week, lets plan a meetup. There's an Ariana grande concert on friday", lastMsgTimeSent: Date.now, numberUnreadMsgs: 2, profilePicture: "Team 3"),
    Conversations(teamName: "Nadesh & Selve", lastMsg: "Let's make pizza. It's been so long", lastMsgTimeSent: Date.now, numberUnreadMsgs: 0, profilePicture: "Team 4"),
    Conversations(teamName: "Selena & Vicky", lastMsg: "Let's make a holiday plan, its been long since we went on holidays and i am mad exhausted 😩", lastMsgTimeSent: Date.now, numberUnreadMsgs: 0, profilePicture: "Team 5"),
    Conversations(teamName: "Gaele & Rudy", lastMsg: "Are you guys brothers? you look so cute😍", lastMsgTimeSent: Date.now, numberUnreadMsgs: 6, profilePicture: "Team 6"),
    Conversations(teamName: "Elisa & Miles", lastMsg: "Let's GOOOO!!!😤", lastMsgTimeSent: Date.now, numberUnreadMsgs: 10, profilePicture: "Team 7"),
    Conversations(teamName: "Brittany & Veronica", lastMsg: "Oh really?", lastMsgTimeSent: Date.now, numberUnreadMsgs: 2, profilePicture: "Team 8"),

    
   
]
    
