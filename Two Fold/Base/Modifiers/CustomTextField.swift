//
//  CustomTextField.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 28/12/2022.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    var imageName: String
    
    func body(content: Content) -> some View {
        
        content
            .foregroundColor(.black)
            .padding(15)
            .padding(.leading, 36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
            )
    }
}

extension View {
    func customTextField(_ imageName: String = "google") -> some View {
        modifier(CustomTextField(imageName: imageName))
   }

}
