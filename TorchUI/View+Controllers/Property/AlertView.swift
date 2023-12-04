//
//  AlertView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

struct AlertView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var model: AlertModel
    
    var body: some View {
        VStack {
            let threatColorText = model.threat == Threat.Red ? "Red Alert" : "Warning"
            let textColor = model.threat == Threat.Red ? CustomColors.TorchRed : CustomColors.WarningYellow
            
            HStack(spacing: 4.0) {
                Spacer()
                Text("\(threatColorText):")
                    .font(Font.custom("Manrope-Bold", size: 20))
                    .foregroundColor(colorScheme == .dark ? Color.white : textColor)
                Text(model.property.propertyName)
                    .font(Font.custom("Manrope-Light", size: 20))
                    .foregroundColor(colorScheme == .dark ? Color.white : textColor)
                Spacer()
            }
            .padding(.top, 70)
            
            Text("There is a \(model.detector.measurements["fire_rating"] ?? "")% chance of fire on this property. \nCall the fire department now.")
                .font(Font.custom("Manrope-Medium", size: 14))
                .frame(height: 40)
                .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.6) : CustomColors.LightGray)
                .multilineTextAlignment(.center)
            
            HStack {
                Spacer()
                
                Image("LocationMarker")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.6) : CustomColors.LightGray)
                    .frame(width: 16.0, height: 16.0)
                
                Text(model.property.propertyAddress)
                    .font(Font.custom("Manrope-Medium", size: 12.0))
                    .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.6) : CustomColors.LightGray)
                
                Spacer()
            }
            
            HStack {
                Spacer()
               
                Button("View sensor data") {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    SessionManager.shared.selectedProperty = model.property
                    SessionManager.shared.appState = .viewProperty
                }
                .font(.custom("Manrope-SemiBold", size: 16))
                .frame(maxWidth: 229)
                .frame(maxHeight: 28)
                .frame(height: 56)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.3) : Color(red: 0.95, green: 0.95, blue: 0.95))
                )
                Circle()
                .fill(colorScheme == .dark ? LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color.white, location: 0.00),
                        Gradient.Stop(color: Color.white, location: 1.00),
                    ], startPoint: UnitPoint(x: 0.25, y: 0.08), endPoint: UnitPoint(x: 0.7, y: 0.97)
                ) :
                    LinearGradient(
                        stops: [
                        Gradient.Stop(color: Color(red: 1, green: 0.35, blue: 0.14), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.91, green: 0.21, blue: 0.04), location: 0.56),
                        Gradient.Stop(color: Color(red: 0.87, green: 0.15, blue: 0), location: 1.00),
                        ], startPoint: UnitPoint(x: 0.25, y: 0.08), endPoint: UnitPoint(x: 0.7, y: 0.97)
                    )
                )
                .frame(width: 56, height: 56)
                .overlay(
                    Image("PhoneIcon")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(colorScheme == .dark ? CustomColors.TorchRed : Color.white)
                        .frame(width: 20, height: 20)
                )
                Spacer()
            }
            .padding(.bottom, 15)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .frame(height: 280)
        .background(
            ZStack {
                Image("ThreatAlertBackground")
                    .resizable()
                if colorScheme == .dark {
                    Rectangle()
                        .fill(Color.black.opacity(0.85))
                        .ignoresSafeArea()
                    
                    let orangeColor = Color(red: 1, green: 0.35, blue: 0.14)
                    LinearGradient(gradient: Gradient(colors: [.clear, .clear, orangeColor.opacity(0.3), orangeColor.opacity(0.5),orangeColor.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                        .opacity(1)
                } else {
                    LinearGradient(gradient: Gradient(colors: [.clear, .clear, Color.white, Color.white, Color.white]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                        .opacity(1)
                }
                
                VStack {
                    HStack {
                        Spacer()
                        Image("TorchIndicator")
                            .resizable()
                            .frame(width: 100, height: 109)
                        Spacer()
                    }
                    
                    Spacer()
                }
            }
        )
        .cornerRadius(24)
        .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.08), radius: 12, x: 0, y: 4)
        .padding(.horizontal, 16)
    }
}
