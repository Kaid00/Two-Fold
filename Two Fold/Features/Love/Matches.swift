//
//  Matches.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import Foundation

struct Matches: Identifiable {
    var id = UUID()
    var teamName: String
    var profilePic: String
    var teamPrompt: String
    var location: String
    
}

var matches: [Matches] = [
    Matches(teamName: "Joey & Julie", profilePic: "Team 5", teamPrompt: "Walk if you can't fly", location: "Washington, DC"),
    Matches(teamName: "Anabelle & Keren", profilePic: "Team 6", teamPrompt: "If it ain't 130 degrees it isn't hot enough ", location: "Washington, DC"),
    Matches(teamName: "Aria & Estelle", profilePic: "Team 7", teamPrompt: "Swift and SwiftUI is the second coming of butter and bread", location: "Washington, DC"),
    Matches(teamName: "Nadesh & Selve", profilePic: "Team 8", teamPrompt: "Code is way better than buttered bread", location: "Oklahoma"),
    Matches(teamName: "Silvie & Julie", profilePic: "Team 9", teamPrompt: "Expect to solve and algorithm problem on our date", location: "New York"),


]

