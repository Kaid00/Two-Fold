//
//  SignInView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 28/12/2022.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    @ObservedObject var viewModel = OnboardingViewModel()
    @State var email: String = ""
    @State var password: String = ""
    @State var isLoading: Bool = false
    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
    let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Sign In")
                .customFont(.largeTitle)
            Text("Continue your pursuit for the dream double date match")
                .customFont(.headline)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .customTextField("envelope.fill", true)
                    .keyboardType(.emailAddress)
                
            }
            
            VStack(alignment: .leading) {
                Text("Password")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
                SecureField("", text: $password)
                    .customTextField("lock.fill", true)
            }
            
            Button {
                viewModel.signIn(confetti: confetti)
            } label: {
                Label("Sign in",systemImage: "arrow.right")
                    .customSubmitBtn()
            }
            
            Button {} label: {
                Text("Forgot your password?")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
            }
            
            HStack {
                Rectangle().frame(height: 1).opacity(0.1)
                Text("OR")
                    .customFont(.subhead)
                Rectangle().frame(height: 1).opacity(0.1)
            }
            
            Text("Sign in Google or Apple")
                .customFont(.subhead)
                .foregroundColor(.secondary)
            
            HStack(spacing: 24) {
                
                Button {} label: {
                    Image("google")
                        .customSignUpOption()
                }
                
                Button {} label: {
                    Image("apple")
                        .customSignUpOption()
                    
                }
            }
        }
        .customModal()
        .overlay{
            VStack {
                if viewModel.isLoading {
//                    check.view()
//                        .frame(width: 60, height: 60)
//                        .allowsHitTesting(false)
                    ProgressView()
                        .scaleEffect(1.4)
                        .allowsHitTesting(false)
                    
                    Spacer()
                }
                confetti.view()
                    .scaleEffect(2)
                    .allowsHitTesting(false)
                
                
            }
            
            
        }
        
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

