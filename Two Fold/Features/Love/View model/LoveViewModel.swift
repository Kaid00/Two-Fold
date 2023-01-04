//
//  LoveViewModel.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 04/01/2023.
//

import Foundation
import SwiftUI

class LoveViewModel: ObservableObject {
    
    @Published var lastMatchCardIndex: Int = 1
    @Published var dragAreaThreshold: CGFloat = 65.0
    @Published var cardRemovalTransition = AnyTransition.trailingBottom
    @Published var teamName: String = "Vanelle & me"
    @Published var teamProfile: String = "Team 4"
    
    @Published var matchCards: [MatchCard] = {
        var cards = [MatchCard]()
        for index in 0..<2 {
            cards.append(MatchCard(match: matches[index]))
        }
        
        
        return cards
    }()
    
    func removeCards() {
        matchCards.removeFirst()
        self.lastMatchCardIndex += 1
        let match = matches[lastMatchCardIndex % matches.count]
        let newMatchCards = MatchCard(match: match)
        matchCards.append(newMatchCards)
    }
    
    func isTopCard(card: MatchCard) -> Bool {
        guard let index = matchCards.firstIndex(where: { $0.id == card.id}) else {
            return false
        }
        
        return index == 0
    }
    
}
