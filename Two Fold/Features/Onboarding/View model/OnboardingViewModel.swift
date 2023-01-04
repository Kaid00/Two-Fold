//
//  OnboardingViewModel.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 04/01/2023.
//

import Foundation
import SwiftUI
import RiveRuntime

class OnboardingViewModel: ObservableObject {
    @AppStorage("userAuthenticated") var userAuthenticated = false
    @Published var isLoading: Bool = false
  
    
    func signUp(confetti: RiveViewModel) {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.isLoading = false
            try? confetti.triggerInput("Trigger explosion")
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            withAnimation() {
                self.userAuthenticated = true
            }
        })
    }
    
    func signIn(confetti: RiveViewModel) {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.isLoading = false
            try? confetti.triggerInput("Trigger explosion")
            self.userAuthenticated = true
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            withAnimation() {
                self.userAuthenticated = true
            }
        })
    }
}
