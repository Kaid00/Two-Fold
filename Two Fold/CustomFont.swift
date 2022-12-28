//
//  CustomFont.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 28/12/2022.
//

import SwiftUI

struct CustomFont: ViewModifier {
    var textStyle: TextStyle
    var customSize: CGFloat?
    
    var name: String {
        switch textStyle {
        case .largeTitle:
            return "Poppins Bold"
        case .title:
            return "Poppins Bold"
        case .title2:
            return "Poppins Bold"
        case .title3:
            return "Poppins Bold"
        case .headline:
            return "Inter SemiBold"
        case .body:
            return "Inter Regular"
        case .callout:
            return "Inter Regular"
        case .subhead:
            return "Inter Regular"
        case .footnote:
            return "Inter Regular"
        case .caption:
            return "Inter Regular"
        case .caption2:
            return "Inter Regular"
        }
    }
    
    var size: CGFloat {
        if let Size = customSize {
            return Size
        }
        switch textStyle {
        case .largeTitle:
            return 34
        case .title:
            return 28
        case .title2:
            return 22
        case .title3:
            return 20
        case .headline:
            return 17
        case .body:
            return 17
        case .callout:
            return 16
        case .subhead:
            return 15
        case .footnote:
            return 13
        case .caption:
            return 12
        case .caption2:
            return 11
        }
    }
    
    var style: Font.TextStyle {
        switch textStyle {
        case .largeTitle:
            return .largeTitle
        case .title:
            return .title
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .headline:
            return .headline
        case .body:
            return .body
        case .callout:
            return .callout
        case .subhead:
            return .subheadline
        case .footnote:
            return .footnote
        case .caption:
            return .callout
        case .caption2:
            return .callout
        }
    }
    
    func body(content: Content) -> some View {
        content.font(.custom(name, size: size, relativeTo: style))
    }
}
 
extension View {
    func customFont(_ textStyle: TextStyle, _ customSize: CGFloat? = nil) -> some View {
        modifier(CustomFont(textStyle: textStyle, customSize: customSize))
    }
}


enum TextStyle {
    case largeTitle
    case title
    case title2
    case title3
    case headline
    case body
    case callout
    case subhead
    case footnote
    case caption
    case caption2
}
