//
//  DetectorDetailOverlayView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI


struct DetectorDetailOverlayView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    @Binding var size: CGSize
    @Binding var mapOffset: CGSize

    @ObservedObject var sessionManager: SessionManager
    
    @Binding var showingDeleteDetectorOptions: Bool
    @Binding var showDetectorDetails: Bool
    @Binding var dragOffset: CGSize
    
    @Binding var shouldShowRedOverlay: Bool
    @State private var showDetectorMenu = false
    
    @Binding var showRedOverlay: Bool
    
    @State private var isSecondViewActive = false
    @State var selection: Int? = nil
    
    @Binding var needsLocationPin: Bool
    @Binding var shouldHideOnPositionSelection: Bool
    @Binding var newDetector: Detector?
    @Binding var didChangeSensorPosition: Bool
    @Binding var viewAnalytics: Bool
    
    var body: some View {
            VStack {
                
                if (sessionManager.selectedPropertyIndex >= 0 && sessionManager.selectedPropertyIndex < sessionManager.properties.count && sessionManager.selectedDetectorIndex < sessionManager.properties[sessionManager.selectedPropertyIndex].detectors.count) {
                    
                    if sessionManager.selectedDetectorIndex >= 0 && sessionManager.selectedDetectorIndex < sessionManager.properties[sessionManager.selectedPropertyIndex].detectors.count && sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].threat == .Red && shouldShowRedOverlay && showRedOverlay {
                        
                        withAnimation(.easeIn(duration: 1.5)) {
                            Rectangle()
                                .fill(
                                    RadialGradient(colors: [Color.clear, CustomColors.TorchRed], center: .center, startRadius: width - 200, endRadius: width + 10)
                                )
                                .allowsHitTesting(false)
                                .frame(width: width)
                                .padding(.bottom, -40)
                                .ignoresSafeArea()
                                .allowsHitTesting(false)
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Spacer()
                            RoundedRectangle(cornerRadius: 5.0)
                                .frame(width: 30, height: 4)
                                .foregroundColor(AuthenticationManager.shared.authState.rawValue >= AuthState.accountName.rawValue ? CustomColors.TorchGreen : Color(red: 227/255, green: 231/255, blue: 232/255))
                            Spacer()
                        }
                        ZStack {
                            Rectangle()
                                .cornerRadius(15.0)
                                .ignoresSafeArea()
                                .foregroundColor(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                                .frame(maxHeight: .infinity)
                                .shadow(color: CustomColors.LightGray.opacity(0.5), radius: 2.0)
                            
                            if sessionManager.selectedDetectorIndex >= 0 && sessionManager.selectedDetectorIndex < sessionManager.properties[sessionManager.selectedPropertyIndex].detectors.count {
                                VStack {
                                    HStack(spacing: 1) {
                                        
                                        if let x = sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].sensorIdx {
                                            Text("Sensor \(x)")
                                                .font(Font.custom("Manrope-SemiBold", size: 24.0))
                                                .kerning(-1)
                                                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                                                .padding(.leading, 15)
                                                .padding(.top, 20)
                                        }
                                        
                                        let deviceName = sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].deviceName
                                        
                                        Text(deviceName)
                                            .font(Font.custom("Manrope-SemiBold", size: 24.0))
                                            .kerning(-1)
                                            .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.UltraLightGray)
                                            .padding(.leading, 15)
                                            .padding(.top, 20)
                                        
                                        Spacer()
                                        
                                        
                                        Image(systemName: "ellipsis")
                                            .foregroundColor(CustomColors.LightGray)
                                            .padding(.trailing, 23.0)
                                            .padding(.top, 20)
                                            .background(
                                                Color.clear
                                                    .padding(.trailing, 23.0)
                                                    .padding(.top, 20)
                                            )
                                            .contentShape(Rectangle()) // Makes the entire padded area tappable
                                            .onTapGesture {
                                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                impactMed.impactOccurred()
                                                print("Dots tapped")
                                                //                                            showingDeleteDetectorOptions.toggle()
                                                showDetectorMenu.toggle()
                                            }
                                        
                                    }
                                    
                                    //                                HStack {
                                    //                                    Text("Fire Probability")
                                    //                                        .font(Font.custom("Manrope-Medium", size: 18.0))
                                    //                                        .kerning(-1)
                                    //                                        .foregroundColor(Color(red: 115.0/255.0, green: 136.0/255.0, blue: 140.0/255.0))
                                    //                                    //                        115, 136, 140
                                    //                                        .padding(.top, 1)
                                    //
                                    //                                    Spacer()
                                    //                                }
                                    //                                .padding(.leading, 15)
                                    
                                    
                                    if !sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].connected {
                                        
                                        VStack(alignment: .center, spacing: 4) {
                                            
                                            Image(systemName: "wifi.slash")
                                                .resizable()
                                                .renderingMode(.template)
                                                .foregroundColor(CustomColors.LightGray)
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 40, height: 40)
                                                .padding(.top, 16)
                                                .padding(.trailing, 16)
                                            
                                            
                                            Text("Sensor offline")
                                                .font(
                                                    Font.custom("Manrope", size: 20)
                                                        .weight(.medium)
                                                )
                                                .foregroundColor(CustomColors.LightGray)
                                            
                                            
                                            Text("Check the seonsor and press reconnect.")
                                                .font(
                                                    Font.custom("Manrope", size: 14)
                                                        .weight(.medium)
                                                )
                                                .foregroundColor(CustomColors.UltraLightGray)
                                            
                                        }
                                        .padding(.vertical, 50)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        //                                    .cornerRadius(56)
                                        
                                    } else {

                                        HStack {
                                            let fireRating = Int(sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].measurements["fire_rating"] ?? "0")
                                            let highRisk = (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].threat == Threat.Red)
                                            let mediumRisk = !highRisk && (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].threat == Threat.Yellow)
                                            let riskText = highRisk ? "High Risk" : (mediumRisk ? "Medium Risk" : "Low Risk")
                                            var riskColor = highRisk ? CustomColors.TorchRed : (mediumRisk ? CustomColors.WarningYellow : CustomColors.GoodGreen)
                                            
//                                            let x = print("CHHANCE IS \(fireRating) AND COLOR IS \(riskColor) AND THREAT IS \(sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].threat)")
                                            
                                            VStack(spacing: 4) {
                                                Text("\(sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].measurements["fire_rating"] ?? "0")%")
                                                    .font(Font.custom("Manrope-SemiBold", size: 36.0))
                                                    .kerning(-1)
                                                    .foregroundColor(.white)
                                                
                                                Text("Chance of fire")
                                                    .font(Font.custom("Manrope-Bold", size: 14))
                                                    .kerning(-0.5)
                                                    .foregroundColor(.white)
                                            }
                                            .frame(minWidth: 115)
                                            //                                    .frame(width: 0.8 * width / 3)
                                            //                            .frame(width: width / 3)
                                            .frame(height: 116)
                                            .background(riskColor)
                                            .cornerRadius(12.0)
                                            .shadow(color: CustomColors.DetectorDetailsShadow, radius: 12.0, x: 0.0, y: 4.0)
                                            .padding(.leading, 16)
                                            
                                            
                                            Spacer()
                                                .frame(width: 8)
                                            
                                            HStack(spacing: 0) {
                                                VStack(alignment: .leading, spacing: 12) {
                                                    Text("Thermal camera")
                                                        .font(Font.custom("Manrope-SemiBold", size: 14.0))
                                                        .kerning(-0.5)
                                                        .foregroundColor(CustomColors.LightGray)
                                                    
                                                    Text("Spectral analysis")
                                                        .font(Font.custom("Manrope-SemiBold", size: 14.0))
                                                        .kerning(-0.5)
                                                        .foregroundColor(CustomColors.LightGray)
                                                    
                                                    Text("Smoke")
                                                        .font(Font.custom("Manrope-SemiBold", size: 14.0))
                                                        .kerning(-0.5)
                                                        .foregroundColor(CustomColors.LightGray)
                                                }.padding([.top, .leading, .bottom], 16)
                                                Spacer()
                                                VStack(alignment: .trailing, spacing: 12) {
                                                    let thermalHighRisk = (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].thermalStatus == Threat.Red)
                                                    let thermalMediumRisk = !thermalHighRisk && (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].thermalStatus == Threat.Yellow)
                                                    let thermalRiskText = thermalHighRisk ? "Red alert" : (thermalMediumRisk ? "Warning" : "Normal")
                                                    let thermalRiskImage = thermalHighRisk ? "FireRed" : (thermalMediumRisk ? "FireYellow" : "Checkmark")
                                                    let thermalRiskColor = thermalHighRisk ? CustomColors.TorchRed : (thermalMediumRisk ? CustomColors.WarningYellow : CustomColors.GoodGreen)
                                                    Text("\(thermalRiskText)")
                                                        .font(Font.custom("Manrope-Bold", size: 14))
                                                        .foregroundColor(thermalRiskColor)
                                                    
                                                    
                                                    let spectralHighRisk = (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].spectralStatus == Threat.Red)
                                                    let spectralMediumRisk = !spectralHighRisk && (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].spectralStatus == Threat.Yellow)
                                                    let spectralRiskText = spectralHighRisk ? "Red alert" : (spectralMediumRisk ? "Warning" : "Normal")
                                                    let spectralRiskImage = spectralHighRisk ? "FireRed" : (spectralMediumRisk ? "FireYellow" : "Checkmark")
                                                    let spectralRiskColor = spectralHighRisk ? CustomColors.TorchRed : (spectralMediumRisk ? CustomColors.WarningYellow : CustomColors.GoodGreen)
                                                    Text("\(spectralRiskText)")
                                                        .font(Font.custom("Manrope-Bold", size: 14))
                                                        .foregroundColor(spectralRiskColor)
                                                    
                                                    
                                                    let highRisk = (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].smokeStatus == Threat.Red)
                                                    let mediumRisk = !highRisk && (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].smokeStatus == Threat.Yellow)
                                                    let riskText = highRisk ? "Red alert" : (mediumRisk ? "Warning" : "Normal")
                                                    let riskImage = highRisk ? "FireRed" : (mediumRisk ? "FireYellow" : "Checkmark")
                                                    let riskColor = highRisk ? CustomColors.TorchRed : (mediumRisk ? CustomColors.WarningYellow : CustomColors.GoodGreen)
                                                    
                                                    Text("\(riskText)")
                                                        .font(Font.custom("Manrope-Bold", size: 14))
                                                        .foregroundColor(riskColor)
                                                    
                                                    
                                                }.padding([.bottom, .top], 16).padding(.trailing, 8)
                                                    .padding(.leading, 2)
                                                VStack(alignment: .center, spacing: 12) {
                                                    let thermalHighRisk = (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].thermalStatus == Threat.Red)
                                                    let thermalMediumRisk = !thermalHighRisk && (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].thermalStatus == Threat.Yellow)
                                                    let thermalRiskImage = thermalHighRisk ? "FireRed" : (thermalMediumRisk ? "FireYellow" : "Checkmark")
                                                    let thermalRiskColor = thermalHighRisk ? CustomColors.TorchRed : (thermalMediumRisk ? CustomColors.WarningYellow : CustomColors.GoodGreen)
                                                    Text("\(Image.init(uiImage: UIImage(cgImage: UIImage(named: thermalRiskImage)!.cgImage!, scale: 4.0, orientation: UIImage(named: thermalRiskImage)!.imageOrientation)))")
                                                        .font(Font.custom("Manrope-Bold", size: 14))
                                                        .foregroundColor(thermalRiskColor)
                                                    
                                                    let spectralHighRisk = (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].spectralStatus == Threat.Red)
                                                    let spectralMediumRisk = !spectralHighRisk && (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].spectralStatus == Threat.Yellow)
                                                    let spectralRiskImage = spectralHighRisk ? "FireRed" : (spectralMediumRisk ? "FireYellow" : "Checkmark")
                                                    let spectralRiskColor = spectralHighRisk ? CustomColors.TorchRed : (spectralMediumRisk ? CustomColors.WarningYellow : CustomColors.GoodGreen)
                                                    Text("\(Image.init(uiImage: UIImage(cgImage: UIImage(named: spectralRiskImage)!.cgImage!, scale: 4.0, orientation: UIImage(named: spectralRiskImage)!.imageOrientation)))")
                                                        .font(Font.custom("Manrope-Bold", size: 14))
                                                        .foregroundColor(spectralRiskColor)
                                                    
                                                    let highRisk = (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].smokeStatus == Threat.Red)
                                                    let mediumRisk = !highRisk && (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].smokeStatus == Threat.Yellow)
                                                    let riskImage = highRisk ? "FireRed" : (mediumRisk ? "FireYellow" : "Checkmark")
                                                    let riskColor = highRisk ? CustomColors.TorchRed : (mediumRisk ? CustomColors.WarningYellow : CustomColors.GoodGreen)
                                                    Text("\(Image.init(uiImage: UIImage(cgImage: UIImage(named: riskImage)!.cgImage!, scale: 4.0, orientation: UIImage(named: riskImage)!.imageOrientation)))")
                                                        .font(Font.custom("Manrope-Bold", size: 14))
                                                        .foregroundColor(riskColor)
                                                }.padding([.bottom, .trailing, .top], 16)
                                            }
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 116)
                                            .background(colorScheme == .dark ? Color(red: 0.24, green: 0.26, blue: 0.27) : Color.white)
                                            .cornerRadius(12.0)
                                            .shadow(color: CustomColors.DetectorDetailsShadow, radius: 12.0, x: 0.0, y: 4.0)
                                            .padding(.trailing, 16)
                                        }
                                        
                                        
                                        //MARK: - Bottom 2 views
                                        HStack{
                                            VStack{
                                                let threat = sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].threat
                                                HStack(alignment: .center, spacing: 0){
                                                    
                                                    VStack(alignment: .leading, spacing: 12) {
                                                        Text("Temperature")
                                                            .font(Font.custom("Manrope-SemiBold", size: 13.0))
                                                            .kerning(-0.5)
                                                            .foregroundColor(CustomColors.LightGray)
                                                        //                                                    .padding(.leading, 16)
                                                        
                                                        Text("Humidity")
                                                            .font(Font.custom("Manrope-SemiBold", size: 13.0))
                                                            .kerning(-0.5)
                                                            .foregroundColor(CustomColors.LightGray)
                                                        
                                                    }
                                                    .padding(.leading, 16)
                                                    
                                                    
                                                    Spacer()
                                                    
                                                    VStack(alignment: .leading, spacing: 12) {
                                                        Text("\(sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].measurements["temperature"] ?? "28")°C")
                                                            .font(Font.custom("Manrope-Bold", size: 14.0))
                                                            .foregroundColor(threat == .Red ? CustomColors.TorchRed : (threat == .Yellow ? CustomColors.WarningYellow : CustomColors.GoodGreen))
                                                        //                                                    .frame(height: 12)
                                                        
                                                        Text("\(sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].measurements["humidity"] ?? "85")%")
                                                            .font(Font.custom("Manrope-Bold", size: 14.0))
                                                            .foregroundColor(CustomColors.GoodGreen)
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    VStack(alignment: .leading, spacing: 12) {
                                                        HStack(spacing: 2) {
                                                            Image(systemName: "arrow.up")
                                                                .foregroundColor(CustomColors.LightGray)
                                                                .font(.system(size: 13.0))
                                                            
                                                            Text("2°C")
                                                                .font(Font.custom("Manrope-Bold", size: 14.0))
                                                                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                                                        }
                                                        
                                                        
                                                        HStack(spacing: 2) {
                                                            Image(systemName: "arrow.up")
                                                                .foregroundColor(CustomColors.LightGray)
                                                                .font(.system(size: 13.0))
                                                            
                                                            Text("5%")
                                                                .font(Font.custom("Manrope-Bold", size: 14.0))
                                                                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                                                            //                                                        .padding(.trailing, 16)
                                                        }
                                                    }
                                                    .padding(.trailing, 16)
                                                    
                                                }
                                                .frame(height: 84)
                                            }.frame(maxWidth: .infinity)
                                            //                                        .frame(height: (width - 60) / 3 * 0.8)
                                                .background(colorScheme == .dark ? Color(red: 0.24, green: 0.26, blue: 0.27) : Color.white)
                                                .cornerRadius(12.0)
                                                .shadow(color: CustomColors.DetectorDetailsShadow, radius: 12.0, x: 0.0, y: 4.0)
                                                .padding(.leading, 16)
                                            
                                            HStack(spacing: 0){
                                                VStack(alignment: .center, spacing: 4){
                                                    let deviceBattery = sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].deviceBattery
                                                    VStack {
                                                        BatteryView(batteryLevel: deviceBattery)
                                                            .frame(width: 25, height: 10)
                                                            .rotationEffect(.degrees(270))
                                                    }.frame(width: 32, height: 32)
                                                    
                                                    
                                                    Text("\(Int(sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].deviceBattery))%")
                                                        .font(Font.custom("Manrope-SemiBold", size: 14.0))
                                                        .foregroundColor(CustomColors.LightGray)
                                                    
                                                }
                                                .padding(.vertical, 12)
                                                .frame(width: 60)
                                                VStack(spacing: 4){
                                                    Image("wifi 1")
                                                        .resizable()
                                                        .renderingMode(.template)
                                                        .foregroundColor(CustomColors.GoodGreen)
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 32, height: 32)
                                                    //                                                .padding(.top, 16)
                                                    //                                                .padding(.trailing, 16)
                                                    
                                                    let deviceID = SessionManager.shared.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].id
                                                    let timeStamp = SessionManager.shared.latestTimestampDict[deviceID]
                                                    let x = print("Got timestamp for deviceID \(deviceID) with val \(timeStamp)")
                                                    if timeStamp == nil {
                                                        Text("-")
                                                            .font(Font.custom("Manrope-SemiBold", size: 14.0))
                                                            .foregroundColor(CustomColors.LightGray)
                                                    } else {
                                                        Text("\(timeStamp!.timeIn24HourFormat())")
                                                            .font(Font.custom("Manrope-SemiBold", size: 14.0))
                                                            .foregroundColor(CustomColors.LightGray)
                                                    }
                                                    
                                                }
                                                .padding(.vertical, 12)
                                                .frame(width: 60)
                                            }
                                            //                                    .frame(width: 0.8 * width / 2.3)
                                            .frame(minWidth: 136)
                                            .frame(height: 84)
                                            //                                        .frame(height: (width - 60) / 3 * 0.8)
                                            .background(colorScheme == .dark ? Color(red: 0.24, green: 0.26, blue: 0.27) : Color.white)
                                            .cornerRadius(12.0)
                                            .shadow(color: CustomColors.DetectorDetailsShadow, radius: 12.0, x: 0.0, y: 4.0)
                                            .padding(.trailing, 16)
                                        }
                                        if sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].threat == .Red {
                                            VStack(spacing: 0) {
                                                
                                                Text("Active fire detected")
                                                    .font(Font.custom("Manrope-SemiBold", size: 20.0))
                                                    .foregroundColor(.white)
                                                    .frame(height: 30)
                                                    .padding(.top, 16)
                                                    .padding(.bottom, 4)
                                                
                                                let fireChance  = sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].measurements["fire_rating"] ?? "80"
                                                
                                                Text("There is a \(fireChance)% chance of fire on this property.")
                                                    .font(Font.custom("Manrope", size: 14))
                                                    .foregroundColor(.white)
                                                    .padding(.bottom, 16)
                                                
                                                
                                                HStack(spacing: 0) {
                                                    //                                            Spacer()
                                                    //                                            Button(action: {
                                                    //                                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                    //                                                impactMed.impactOccurred()
                                                    //
                                                    //                                                //call 912
                                                    //                                            }) {
                                                    
                                                    //                                            RoundedRectangle(cornerSize: 100){
                                                    //
                                                    //                                            }
                                                    //                                            .foregroundColor(.white)
                                                    
                                                    Link(destination: URL(string: "tel:912")!) {
                                                        
                                                        HStack(alignment: .center, spacing: 8) {
                                                            Spacer()
                                                            Image("PhoneIcon")
                                                                .resizable()
                                                                .renderingMode(.template)
                                                                .foregroundColor(CustomColors.TorchRed)
                                                                .frame(width: 20, height: 20)
                                                            
                                                            Text("Call the fire department")
                                                                .font(.custom("Manrope-SemiBold", size: 16))
                                                            //                                                    .frame(maxWidth: .infinity)
                                                                .frame(height: 56)
                                                                .foregroundColor(CustomColors.TorchRed)
                                                            //                                                    .padding(.horizontal, 16)
                                                            Spacer()
                                                        }
                                                        .padding(.horizontal, 16)
                                                        .padding(.vertical, 12)
                                                        .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .center)
                                                        //                                                .background(colorScheme == .dark ? CustomColors.TorchGreen : Color.white)
                                                        .background(.white)
                                                        .cornerRadius(30)
                                                        .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.05), radius: 1, x: 0, y: 1)
                                                        
                                                        
                                                        //                                                .padding(.top, 10)
                                                    }
                                                    //                                            Spacer()
                                                }
                                                .padding(.bottom, 16)
                                                .padding(.horizontal, 16)
                                                //                                    .padding(.top, 60)
                                                
                                                
                                            }
                                            //                                    .frame(maxWidth: .infinity)
                                            .frame(height: 159)
                                            .background(CustomColors.TorchRed)
                                            .cornerRadius(12.0)
                                            .shadow(color: CustomColors.DetectorDetailsRedShadow, radius: 12.0, x: 0.0, y: 4.0)
                                            .padding(.horizontal, 16)
                                        }
                                    }
                                }
                            }
                            
                            if showDetectorMenu {
                                HStack {
                                    Spacer()
                                    VStack(alignment: .leading, spacing: 0) {
                                        
                                        Button(action: {
                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                            impactMed.impactOccurred()
                                            showDetectorMenu = false
                                            
                                            
                                            let selectedPropertyID  = sessionManager.properties[sessionManager.selectedPropertyIndex].id
                                            let selectedDetectorID  = sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].id
                                            SessionManager.shared.muteSensor(device_id: selectedDetectorID, property_id: selectedPropertyID)
                                        }) {
                                            HStack(alignment: .center, spacing: 8) {
                                                Image("volume-x")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundColor(CustomColors.TorchGreen)
                                                    .frame(width: 20, height: 20)
                                                Text("Mute sensor")
                                                    .font(.custom("Manrope-SemiBold", size: 16))
                                                    .foregroundColor(CustomColors.TorchGreen)
                                                Spacer()
                                            }
                                            .padding(.leading, 16)
                                            .padding(.vertical, 12)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                        }
                                        
                                        Button(action: {
                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                            impactMed.impactOccurred()
                                            showDetectorMenu = false
                                            
                                        }) {
                                            HStack(alignment: .center, spacing: 8) {
                                                Image("info-circle")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundColor(CustomColors.TorchGreen)
                                                    .frame(width: 20, height: 20)
                                                Text("Information")
                                                    .font(.custom("Manrope-SemiBold", size: 16))
                                                    .foregroundColor(CustomColors.TorchGreen)
                                                Spacer()
                                            }
                                            .padding(.leading, 16)
                                            .padding(.vertical, 12)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                        }
                                        
                                        Button(action: {
                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                            impactMed.impactOccurred()
                                            
                                            let index = SessionManager.shared.selectedPropertyIndex
                                            newDetector = SessionManager.shared.properties[index].detectors[SessionManager.shared.selectedDetectorIndex]
                                            showDetectorMenu = false
                                            showDetectorDetails = false
                                            needsLocationPin = true
                                            shouldHideOnPositionSelection = true
                                            self.didChangeSensorPosition = true
                                            
                                        }) {
                                            HStack(alignment: .center, spacing: 8) {
                                                Image("marker-pin-06")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundColor(CustomColors.TorchGreen)
                                                    .frame(width: 20, height: 20)
                                                Text("Change position/nickname")
                                                    .font(.custom("Manrope-SemiBold", size: 16))
                                                    .foregroundColor(CustomColors.TorchGreen)
                                                Spacer()
                                            }
                                            .padding(.leading, 16)
                                            .padding(.vertical, 12)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                        }
                                        
                                        Button(action: {
                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                            impactMed.impactOccurred()
                                            showDetectorMenu = false
                                            print("View detailed analytics")
                                            isSecondViewActive = true
                                            self.selection = 1
//                                            SessionManager.shared.appState = .viewAnalytics
                                            viewAnalytics = true
                                        }) {
                                            HStack(alignment: .center, spacing: 8) {
                                                Image("line-chart-up-01")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundColor(CustomColors.TorchGreen)
                                                    .frame(width: 20, height: 20)
                                                Text("View detailed analytics")
                                                    .font(.custom("Manrope-SemiBold", size: 16))
                                                    .foregroundColor(CustomColors.TorchGreen)
                                                Spacer()
                                            }
                                            .padding(.leading, 16)
                                            .padding(.vertical, 12)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                        }
                                        
                                        Button(action: {
                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                            impactMed.impactOccurred()
                                            showDetectorMenu = false
                                            //                                        DispatchQueue.main.async {
                                            //                                            SessionManager.shared.deleteDetector()
                                            //                                        }
                                            
                                            showingDeleteDetectorOptions = true
                                            
                                        }) {
                                            HStack(alignment: .center, spacing: 8) {
                                                Image("trash-03")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundColor(CustomColors.TorchRed)
                                                    .frame(width: 20, height: 20)
                                                Text("Delete sensor")
                                                    .font(.custom("Manrope-SemiBold", size: 16))
                                                    .foregroundColor(CustomColors.TorchRed)
                                                Spacer()
                                            }
                                            .padding(.leading, 16)
                                            .padding(.vertical, 12)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                        }
                                    }
                                    //                                .padding(.horizontal, 16)
                                    .padding(.vertical, 4)
                                    .frame(width: 270, alignment: .topLeading)
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
                        }
                        //            .frame(width: width, height: 2.2 * height / 5)
                    }
                    //                .padding(.bottom,0)
                    .fixedSize(horizontal: false, vertical: true)
                    .overlay(GeometryReader { geo in
                        Rectangle().fill(Color.clear).onAppear {
                            self.size = geo.size
                            if showDetectorDetails {
                                self.mapOffset = geo.size
                                print("Det Set mapOffset 1 \(self.mapOffset)")
                            }
                        }.onChange(of: geo.size) { updatedSize in
                            if showDetectorDetails {
                                self.size = updatedSize
                                self.mapOffset = geo.size
                                print("Det Set mapOffset 2 \(self.mapOffset)")
                            }
                        }
                    })
                    .onChange(of: showDetectorDetails) { newValue in
                        if newValue {
                            print("Detector updating mapOffset")
                            self.mapOffset = self.size
                            print("Det Set mapOffset 3 \(self.mapOffset)")
                            //                        shouldShowRedOverlay = true
                        }
                    }
                }
            }
