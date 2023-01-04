//
//  MatchCard.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import SwiftUI

struct MatchCard: View, Identifiable {
    var id = UUID()
    var match: Matches
    var body: some View {
        VStack {
            Image(match.profilePic)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 310, maxHeight: 500)
            
        }
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay {
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text(match.teamName)
                        .customFont(.title)
                        .layoutPriority(1)
                        .frame(maxWidth: 250, alignment: .leading)
                                        
                    Text(match.location)
                        .customFont(.callout)
                    
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                .padding()
            }
            .background(.linearGradient(colors: [.black.opacity(0.3), .black.opacity(0)], startPoint: .bottom, endPoint: .top))
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
 
        }
        
    }
}

struct MatchCard_Previews: PreviewProvider {
    static var previews: some View {
        MatchCard(match: matches[0])
    }
}
