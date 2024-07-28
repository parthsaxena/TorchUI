//
//  ConfirmationPopupView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 16/07/2024.
//

import SwiftUI

struct ConfirmationPopupView: View {
    
    var message: String
    var primaryActionTitle: String
    var secondryActionTitle: String
    
    var primaryTextColor: Color = .white
    var secondryTextColor: Color = .black
    
    var onPrimaryButtonTap: () -> Void
    var onSecondryButtonTap: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(message)
                    .multilineTextAlignment(.center)
                    .font(.custom("Manrope-SemiBold", size: 18))
                    .foregroundColor(CustomColors.darkGray)
                    .kerning(-0.5)
                Spacer()
                VStack {
                    Button(action: {
                        onPrimaryButtonTap()
                    }) {
                        Text(primaryActionTitle)
                            .frame(width: geometry.size.width - 48, height: 50)
                            .foregroundColor(primaryTextColor)
                            .padding(.horizontal, 15)
                            .background(Color.black)
                            .cornerRadius(25)
                    }
                    Button(action: {
                        onSecondryButtonTap()
                    }) {
                        Text(secondryActionTitle)
                            .frame(width: geometry.size.width - 48, height: 50)
                            .foregroundColor(secondryTextColor)
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
            .clipShape(RoundedCorner(topLeft: 16, topRight: 16, bottomLeft: 40, bottomRight: 40))
        }
    }
}

#Preview {
    ConfirmationPopupView(
        message: "Are you sure you want to exit without saving the changes?",
        primaryActionTitle: "Cancel",
        secondryActionTitle: "Save and exit",
        onPrimaryButtonTap: {
            
        }, onSecondryButtonTap: {
            
        }
    )
}
