//
//  PreferencesView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 29/12/2022.
//

import SwiftUI

struct PreferencesView: View {
    var interests: [String] = ["Dancing", "Cooking", "Sports", "Photography", "Music", "Politics", "Traveling", "Art", "Eating", "Sleeping", "Reading", "Writing", "Technology", "Design", "Coding", "Chess", "Coffee", "Vlogging", "Sketching", "TikTok"]
    
    @State var userSelectedInterest: [String] = []
    @State var showPrompt: Bool = false
    
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            
            VStack(spacing: 24) {
                HStack(spacing: 10){
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .frame(width: 24, height: 10)
                    
                    Group {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: 10, height: 10)
                        
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .frame(width: 10, height: 10)
                    }
                    .foregroundColor(.gray.opacity(0.3))
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                Text("Choose your interest")
                    .customFont(.largeTitle, 45)
                    .layoutPriority(1)
                    .frame(maxWidth: 320, alignment: .leading)
                
                Spacer()

                VStack(spacing: 22) {
                    PreferenceScroll(interests: interests, userSelectedInterest: $userSelectedInterest)
                    
                    PreferenceScroll(interests: interests, userSelectedInterest: $userSelectedInterest, range: 5..<10, highlight: .highlight4)

                    PreferenceScroll(interests: interests, userSelectedInterest: $userSelectedInterest, range: 10..<15, highlight: .highlight1)

                    PreferenceScroll(interests: interests, userSelectedInterest: $userSelectedInterest, range: 15..<interests.count, highlight: .highlight3)

                }
                
                Spacer()
                
                Button {
                    if userSelectedInterest.count < 3 {
                        withAnimation(){
                            showPrompt = true
                        }
                    }
                } label: {
                    Label("Continue",systemImage: "arrow.right")
                        .customSubmitBtn()
                        .frame(maxWidth: 200)
                }
                .onChange(of: userSelectedInterest, perform: { minimum in
                    if showPrompt && userSelectedInterest.count > 2 {
                        withAnimation() {
                            showPrompt.toggle()
                        }
                    }

                })
                
                if showPrompt {
                    Text("Please choose a minimum of 3 interest")
                        .customFont(.subhead)
                        .foregroundColor(.secondary)
                }
                
            }
            
        }
        .preferredColorScheme(.dark)
    }
    
   
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}


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
