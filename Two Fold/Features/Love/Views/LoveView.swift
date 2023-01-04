//
//  LoveView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import SwiftUI

struct LoveView: View {
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastMatchCardIndex: Int = 1
    
    @State var matchCards: [MatchCard] = {
        var cards = [MatchCard]()
        for index in 0..<2 {
            cards.append(MatchCard(match: matches[index]))
        }
        
        
        return cards
    }()
    
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    
    private func removeCards() {
        matchCards.removeFirst()
        
        self.lastMatchCardIndex += 1
        let match = matches[lastMatchCardIndex % matches.count]
        let newMatchCards = MatchCard(match: match)
        matchCards.append(newMatchCards)
    }
    
    private func isTopCard(card: MatchCard) -> Bool {
        guard let index = matchCards.firstIndex(where: { $0.id == card.id}) else {
            return false
        }
        
        return index == 0
    }
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case.dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                HStack(spacing: 16) {
                    Image("Team 4")
                        .resizable()
                        .scaledToFill()
                        .mask(Circle())
                        .frame(width: 50, height: 50)
                    
                    Text("Jay & Glen")
                        .customFont(.title3)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                ZStack {
                    ForEach(matchCards) { card in
                        card
                            .zIndex(self.isTopCard(card: card) ? 1 : 0)
                            .overlay {
                                ZStack {
                                    Image(systemName: "x.circle.fill")
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white, .pink)
                                        .customFont(.headline, 70)
                                        .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(card: card) ? 1.0 : 0.0)
                                        .animation(.default, value: self.dragState.translation.width)

                                     
                                    Image(systemName: "heart.circle.fill")
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white, Color("highlight 2"))
                                        .customFont(.headline, 70)
                                        .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(card: card) ? 1.0 : 0.0)
                                        .animation(.default, value: self.dragState.translation.width)
                                }
                            }
                            .blur(radius: self.isTopCard(card: card) ? 0 : 1)
                            .overlay{
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(self.isTopCard(card: card) ? .black.opacity(0) : .black.opacity(0.4))
                                    .frame(maxWidth: 310, maxHeight: 520)
                            }
                            .offset(x: self.isTopCard(card: card) ?
                                    self.dragState.translation.width : 20,
                                    y: self.isTopCard(card: card) ?
                                    self.dragState.translation.height : -12)
                            .scaleEffect(self.dragState.isDragging && self.isTopCard(card: card) ? 0.9 : 1.0)
                            .animation(.default, value: self.dragState.isDragging)
                            .rotationEffect(Angle(degrees: self.isTopCard(card: card) ? Double(self.dragState.translation.width / 12) : 5))
                            .gesture(LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { (value, state, transaction) in
                                    switch value {
                                    case.first(true):
                                        withAnimation(.interpolatingSpring(stiffness: 120, damping: 120)) {
                                            state = .pressing
                                        }
                                    case .second(true, let drag):
                                        withAnimation(.interpolatingSpring(stiffness: 120, damping: 120)) {
                                            state = .dragging(translation: drag?.translation ?? .zero)

                                        }
                                    default:
                                        break
                                    }
                                    
                                })
                                    .onChanged({ (value) in
                                        guard case .second(true, let drag?) = value else {
                                            return
                                        }
                                        
                                        if drag.translation.width < -self.dragAreaThreshold {
                                            self.cardRemovalTransition = .leadingBottom
                                        }
                                        
                                        if drag.translation.width > self.dragAreaThreshold {
                                            self.cardRemovalTransition = .trailingBottom
                                        }
                                    })
                                    .onEnded( { (value) in
                                        guard case .second(true, let drag?) = value else {
                                            return
                                        }
                                        
                                        if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                            withAnimation() {
                                                self.removeCards()
                                            }
                                        }
                                    })
                            )
                            .transition(self.cardRemovalTransition.combined(with: .opacity))
                        
                    }
                }
                HStack(spacing: 40) {
                    Image(systemName: "x.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white, .pink)
                        .customFont(.headline, 60)
                    Text("👋")
                        .customFont(.headline, 40)
                    
                    Image(systemName: "heart.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white, Color("highlight 2"))
                        .customFont(.headline, 60)
                }
                .padding(.horizontal)
                
                Spacer(minLength: 20)


                
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct LoveView_Previews: PreviewProvider {
    static var previews: some View {
        LoveView()
    }
}
