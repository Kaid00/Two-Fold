//
//  ProfileView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 03/01/2023.
//

import SwiftUI

struct ProfileView: View {
    var interests: [String] = ["Dancing", "Design", "Coding", "Coffee", "Vlogging", "Sketching"]
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Profile")
                        .customFont(.title)
                    Spacer()
                    
                    Button {} label: {
                        Image(systemName: "pencil.circle.fill")
                            .customFont(.title, 35)
                            .foregroundColor(.white)
                    }
                    
                }
                .padding()
                
                
                User
                
                Teams
                
                Interests
                
                
                Spacer()
                
                
            }
            
        }
        .preferredColorScheme(.dark)
    }
    
    var User: some View  {
        VStack(spacing: 0) {
            Image("user 3")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .mask(Circle())
                .overlay(content: {
                    Image(systemName: "camera.circle.fill")
                        .customFont(.title, 40)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.white, Color("highlight 2"))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .shadow(color: .black.opacity(0.5), radius: 2)
                        .shadow(color: .black.opacity(0.5), radius: 6)
                })
            
            VStack(spacing: 10) {
                HStack {
                    Text("Karl,")
                        .customFont(.largeTitle)
                    Text("27")
                        .customFont(.body, 32)
                    
                    Image(systemName: "checkmark.circle.fill")
                        .customFont(.title, 22)
                        .foregroundColor(Color("highlight 2"))
                }
                
                Text("Downtown, New york")
                    .customFont(.body)
            }
            .padding(.vertical)
        }
    }
    
    var Teams: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(friends.enumerated()), id: \.offset) { offset, friend in
                    VStack {
                        Image(friend.profilePic)
                            .resizable()
                            .scaledToFill()
                            .mask(Circle())
                            .frame(width: 60, height: 60)
                            .overlay(content: {
                                Image(systemName: "plus.circle.fill")
                                    .customFont(.body, 24)
                                    .frame(maxWidth: .infinity ,maxHeight: .infinity, alignment: .bottomTrailing)
                                    .opacity(offset == 0 ? 1 : 0)
                            })
                            .padding(6)
                        
                        Text(friend.name)
                            .customFont(.footnote)
                    }
                    
                    
                }
            }
            .padding()
        }
    }
    
    var Interests: some View {
        VStack {
            HStack {
                Text("Interests")
                    .customFont(.headline, 20)
                Spacer()
                Text("Edit")
                    .customFont(.callout)
                    .foregroundColor(.secondary)
            }
            .padding()
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    ForEach(0..<3) { item in
                        Text(interests[item])
                            .customFont(.headline, 18)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 20)
                            .background(
                                Color(.darkGray).opacity(0.3)
                            )
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    }
                }
                
                HStack(spacing: 20) {
                    ForEach(3..<6) { item in
                        Text(interests[item])
                            .customFont(.headline, 18)
                            .padding(.vertical, 16)
                            .padding(.horizontal, 20)
                            .background(
                                Color(.darkGray).opacity(0.3)
                            )
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    }
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
