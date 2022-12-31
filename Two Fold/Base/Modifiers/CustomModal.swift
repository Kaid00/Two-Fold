//
//  CustomModal.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 29/12/2022.
//

import SwiftUI

struct CustomModal: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(30)
            .background(.regularMaterial)
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
            .shadow(color: .black.opacity(0.1), radius: 30, x: 0, y: 30)
            .padding()
            .preferredColorScheme(.dark)
    }
}

extension View {
    func customModal() -> some View {
        modifier(CustomModal())
    }
}

