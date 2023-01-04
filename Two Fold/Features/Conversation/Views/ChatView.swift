//
//  ChatView.swift
//  Two Fold
//
//  Created by Azamah Junior Khan on 02/01/2023.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel = ChatViewModel()
    @Binding var openChat: Bool
    @Binding var dismissTabBar: Bool
    @State var showSendIcon: Bool = false

    
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Button {
                    withAnimation(.easeOut(duration: 0.2)) {
                        openChat = false
                        dismissTabBar = false
                    }
                } label: {
                    Label("Back",systemImage: "arrow.left")
                        .foregroundColor(Color("highlight 2"))
                        .customFont(.headline)
                        .padding(.leading, 20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    ChatTitleRow()
                        .background(Color("background"))
                    
                    ScrollViewReader { proxy in
                        ScrollView(showsIndicators: true) {
                            ForEach(viewModel.message) { message in
                                MessageBubble(message: message)
                            }
                            
                        }
                        .padding(.vertical, 10)
                        .background(.ultraThinMaterial)
                        .cornerRadius(20, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                        .onChange(of: viewModel.lastMsgId, perform: { id in
                            withAnimation {
                                proxy.scrollTo(id, anchor: .bottom)

                            }
                        })
                    }
                    .padding(8)
                    
                }
                
                inputRow
                
            }
      
        }
    }
    
    var inputRow: some View {
        HStack(spacing: 12) {
            Image(systemName: "plus")
                .customChatIcon(22)
            
            if #available(iOS 16.0, *) {
                TextField("", text: $viewModel.text, axis: .vertical)
                    .customFont(.body)
                    .lineLimit(6)
                    .padding(5)
                    .background(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke()
                            .opacity(0.1)
                    })
            } else {
                TextField("", text: $viewModel.text)
                    .customFont(.body)
                    .padding(5)
                    .background(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke()
                            .opacity(0.1)
                    })
                
            }
            
            
            if showSendIcon {
                Button {
                    viewModel.send()
                    withAnimation {
                        showSendIcon = false
                    }
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .customChatIcon(24)
                    .transition(.move(edge: .leading).combined(with: .opacity))
                }
                
            } else {
                
                Image(systemName: "camera")
                    .customChatIcon(22)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                
                Image(systemName: "mic")
                    .customChatIcon(22)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                
            }
            
        }
        .padding(.horizontal, 12)
        .padding(.top, 10)
        .background(Color("background"))
        .onChange(of: viewModel.text, perform: { _ in
            if viewModel.text.isEmpty {
                withAnimation{
                    showSendIcon = false
                }
            } else {
                withAnimation{
                    showSendIcon = true
                }
            }
        })

    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(openChat: .constant(false), dismissTabBar: .constant(false))
    }
}
