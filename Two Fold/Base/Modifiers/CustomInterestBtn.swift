//
//  CustomInterestBtn.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 04/01/2023.
//

import SwiftUI

struct CustomInterestBtn: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .customFont(.headline, 18)
            .padding(.vertical, 16)
            .padding(.horizontal, 20)
            .background(
                Color(.darkGray).opacity(0.3)
            )
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
          
    }
}

extension View {
    func customInterestBtn() -> some View {
        modifier(CustomInterestBtn())
    }
}
