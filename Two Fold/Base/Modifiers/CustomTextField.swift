//
//  CustomTextField.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 28/12/2022.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    var imageName: String
    var isSystemImage: Bool?
    
    func body(content: Content) -> some View {
        
        content
            .foregroundColor(.black)
            .padding(15)
            .padding(.leading, 36)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay{
                ZStack {
                    if isSystemImage ?? false {
                        Image(systemName: imageName)
                            .customTextFieldIcon()
                            .opacity(0.6)
                    } else {
                        Image(imageName)
                            .customTextFieldIcon()
                    }
                }
              
                
            }
    }
}

extension View {
    func customTextField(_ imageName: String = "google", _ isSystemImage:Bool? = false) -> some View {
        modifier(CustomTextField(imageName: imageName, isSystemImage: isSystemImage))
   }

}



