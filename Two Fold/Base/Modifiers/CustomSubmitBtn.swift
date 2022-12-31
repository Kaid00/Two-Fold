//
//  CustomSubmitBtn.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 29/12/2022.
//

import SwiftUI

struct CustomSubmitBtn: ViewModifier {
    func body(content: Content) -> some View {
        content
            .customFont(.headline)
            .foregroundColor(.white)
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color("highlight 2"))
            .cornerRadius(20, corners: [.topRight, .bottomRight, .bottomLeft])
            .cornerRadius(6, corners: .topLeft)
            .shadow(color: Color("highlight 2").opacity(0.5), radius: 20, x: 0, y: 5)
    }
}


extension View {
    func customSubmitBtn() -> some View {
        modifier(CustomSubmitBtn())
    }
}
