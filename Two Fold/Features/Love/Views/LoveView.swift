//
//  LoveView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import SwiftUI

struct LoveView: View {
    @GestureState private var dragState = DragState.inactive
    @ObservedObject private var viewModel = LoveViewModel()
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                HStack(spacing: 16) {
                    Image(viewModel.teamProfile)
                        .resizable()
                        .scaledToFill()
                        .mask(Circle())
                        .frame(width: 50, height: 50)
                    
                    Text(viewModel.teamName)
                        .customFont(.title3)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                ZStack {
                    ForEach(viewModel.matchCards) { card in
                        card
                            .zIndex(viewModel.isTopCard(card: card) ? 1 : 0)
                            .overlay {
                                ZStack {
                                    Image(systemName: "x.circle.fill")
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white, .pink)
                                        .customFont(.headline, 70)
                                        .opacity(self.dragState.translation.width < -viewModel.dragAreaThreshold && viewModel.isTopCard(card: card) ? 1.0 : 0.0)
                                        .animation(.default, value: self.dragState.translation.width)

                                     
                                    Image(systemName: "heart.circle.fill")
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white, Color("highlight 2"))
                                        .customFont(.headline, 70)
                                        .opacity(self.dragState.translation.width > viewModel.dragAreaThreshold && viewModel.isTopCard(card: card) ? 1.0 : 0.0)
                                        .animation(.default, value: self.dragState.translation.width)
                                }
                            }
                            .blur(radius: viewModel.isTopCard(card: card) ? 0 : 1)
                            .overlay{
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(viewModel.isTopCard(card: card) ? .black.opacity(0) : .black.opacity(0.4))
                                    .frame(maxWidth: 310, maxHeight: 520)
                            }
                            .offset(x: viewModel.isTopCard(card: card) ?
                                    self.dragState.translation.width : 20,
                                    y: viewModel.isTopCard(card: card) ?
                                    self.dragState.translation.height : -12)
                            .scaleEffect(self.dragState.isDragging && viewModel.isTopCard(card: card) ? 0.9 : 1.0)
                            .animation(.default, value: self.dragState.isDragging)
                            .rotationEffect(Angle(degrees: viewModel.isTopCard(card: card) ? Double(self.dragState.translation.width / 12) : 5))
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
                                        
                                        if drag.translation.width < -viewModel.dragAreaThreshold {
                                            viewModel.cardRemovalTransition = .leadingBottom
                                        }
                                        
                                        if drag.translation.width > viewModel.dragAreaThreshold {
                                            viewModel.cardRemovalTransition = .trailingBottom
                                        }
                                    })
                                    .onEnded( { (value) in
                                        guard case .second(true, let drag?) = value else {
                                            return
                                        }
                                        
                                        if drag.translation.width < -viewModel.dragAreaThreshold || drag.translation.width > viewModel.dragAreaThreshold {
                                            withAnimation() {
                                                viewModel.removeCards()
                                            }
                                        }
                                    })
                            )
                            .transition(viewModel.cardRemovalTransition.combined(with: .opacity))
                        
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
