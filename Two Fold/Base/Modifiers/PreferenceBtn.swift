//
//  PreferenceBtn.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 29/12/2022.
//

import SwiftUI

struct PreferenceBtn: ViewModifier {
    var userSelectedInterest: [String]
    var userInterest: String
    var highlight: Highlight?

    
    var selected: Color {
        switch highlight {
        case .highlight1:
            return Color("highlight 1")
        case .highlight2:
            return Color("highlight 2")
        case .highlight3:
            return Color("highlight 3")
        case .highlight4:
            return Color("highlight 4")
        case .none:
            return Color("highlight 2")

        }
    }
    
    func body(content: Content) -> some View {
        content
            .customFont(.title3, 18)
            .foregroundColor(userSelectedInterest.contains(userInterest) ? Color("background") : .white)
            .padding(.vertical, 22)
            .padding(.horizontal, 30)
            .background(
                userSelectedInterest.contains(userInterest) ? selected :
                    Color(.darkGray).opacity(0.3)
            )
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}


extension View {
    func preferenceBtn(_ userSelectedInterest: [String], _ userInterest: String, _ highlight: Highlight? = .highlight2) -> some View {
        modifier(PreferenceBtn(userSelectedInterest: userSelectedInterest, userInterest: userInterest, highlight: highlight))
    }
}

enum Highlight {
    case highlight1
    case highlight2
    case highlight3
    case highlight4

}
