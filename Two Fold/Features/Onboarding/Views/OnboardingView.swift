//
//  OnboardingView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 27/12/2022.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    @State var showSignIn: Bool = false
    @State var showSignUp: Bool = false

    
    var body: some View {
        ZStack {
            background
            
            content
                .offset(y: showSignIn || showSignUp ? -45: 0)
            
            Color("background")
                .opacity(showSignIn || showSignUp ? 0.5 : 0)
                .ignoresSafeArea()
            
            if showSignIn {
                SignInView()
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showSignIn = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        
                    )
                    .zIndex(1)
                    
                    
            }
            
            if showSignUp {
                SignUpView()
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showSignUp = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        
                    )
                    .zIndex(1)
            }
            

            
            
        }
        .preferredColorScheme(.dark)
        
    }
    
    
    var background: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()  
            
            RiveViewModel(fileName: "shapes").view()
                .ignoresSafeArea()
                .blur(radius: 50)
                .background (
                    Image("Spline")
                        .offset(x: 200, y: 100)
                        .blur(radius: 70)
                )
            
        }
    }
    
    
    var content: some View {
        
        VStack( spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Team match & Date")
                    .customFont(.largeTitle, 60)
                    .frame(width: 240, alignment: .leading)
                
                Text("Tired of swiping by yourself in dating apps? Team up with a single friend, see other teams that match your preferences, get in a group chat and plan your next double date.")
                    .customFont(.body)
                    .opacity(0.8)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            
            Spacer()
            
            HStack(spacing: 14) {
                Button {
                    withAnimation(.spring()) {
                        showSignUp = true
                    }
                } label: {
                    HStack() {
                        Text("Get started")
                            .customFont(.headline)
                        Spacer()
                        Image(systemName: "arrow.up.forward")
                    }
                }
                .foregroundColor(.white)
                .padding(.vertical, 20)
                .padding(.horizontal)
                .frame(maxWidth: 200)
                .background(
                    Color("highlight 2")
                )
                .mask(RoundedRectangle(cornerRadius: 20 , style: .continuous))
                .shadow(color: Color(.black).opacity(0.2), radius: 5, x: 0, y: 4)
                .shadow(color: Color(.black).opacity(0.1), radius: 5, x: 0, y: 7)
                
                Button {} label: {
                    Image("google")
                        .customSignUpOption()
                }
                
                Button {} label: {
                    Image("apple")
                        .customSignUpOption()
                    
                }
            }
            
            HStack {
                Text("Already have an account?")
                    .customFont(.callout)
                    .opacity(0.7)
                
                Button {
                    withAnimation(.spring()) {
                        showSignIn = true
                    }
                } label: {
                    Text("Sign in")
                        .foregroundColor(Color("highlight 2"))
                        .customFont(.headline)
                }
            }
            .padding(.top, 10)
            
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
        
    }
}
