//
//  CustomToastView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 09/07/2024.
//

import SwiftUI

struct CustomToastView: View {
    var message: String
    
    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding()
            .background(Color.black.opacity(0.8))
            .cornerRadius(8)
    }
}

struct ToastModifier: ViewModifier {
    @Binding var isShowing: Bool
    var message: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isShowing {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    ToastView(message: message)
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    isShowing = false
                                }
                            }
                        }
                    Spacer()
                }
                .padding()
                .zIndex(1)
            }
        }
    }
}

extension View {
    func toast(isShowing: Binding<Bool>, message: String) -> some View {
        self.modifier(ToastModifier(isShowing: isShowing, message: message))
    }
}
