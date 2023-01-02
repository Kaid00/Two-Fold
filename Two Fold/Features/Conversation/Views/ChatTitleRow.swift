//
//  ChatTitleRow.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import SwiftUI

struct ChatTitleRow: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("Team 2")
                .resizable()
                .scaledToFill()
                .mask(Circle())
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text("Alvin & Eda")
                    .customFont(.title3)
                
                Text("Alvin, Eda, Karl, You")
                    .customFont(.footnote)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {} label: {
                Image(systemName: "video")
                    .foregroundColor(Color("highlight 2"))
                    .customChatIcon(24)
                
            }
            
            Button {} label: {
                Image(systemName: "phone")
                    .foregroundColor(Color("highlight 2"))
                    .customChatIcon(24)
            }
            
            
        }
        .padding()
        .preferredColorScheme(.dark)
    }
}

struct ChatTitleRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatTitleRow()
    }
}
