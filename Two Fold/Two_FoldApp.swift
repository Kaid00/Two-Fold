//
//  Two_FoldApp.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 27/12/2022.
//

import SwiftUI

@main
struct Two_FoldApp: App {
    
    @AppStorage("userAuthenticated") var userAuthenticated = false
    @AppStorage("userSetupCompleted") var userSetupCompleted = false
    
    var body: some Scene {
        WindowGroup {
            if !userAuthenticated {
                if !userSetupCompleted {
                    ContentView()
                } else {
                    PreferencesView()
                }
            } else {
                OnboardingView()
            }
         
        }
    }
}
