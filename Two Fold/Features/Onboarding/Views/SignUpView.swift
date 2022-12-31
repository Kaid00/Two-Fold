//
//  SignUpView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 29/12/2022.
//

import SwiftUI

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""

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
    }
    
    
    var form: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                Text("Email")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
                TextField("", text: $email)
                    .customTextField("google")
                    .keyboardType(.emailAddress)
                
            }
            
            VStack(alignment: .leading) {
                Text("Name")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
                TextField("", text: $name)
                    .customTextField("google")
                    .keyboardType(.namePhonePad)

                
            }
            
            VStack(alignment: .leading) {
                Text("Password")
                    .customFont(.subhead)
                    .foregroundColor(.secondary)
                SecureField("", text: $password)
                    .customTextField("apple")
                
            }
            
            Button {} label: {
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
