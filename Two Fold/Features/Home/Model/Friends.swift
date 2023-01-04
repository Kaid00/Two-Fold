//
//  Friends.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import Foundation

struct Friends: Identifiable {
    var id = UUID()
    var name: String
    var profilePic: String
}

let friends: [Friends] = [
    Friends(name: "Ari", profilePic: "user 1"),
    Friends(name: "William .A", profilePic: "user 2"),
    Friends(name: "Jammie .k", profilePic: "user 3"),
    Friends(name: "Brendell", profilePic: "user 4"),
    Friends(name: "Nicole .F", profilePic: "user 5"),
]
