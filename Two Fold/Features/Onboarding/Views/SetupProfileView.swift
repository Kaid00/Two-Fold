//
//  SetupProfileView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 03/01/2023.
//

import SwiftUI

struct SetupProfileView: View {
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                Text("Upload photo")
                    .customFont(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack {
                    Image("user 1")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 400, maxHeight: 400)

                    
                }
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                
                Text("Tap to change photo")
                    .customFont(.callout)
                    .padding()
                
                Spacer()
                
                Button {
                    
                } label: {
                    Label("Continue",systemImage: "arrow.right")
                        .customSubmitBtn()
                        .frame(maxWidth: 300)
                }
                Spacer()
            }
        }
        .preferredColorScheme(.dark)
        
    }
    
    
}

struct SetupProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SetupProfileView()
    }
}
