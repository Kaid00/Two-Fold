//
//  CustomChatIcons.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import SwiftUI

struct CustomChatIcons: ViewModifier {
    var size: CGFloat?
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("highlight 2"))
            .customFont(.headline, size)
        
    }
}


extension View {
    func customChatIcon(_ size: CGFloat? = 20) -> some View {
        modifier(CustomChatIcons(size: size))
    }
}
