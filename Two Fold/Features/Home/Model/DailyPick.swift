//
//  DailyPick.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import Foundation

struct DailyPick: Identifiable {
    var id = UUID()
    var teamName: String
    var profilePicture: String
    var location: String
    var teamPrompt: String
    
}


var dailyPick: [DailyPick] = [
    DailyPick(teamName: "Joey & Julie", profilePicture: "Team 1", location: "Washington, DC", teamPrompt: "Walk if you can't fly"),
    DailyPick(teamName: "Anabelle & Keren", profilePicture: "Team 2", location: "Dallas", teamPrompt: "If it ain't 130 degrees it isn't hot enough "),
    DailyPick(teamName: "Aria & Estelle", profilePicture: "Team 3", location: "Kansas", teamPrompt: "Swift and SwiftUI is the second coming of butter and bread"),
    DailyPick(teamName: "Nadesh & Selve", profilePicture: "Team 4", location: "New York", teamPrompt: "Expect to solve and algorithm problem on our date"),
    
]
