//
//  DailyPickCard.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import SwiftUI

struct DailyPickCard: View {
    var dailyPick: DailyPick
    
    var body: some View {
        VStack {
            Image(dailyPick.profilePicture)
                .resizable()
                .scaledToFill()
                .frame(width: 220, height: 350)
            
        }
        .background(.white)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .overlay {
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text(dailyPick.teamName)
                        .customFont(.title3, 18)
                        .layoutPriority(1)
                    
                    Text(dailyPick.location)
                        .customFont(.caption)
                    
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

struct DailyPickCard_Previews: PreviewProvider {
    static var previews: some View {
        DailyPickCard(dailyPick: dailyPick[0])
    }
}
