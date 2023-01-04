//
//  UserProfileViewModel.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 04/01/2023.
//

import Foundation
import SwiftUI

class UserProfileViewModel: ObservableObject {
    @Published var image: Image?
    @Published var editingInterest: Bool = false

    @Published var interests: [String] = ["Dancing", "Design", "Coding", "Coffee", "Vlogging", "Sketching"]
    
    
    @Published  var showPrompt: Bool = false
    @Published  var goToProfile: Bool = false
    @Published  var showingOptions = false
    @Published  var showImagePicker: Bool = false
    @Published  var showCamera: Bool = false
    @Published  var showPhotoPicker: Bool = false
    
    
}
