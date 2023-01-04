//
//  SetupViewModel.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 04/01/2023.
//

import Foundation
import SwiftUI

class SetupViewModel: ObservableObject {
    @AppStorage("userSetupCompleted") var userSetupCompleted = false
    @Published var image: Image?

    
    @Published var interests: [String] = ["Dancing", "Cooking", "Sports", "Photography", "Music", "Politics", "Traveling", "Art", "Eating", "Sleeping", "Reading", "Writing", "Technology", "Design", "Coding", "Chess", "Coffee", "Vlogging", "Sketching", "TikTok"]
    @Published var userSelectedInterest: [String] = []
    
    @Published  var showPrompt: Bool = false
    @Published  var goToProfile: Bool = false
    @Published  var showingOptions = false
    @Published  var showImagePicker: Bool = false
    @Published  var showCamera: Bool = false
    @Published  var showPhotoPicker: Bool = false
    
    func setUp() {
        withAnimation {
            userSetupCompleted = true
        }
    }
}
