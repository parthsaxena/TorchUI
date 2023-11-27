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
    
    var body: some View {
        VStack {
            Spacer()                        
            
            if (sessionManager.selectedPropertyIndex >= 0 && sessionManager.selectedPropertyIndex < sessionManager.properties.count && sessionManager.selectedDetectorIndex < sessionManager.properties[sessionManager.selectedPropertyIndex].detectors.count) {
                
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
                                    Spacer()
                                    
                                    Text("\(Int(sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].deviceBattery))%")
                                        .font(Font.custom("Manrope-SemiBold", size: 13.0))
                                        .foregroundColor(CustomColors.LightGray)
                                        .padding(.top, 20)
                                    let deviceBattery = sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].deviceBattery 
                                    BatteryView(batteryLevel: deviceBattery)
                                        .frame(width: 25, height: 10)
                                        .padding(.top, 20)
                                        .padding(.trailing, 15)
                                        .padding(.leading, 5)
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
                                            showingDeleteDetectorOptions.toggle()
                                        }
                                }
                                
                                HStack {
                                    Text("Fire Probability")
                                        .font(Font.custom("Manrope-Medium", size: 18.0))
                                        .kerning(-1)
                                        .foregroundColor(Color(red: 115.0/255.0, green: 136.0/255.0, blue: 140.0/255.0))
                                        .padding(.top, 1)
                                    Spacer()
                                }
                                .padding(.leading, 15)
                                HStack {
                                    let fireRating = Int(sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].measurements["fire_rating"] ?? "80")
                                    let highRisk = (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].threat == Threat.Red)
                                    let mediumRisk = !highRisk && (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].threat == Threat.Yellow)
                                    let riskText = highRisk ? "High Risk" : (mediumRisk ? "Medium Risk" : "Low Risk")
                                    let riskColor = highRisk ? CustomColors.TorchRed : (mediumRisk ? CustomColors.WarningYellow : CustomColors.GoodGreen)
                                    
                                    VStack {
                                        Text("\(sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].measurements["fire_rating"] ?? "80")%")
                                            .font(Font.custom("Manrope-SemiBold", size: 36.0))
                                            .kerning(-1)
                                            .foregroundColor(.white)
                                        
                                        Text(riskText)
                                            .font(Font.custom("Manrope-Bold", size: 14))
                                            .kerning(-0.5)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 0.8 * width / 3)
                                    //                            .frame(width: width / 3)
                                    .frame(height: width / 3 * 0.7)
                                    .background(riskColor)
                                    .cornerRadius(12.0)
                                    .shadow(color: CustomColors.DetectorDetailsShadow, radius: 12.0, x: 0.0, y: 4.0)
                                    .padding(.leading, 15)
                                    Spacer()
                                        .frame(width: 10)
                                    HStack {
                                        VStack(alignment: .leading) {
                                            HStack(spacing: 5) {
                                                Text("Temperature")
                                                    .font(Font.custom("Manrope-SemiBold", size: 13.0))
                                                    .kerning(-0.5)
                                                    .foregroundColor(CustomColors.LightGray)
                                                Image("Thermometer")
                                                    .resizable()
                                                    .frame(width: 20.0, height: 20.0)
                                            }
                                            
                                            HStack(spacing: 5) {
                                                Text("Humidity")
                                                    .font(Font.custom("Manrope-SemiBold", size: 13.0))
                                                    .kerning(-0.5)
                                                    .foregroundColor(CustomColors.LightGray)
                                                Image("Humidity")
                                                    .resizable()
                                                    .frame(width: 20.0, height: 20.0)
                                            }
                                        }
                                        .padding(.trailing, 12)
                                        VStack {
                                            Text("\(sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].measurements["temperature"] ?? "28")°C")
                                                .font(Font.custom("Manrope-Bold", size: 14.0))
                                                .foregroundColor(CustomColors.TorchRed)
                                            Spacer()
                                                .frame(height: 12)
                                            Text("\(sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].measurements["humidity"] ?? "85")%")
                                                .font(Font.custom("Manrope-Bold", size: 14.0))
                                                .foregroundColor(CustomColors.GoodGreen)
                                        }
                                        
                                        VStack(alignment: .trailing) {
                                            HStack(spacing: 1) {
                                                Image(systemName: "arrow.up")
                                                    .foregroundColor(CustomColors.LightGray)
                                                    .font(.system(size: 13.0))
                                                Text("2°C")
                                                    .font(Font.custom("Manrope-Bold", size: 14.0))
                                                    .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                                            }
                                            Spacer()
                                                .frame(height: 12)
                                            HStack(spacing: 1) {
                                                Image(systemName: "arrow.up")
                                                    .foregroundColor(CustomColors.LightGray)
                                                    .font(.system(size: 13.0))
                                                Text("5%")
                                                    .font(Font.custom("Manrope-Bold", size: 14.0))
                                                    .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                                            }
                                        }
                                        .padding(.leading, 7)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: width / 3 * 0.7)
                                    .background(colorScheme == .dark ? Color(red: 0.24, green: 0.26, blue: 0.27) : Color.white)
                                    .cornerRadius(12.0)
                                    .shadow(color: CustomColors.DetectorDetailsShadow, radius: 12.0, x: 0.0, y: 4.0)
                                    .padding(.trailing, 15)
                                }
                                
                                // Bottom 3 menus
                                HStack {
                                    // Thermal camera
                                    VStack {
                                        ZStack {
                                            HStack {
                                                Text("Thermal \ncamera")
                                                    .font(Font.custom("Manrope-SemiBold", size: 14.0))
                                                    .kerning(-0.5)
                                                    .foregroundColor(CustomColors.LightGray)
                                                
                                                Spacer()
                                            }
                                            .padding(.leading, 15)
                                            
                                            HStack {
                                                Spacer()
                                                
                                                Image(systemName: "info.circle")
                                                    .foregroundColor(CustomColors.LightGray)
                                            }
                                            .padding(.trailing, 15)
                                            .padding(.bottom, 15)
                                        }
                                        
                                        Spacer()
                                            .frame(height: 10)
                                        ZStack {
                                            HStack {
                                                let highRisk = (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].thermalStatus == Threat.Red)
                                                let mediumRisk = !highRisk && (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].thermalStatus == Threat.Yellow)
                                                let riskText = highRisk ? "Red alert" : (mediumRisk ? "Warning" : "Normal")
                                                let riskImage = highRisk ? "FireRed" : (mediumRisk ? "FireYellow" : "Checkmark")
                                                let riskColor = highRisk ? CustomColors.TorchRed : (mediumRisk ? CustomColors.WarningYellow : CustomColors.GoodGreen)
                                                if let image = UIImage(named: riskImage)?.cgImage, let imageOrientation = UIImage(named: riskImage)?.imageOrientation {
                                                    Text("\(riskText)  \(Image.init(uiImage: UIImage(cgImage: image, scale: 5.0, orientation: imageOrientation)))")
                                                        .font(Font.custom("Manrope-Bold", size: 14))
                                                        .kerning(-0.5)
                                                        .foregroundColor(riskColor)
                                                }
                                                Spacer()
                                            }
                                        }
                                        .padding(.horizontal, 15)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: (width - 60) / 3 * 0.8)
                                    .background(colorScheme == .dark ? Color(red: 0.24, green: 0.26, blue: 0.27) : Color(red: 1.0, green: 1.0, blue: 1.0))
                                    .cornerRadius(12.0)
                                    .shadow(color: CustomColors.DetectorDetailsShadow, radius: 12.0, x: 0.0, y: 4.0)
                                    .padding(.leading, 15)
                                    
                                    Spacer()
                                        .frame(width: 10)
                                    
                                    // Spectral Analysis
                                    VStack {
                                        ZStack {
                                            HStack {
                                                Text("Spectral \nanalysis")
                                                    .font(Font.custom("Manrope-SemiBold", size: 14.0))
                                                    .kerning(-0.5)
                                                    .foregroundColor(CustomColors.LightGray)
                                                
                                                Spacer()
                                            }
                                            .padding(.leading, 15)
                                            
                                            HStack {
                                                Spacer()
                                                
                                                Image(systemName: "info.circle")
                                                    .foregroundColor(CustomColors.LightGray)
                                            }
                                            .padding(.trailing, 15)
                                            .padding(.bottom, 15)
                                        }
                                        
                                        Spacer()
                                            .frame(height: 10)
                                        HStack {
                                            let highRisk = (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].spectralStatus == Threat.Red)
                                            let mediumRisk = !highRisk && (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].spectralStatus == Threat.Yellow)
                                            let riskText = highRisk ? "Red alert" : (mediumRisk ? "Warning" : "Normal")
                                            let riskImage = highRisk ? "FireRed" : (mediumRisk ? "FireYellow" : "Checkmark")
                                            let riskColor = highRisk ? CustomColors.TorchRed : (mediumRisk ? CustomColors.WarningYellow : CustomColors.GoodGreen)
                                            if let image = UIImage(named: riskImage)?.cgImage, let imageOrientation = UIImage(named: riskImage)?.imageOrientation {
                                                Text("\(riskText)  \(Image.init(uiImage: UIImage(cgImage: image, scale: 5.0, orientation: imageOrientation)))")
                                                    .font(Font.custom("Manrope-Bold", size: 14))
                                                    .kerning(-0.5)
                                                    .foregroundColor(riskColor)
                                            }
                                            Spacer()
                                        }
                                        .padding(.leading, 15)
                                    }
                                    .frame(width: (width - 45) / 3)
                                    .frame(height: (width - 60) / 3 * 0.8)
                                    .background(colorScheme == .dark ? Color(red: 0.24, green: 0.26, blue: 0.27) : Color.white)
                                    .cornerRadius(12.0)
                                    .shadow(color: CustomColors.DetectorDetailsShadow, radius: 12.0, x: 0.0, y: 4.0)
                                    
                                    Spacer()
                                        .frame(width: 10)
                                    // Smoke
                                    VStack {
                                        ZStack {
                                            HStack {
                                                Text("Smoke\n")
                                                    .font(Font.custom("Manrope-SemiBold", size: 14.0))
                                                    .kerning(-0.5)
                                                    .foregroundColor(CustomColors.LightGray)
                                                
                                                Spacer()
                                            }
                                            .padding(.leading, 15)
                                            
                                            HStack {
                                                Spacer()
                                                
                                                Image(systemName: "info.circle")
                                                    .foregroundColor(CustomColors.LightGray)
                                            }
                                            .padding(.trailing, 15)
                                            .padding(.bottom, 15)
                                        }
                                        
                                        Spacer()
                                            .frame(height: 10)
                                        HStack {
                                            let highRisk = (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].smokeStatus == Threat.Red)
                                            let mediumRisk = !highRisk && (sessionManager.properties[sessionManager.selectedPropertyIndex].detectors[sessionManager.selectedDetectorIndex].smokeStatus == Threat.Yellow)
                                            let riskText = highRisk ? "Red alert" : (mediumRisk ? "Warning" : "Normal")
                                            let riskImage = highRisk ? "FireRed" : (mediumRisk ? "FireYellow" : "Checkmark")
                                            let riskColor = highRisk ? CustomColors.TorchRed : (mediumRisk ? CustomColors.WarningYellow : CustomColors.GoodGreen)
                                            if let image = UIImage(named: riskImage)?.cgImage, let imageOrientation = UIImage(named: riskImage)?.imageOrientation {
                                                Text("\(riskText)  \(Image.init(uiImage: UIImage(cgImage: image, scale: 5.0, orientation: imageOrientation)))")
                                                .font(Font.custom("Manrope-Bold", size: 14))
                                                .kerning(-0.5)
                                                .foregroundColor(riskColor)
                                            }
                                            Spacer()
                                        }
                                        .padding(.leading, 15)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: (width - 60) / 3 * 0.8)
                                    .background(colorScheme == .dark ? Color(red: 0.24, green: 0.26, blue: 0.27) : Color.white)
                                    .cornerRadius(12.0)
                                    .shadow(color: CustomColors.DetectorDetailsShadow, radius: 12.0, x: 0.0, y: 4.0)
                                    .padding(.trailing, 15)
                                }
                                .padding(.bottom, 20)
                            }
                        }
                    }
                    //            .frame(width: width, height: 2.2 * height / 5)
                }
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
                    }
                }
            }
        }
    }
}
