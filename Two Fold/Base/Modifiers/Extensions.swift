//
//  Extensions.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 28/12/2022.
//
import SwiftUI


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}





extension Image {
    func customSignUpOption() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 28, height: 28)
            .padding()
            .background(Color(.white))
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color(.gray).opacity(0.2), radius: 5, x: 0, y: 4)
            .shadow(color: Color(.gray).opacity(0.1), radius: 5, x: 0, y: 7)
    }
    
    func customTextFieldIcon() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 26, height: 26)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            .foregroundColor(.black)
    }
}


// MARK: STRING ARRAY INDEX
extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}


extension AnyTransition {
    static var trailingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .trailing).combined(with: move(edge: .bottom)))
    }
    
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}


