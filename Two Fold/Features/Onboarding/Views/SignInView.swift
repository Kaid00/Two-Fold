//
//  SignInView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 28/12/2022.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Sign In")
                .customFont(.largeTitle)
            Text("You are moments away from a dream double date")
                .customFont(.headline)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .customTextField("google")
                    .keyboardType(.emailAddress)
 
                
            }
            
            VStack(alignment: .leading) {
                Text("Password")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
                SecureField("", text: $password)
                    .customTextField("apple")
                
            }
            
            Button {} label: {
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
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

