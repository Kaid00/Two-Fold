//
//  PreferencesView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 29/12/2022.
//

import SwiftUI

struct PreferencesView: View {
    @ObservedObject var viewModel = SetupViewModel()
    @State private var image: Image?
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                
                HStack {
                    if viewModel.goToProfile {
                        Button {
                            withAnimation {
                                viewModel.goToProfile = false
                            }
                        } label: {
                            Label("Back",systemImage: "arrow.left")
                                .foregroundColor(Color("highlight 2"))
                                .customFont(.headline)
                                .padding(.leading, 20)
                        }
                        
                    }
                    
                    ProgressDots
                }
                
                ZStack {
                    if viewModel.goToProfile {
                        Profile
                            .transition(.move(edge: .trailing).combined(with: .opacity))
                    } else {
                        Preference
                            .transition(.move(edge: .leading).combined(with: .opacity))
                        
                    }
                }
                
                
            }
            
        }
        .preferredColorScheme(.dark)
    }
    
    // MARK: - PROGRESS DOTS

    var ProgressDots: some View {
        HStack(spacing: 10){
            if !viewModel.goToProfile {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 24, height: 10)
                
                    .transition(.move(edge: .trailing))
                
            }
            
            Group {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 10, height: 10)
                
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 10, height: 10)
            }
            .foregroundColor(.gray.opacity(0.3))
            .animation(.default, value: viewModel.goToProfile)
            .transition(.move(edge: .leading))
            
            if viewModel.goToProfile {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 24, height: 10)
                    .transition(.move(edge: .leading))
                
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding()
    }
    
    // MARK: - PREFERENCE

    var Preference: some View {
        VStack(spacing: 20) {
            Text("Choose your interest")
                .customFont(.largeTitle, 45)
                .layoutPriority(1)
                .frame(maxWidth: 320, alignment: .leading)
            
            Spacer()
            
            VStack(spacing: 22) {
                PreferenceScroll(interests: viewModel.interests, userSelectedInterest: $viewModel.userSelectedInterest)
                
                PreferenceScroll(interests: viewModel.interests, userSelectedInterest: $viewModel.userSelectedInterest, range: 5..<10, highlight: .highlight4)
                
                PreferenceScroll(interests: viewModel.interests, userSelectedInterest: $viewModel.userSelectedInterest, range: 10..<15, highlight: .highlight1)
                
                PreferenceScroll(interests: viewModel.interests, userSelectedInterest: $viewModel.userSelectedInterest, range: 15..<viewModel.interests.count, highlight: .highlight3)
                
            }
            
            Spacer()
            
            Button {
                if viewModel.userSelectedInterest.count < 3 {
                    withAnimation(){
                        viewModel.showPrompt = true
                    }
                } else {
                    withAnimation(.easeInOut(duration: 0.2)){
                        viewModel.goToProfile.toggle()
                    }
                }
                
            } label: {
                Label("Continue",systemImage: "arrow.right")
                    .customSubmitBtn()
                    .frame(maxWidth: 200)
            }
            .onChange(of: viewModel.userSelectedInterest, perform: { minimum in
                if viewModel.showPrompt && viewModel.userSelectedInterest.count > 2 {
                    withAnimation() {
                        viewModel.showPrompt.toggle()
                    }
                }
                
            })
            
            if viewModel.showPrompt {
                Text("Please choose a minimum of 3 interest")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    // MARK: - PROFILE
    
    var Profile: some View {
        ZStack {
            Color("background")
            VStack(spacing: 10) {
                
                Text("Upload photo")
                    .customFont(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack {
                    
                    image?
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 380, maxHeight: 380)
                        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    
                    if image == nil {
                        VStack {
                            Image(systemName: "person.fill")
                                .customFont(.title, 100)
                                
                        }
                        .frame(width: 200, height: 200)
                        .background(.regularMaterial)
                        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .overlay {
                            Image(systemName: "camera.circle.fill")
                                .customFont(.title, 60)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(Color("highlight 2"), .white)
                                .shadow(color: .black.opacity(1), radius: 2)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                .offset(x: 30)
                        }
                    }
                    
                }
                .onTapGesture {
                    viewModel.showingOptions = true
                }
                
                if image == nil {
                    Text("Select or take profile photo")
                        .customFont(.callout)
                        .padding()
                    
                } else {
                    Text("Tap to change photo")
                        .customFont(.callout)
                        .padding()
                    
                }
              
                Spacer()
                
                Button {
                    withAnimation {
                        viewModel.userSetupCompleted = true
                    }
                } label: {
                    Label("Continue",systemImage: "arrow.right")
                        .customSubmitBtn()
                        .frame(maxWidth: 200)
                }
            }
            .sheet(isPresented: $viewModel.showImagePicker) {
                SUImagePickerView(sourceType: self.viewModel.showCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$viewModel.showImagePicker) }
            .confirmationDialog("Upload a profile photo", isPresented: $viewModel.showingOptions, titleVisibility: .visible) {
                Button("Take Photo") {
                    self.viewModel.showImagePicker = true
                    self.viewModel.showCamera = true
                }
                
                Button("Choose Photo") {
                    self.viewModel.showImagePicker = true
                    self.viewModel.showCamera = false
                    
                }
            }
            
        }
        
        
    }
    
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}

// MARK: - PREFERENCE SCROLL

struct PreferenceScroll: View {
    var interests: [String]
    @Binding var userSelectedInterest: [String]
    var range: Range<Int> = 0..<5
    var highlight: Highlight = .highlight2
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 14) {
                ForEach(range, id: \.self) { item in
                    Text(interests[item])
                        .preferenceBtn(userSelectedInterest, interests[item], highlight)
                        .onTapGesture {
                            preferenceToggle(userSelectedInterest, interests[item])
                        }
                }
            }
        }
    }
    
    
    func preferenceToggle(_ userSelectedInterest: [String], _ userInterest: String) {
        if userSelectedInterest.contains(userInterest) {
            self.userSelectedInterest.removeAll(where: { $0 == userInterest })
        } else {
            self.userSelectedInterest.append(userInterest)
        }
    }
}
