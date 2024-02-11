//
//  DetectorStatusMenu.swift
//  TorchUI
//
//  Created by Saeed on 11/16/1402 AP.
//

import SwiftUI

struct DetectorStatusMenu: View {
    
    @ObservedObject var sessionManager: SessionManager
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    @Binding var showDetectorMenu: Bool
    @Binding var annotationsStatus: DetectorInfoStatus
    
    
    var body: some View {
//                if showDetectorMenu {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: 0) {
                
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    showDetectorMenu = false
                    annotationsStatus = .fire
                    
//                    let selectedPropertyID  = sessionManager.properties[sessionManager.selectedPropertyIndex].id
//                    let selectedDetectorID  = sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].id
//                    SessionManager.shared.muteSensor(device_id: selectedDetectorID, property_id: selectedPropertyID)
                }) {
                    HStack(alignment: .center, spacing: 8) {
                        Image("Icon")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(CustomColors.TorchGreen)
                            .frame(width: 20, height: 20)
                        HStack(spacing: 2) {
                            Text("Fire detection")
                                .font(.custom("Manrope-SemiBold", size: 16))
                                .foregroundColor(CustomColors.TorchGreen)
                                .kerning(-0.7)
                            Text("(Default)")
                                .font(.custom("Manrope-SemiBold", size: 16))
                                .foregroundColor(CustomColors.UltraLightGray)
                                .kerning(-0.7)
                        }
                        Spacer(minLength: 4)
                        Image(annotationsStatus == .fire ? "Checkbox-selected" : "Checkbox-unselected")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Spacer()
                            .frame(width: 16)
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    showDetectorMenu = false
                    annotationsStatus = .battery
                    
                }) {
                    HStack(alignment: .center, spacing: 8) {
                        Image("battery-mid")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(CustomColors.TorchGreen)
                            .frame(width: 20, height: 20)
                        Text("Battery status")
                            .font(.custom("Manrope-SemiBold", size: 16))
                            .foregroundColor(CustomColors.TorchGreen)
                            .kerning(-0.7)
                        Spacer(minLength: 4)
                        Image(annotationsStatus == .battery ? "Checkbox-selected" : "Checkbox-unselected")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Spacer()
                            .frame(width: 16)
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    showDetectorMenu = false
                    annotationsStatus = .connection
                    
                }) {
                    HStack(alignment: .center, spacing: 8) {
                        Image("wifi 1")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(CustomColors.TorchGreen)
                            .frame(width: 20, height: 20)
                        Text("Connection status")
                            .font(.custom("Manrope-SemiBold", size: 16))
                            .foregroundColor(CustomColors.TorchGreen)
                            .kerning(-0.7)
                        Spacer(minLength: 4)
                        Image(annotationsStatus == .connection ? "Checkbox-selected" : "Checkbox-unselected")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Spacer()
                            .frame(width: 16)
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    showDetectorMenu = false
                    annotationsStatus = .temperature
                    print("View detailed analytics")
//                    isSecondViewActive = true
//                    self.selection = 1
//                    SessionManager.shared.appState = .viewAnalytics
                }) {
                    HStack(alignment: .center, spacing: 8) {
                        Image("Thermometer")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(CustomColors.TorchGreen)
                            .frame(width: 20, height: 20)
                        Text("Temperature")
                            .font(.custom("Manrope-SemiBold", size: 16))
                            .foregroundColor(CustomColors.TorchGreen)
                            .kerning(-0.7)
                        Spacer(minLength: 4)
                        Image(annotationsStatus == .temperature ? "Checkbox-selected" : "Checkbox-unselected")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Spacer()
                            .frame(width: 16)
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    showDetectorMenu = false
                    annotationsStatus = .humidity
                    //                                        DispatchQueue.main.async {
                    //                                            SessionManager.shared.deleteDetector()
                    //                                        }
                                        
                }) {
                    HStack(alignment: .center, spacing: 8) {
                        Image("Humidity")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(CustomColors.TorchGreen)
                            .frame(width: 20, height: 20)
                        Text("Humidity")
                            .font(.custom("Manrope-SemiBold", size: 16))
                            .foregroundColor(CustomColors.TorchGreen)
                            .kerning(-0.7)
                        Spacer(minLength: 4)
                        Image(annotationsStatus == .humidity ? "Checkbox-selected" : "Checkbox-unselected")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Spacer()
                            .frame(width: 16)
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            //                                .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .frame(width: 280, alignment: .topLeading)
            .background(.white)
            .cornerRadius(16)
            .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.4), radius: 90, x: 0, y: 32)
            .position(x: width - 156, y: 130)
            Spacer()
        }
        .frame(width: width)
        .background(Color.gray.opacity(0.05))
        .gesture(
            TapGesture()
                .onEnded { _ in
                    showDetectorMenu = false
                }
        )
        
    }
    //    }
}

#Preview {
    
    let showDetectorMenu = Binding<Bool>(
        get: { false },
        set: { _ in }
    )
    
    let annotationsStatus = Binding<DetectorInfoStatus>(
        get: { .fire },
        set: { _ in }
    )
    
    return DetectorStatusMenu(sessionManager: SessionManager(), showDetectorMenu: showDetectorMenu, annotationsStatus: annotationsStatus)
}
