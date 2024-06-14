//
//  NotificationCard.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 11/06/2024.
//

import SwiftUI

struct NotificationCard: View {
    
    @State var notificationState: NotificationStates
    var isRead: Bool
    
    @State private var alertTitle = ""
    @State private var alertImage = "home-bettery"
    @State private var titleColor = CustomColors.darkGray
    @State private var subTitleColor = CustomColors.lightGrayText
    @State private var backgroundColor = Color.white
    @State private var circleColor = CustomColors.tabBarBackground
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                        .frame(width: 40, height: 40)
                        .overlay(
                            Image(alertImage)
                                .background(.white)
                        )
                        .background(.white)
                        .cornerRadius(20.0)
                        .padding([.top, .leading])
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(alertTitle)
                            .font(.custom("Manrope-SemiBold", size: 16))
                            .foregroundColor(titleColor)
                            .kerning(-0.5)
                        Text("Neighborhood 1")
                            .font(.custom("Manrope-Regular", size: 14))
                            .foregroundColor(subTitleColor)
                    }
                    Text("Pacific Coast Hwy, Malibu")
                        .font(.custom("Manrope-Regular", size: 14))
                        .foregroundColor(subTitleColor)
                    Text("5 min ago")
                        .font(.custom("Manrope-Regular", size: 14))
                        .foregroundColor(subTitleColor)
                }
                Spacer()
                if isRead {
                    VStack {
                        Circle()
                            .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                            .frame(width: 10, height: 10)
                            .background(CustomColors.TorchRed)
                            .cornerRadius(5.0)
                            .padding([.top, .trailing])
                        Spacer()
                    }
                }
            }
            .frame(height: 86)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(CustomColors.tabBarBackground, lineWidth: 1)
        )
        .background(backgroundColor)
        .cornerRadius(22)
        .padding(.horizontal, -20)
        .onAppear {
            onAppearSetup()
        }
    }
    
    func onAppearSetup() {
        if notificationState == .highAlert {
            alertTitle = "Red Alert"
            alertImage = "NotificationRedAlert"
        } else if notificationState == .warning {
            alertTitle = "Yellow Alert"
            alertImage = "NotificationWarning"
        } else if notificationState == .lowBettery {
            alertTitle = "Low Bettery"
            alertImage = "NotificationLowBettery"
        }
    }
}
