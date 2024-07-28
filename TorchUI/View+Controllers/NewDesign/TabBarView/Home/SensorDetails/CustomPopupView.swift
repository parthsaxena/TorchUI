//
//  CustomPopupView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 09/07/2024.
//
//
import SwiftUI

struct CustomPopupView: View {
    
    @State private var text: String = "Write your message"
    var onSendButtonTap: () -> Void
    var onCancelButtonTap: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Please share what it was.")
                    .font(.custom("Manrope-SemiBold", size: 20))
                    .foregroundColor(CustomColors.darkGray)
                    .kerning(-1.5)
                Text("This will help make our Torch sensors better.")
                    .font(.custom("Manrope-SemiBold", size: 16))
                    .foregroundColor(CustomColors.lightGrayText)
                    .kerning(-0.7)
                Spacer()
                    .frame(height: 20)
                HStack {
                    Text("Describe this")
                        .font(.custom("Manrope-SemiBold", size: 14))
                        .foregroundColor(CustomColors.darkGray)
                        .kerning(-0.7)
                    Spacer()
                }
                ZStack {
                    CustomColors.lightGrayBorder
                        .cornerRadius(8)
                    TextEditor(text: $text)
                        .foregroundColor(CustomColors.lightGrayText)
//                        .padding(8)
                        .background(Color.clear)
                        .cornerRadius(8)
                }
                .frame(height: 200)
//                .padding()
                .background(CustomColors.lightGrayBorder)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                )
                VStack {
                    Button(action: {
                        onSendButtonTap()
                    }) {
                        Text("Send")
                            .frame(width: geometry.size.width - 48, height: 50)
                            .foregroundColor(.white)
                            .padding(.horizontal, 15)
                            .background(Color.black)
                            .cornerRadius(25)
                    }
                    Button(action: {
                        onCancelButtonTap()
                    }) {
                        Text("Cancel")
                            .frame(width: geometry.size.width - 48, height: 50)
                            .foregroundColor(.black)
                            .padding(.horizontal, 15)
                            .background(.clear)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(CustomColors.darkGray.opacity(0.5), lineWidth: 1)
                            )
                    }
                }
            }
            .frame(width: geometry.size.width - 18)
            .padding()
            .background(.white)
            .cornerRadius(16)
        }
    }
}

struct PopupModifier<PopupContent: View>: ViewModifier {
    
    @Binding var isShowing: Bool
    @Binding var viewHeight: CGFloat
    
    let popupContent: () -> PopupContent
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                content
                if isShowing {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                        popupContent()
                    }
                    .padding(.top, geometry.size.height - viewHeight)
                    .padding(.horizontal)
                    .padding(.trailing)
                    .zIndex(1)
                }
            }
        }
    }
}

extension View {
    func popup<PopupContent: View>(
        isShowing: Binding<Bool>,
        viewHeight: Binding<CGFloat>,
        @ViewBuilder content: @escaping () -> PopupContent
    ) -> some View {
        self.modifier(PopupModifier(isShowing: isShowing, viewHeight: viewHeight, popupContent: content))
    }
}