//        }
    }
}              


//#Preview {
//    let sizeBinding = Binding<CGSize>(
//        get: { CGSize(width: 10, height: 10) },
//        set: { _ in }
//    )
//    
//    let mapOffsetBinding = Binding<CGSize>(
//        get: { CGSize(width: 5, height: 5) },
//        set: { _ in }
//    )
//    
//    let showingDeleteDetectorOptionsBinding = Binding<Bool>(
//        get: { true },
//        set: { _ in }
//    )
//    
//    let showDetectorDetailsBinding = Binding<Bool>(
//        get: { true },
//        set: { _ in }
//    )
//    
//    let shouldShowRedOverlay = Binding<Bool>(
//        get: { true },
//        set: { _ in }
//    )
//    
//    let showRedOverlay = Binding<Bool>(
//        get: { false },
//        set: { _ in }
//    )
//    
//    let dragOffsetBinding = Binding<CGSize>(
//        get: { CGSize(width: 50, height: 50) },
//        set: { _ in }
//    )
//    return DetectorDetailOverlayView(
//        size: sizeBinding,
//        mapOffset: mapOffsetBinding,
//        sessionManager: SessionManager(),
//        showingDeleteDetectorOptions: showingDeleteDetectorOptionsBinding,
//        showDetectorDetails: showDetectorDetailsBinding,
//        dragOffset: dragOffsetBinding,
//        shouldShowRedOverlay: shouldShowRedOverlay,
//        showRedOverlay: showRedOverlay, didChangeSensorPosition: <#Binding<Bool>#>
//    )
//}
