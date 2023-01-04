//
//  SignUpView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 29/12/2022.
//

import SwiftUI
import RiveRuntime

struct SignUpView: View {
    @ObservedObject var viewModel = OnboardingViewModel()
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var isLoading: Bool = false

    let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")


    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up")
                .customFont(.largeTitle)
            Text("You are moments away from a dream double date")
                .customFont(.headline)
                .multilineTextAlignment(.center)
            
            form
            
            HStack {
                Rectangle().frame(height: 1).opacity(0.1)
                Text("OR")
                    .customFont(.subhead)
                Rectangle().frame(height: 1).opacity(0.1)
            }
            
            Text("Sign up with Google or Apple")
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
        .overlay {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .allowsHitTesting(false)
                    
                    Spacer()
                }
                
                confetti.view()
                    .scaleEffect(2)
                    .allowsHitTesting(false)
                
            }
            
            
        }
    }
    
    
    var form: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .customTextField("envelope.fill", true)
                    .keyboardType(.emailAddress)
                
            }
            
            VStack(alignment: .leading) {
                Text("Name")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
                TextField("", text: $name)
                    .customTextField("person.fill", true)
                    .keyboardType(.namePhonePad)

                
            }
            
            VStack(alignment: .leading) {
                Text("Password")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
                SecureField("", text: $password)
                    .customTextField("lock.fill", true)
                
            }
            
            Button {
                viewModel.signUp(confetti: confetti)
            } label: {
                Label("Sign up",systemImage: "arrow.right")
                    .customSubmitBtn()
            }
        }
        
    }
    
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
