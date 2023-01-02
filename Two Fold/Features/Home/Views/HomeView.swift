//
//  HomeView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 31/12/2022.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                header
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Array(friends.enumerated()), id: \.offset) { offset, friend in
                            VStack {
                                Image(friend.profilePic)
                                    .resizable()
                                    .scaledToFill()
                                    .mask(Circle())
                                    .overlay(
                                        Circle().stroke(Color("highlight 2"), lineWidth: 2)
                                    )
                                    .frame(width: 70, height: 70)
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
                }
                
                
                VStack(spacing: 24) {
                    Text("Todays pick")
                        .customFont(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(dailyPick) { team in
                                
                                DailyPickCard(dailyPick: team)
                            }
                        }
                    }
                    
                }
                
                scrollIndicator
                
                Spacer()
                
                
            }
            
            
        }
        .preferredColorScheme(.dark)
    }
    
    var header: some View {
        HStack {
            Image("user 1")
                .resizable()
                .scaledToFill()
                .mask(Circle())
                .overlay(
                    Circle().stroke(Color("highlight 2"), lineWidth: 2)
                )
                .frame(width: 40, height: 40)
            
            Spacer()
            
            HStack {
                Image(systemName: "location.north")
                    .foregroundColor(Color("highlight 2"))
                
                Text("Washington, US")
                    .customFont(.subhead)
                Image(systemName: "chevron.down")
                    .foregroundColor(Color("highlight 2"))
            }
            
            Spacer()
            
            Image(systemName: "bell.badge")
                .customFont(.body, 20)
                .foregroundColor(Color("background"))
                .padding(6)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                )
        }
        .padding(.horizontal)
        .padding(.bottom, 30)
        
    }
    
    var scrollIndicator: some View {
        HStack(spacing: 8) {
            Group {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 10, height: 10)
                
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 10, height: 10)
                
                
            }
            .foregroundColor(.gray.opacity(0.3))
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 80, height: 10)
                .foregroundColor(.gray.opacity(0.9))
            
            
            Group {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 10, height: 10)
                
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .frame(width: 10, height: 10)
            }
            .foregroundColor(.gray.opacity(0.3))
        }
        .padding(.top, 20)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
