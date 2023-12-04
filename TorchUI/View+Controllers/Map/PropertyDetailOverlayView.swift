//
//  PropertyDetailOverlayView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI
import CoreLocation
import GoogleMaps
import CodeScanner
import MapboxMaps

struct PropertyDetailOverlayView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var isPresentingScanner: Bool
    
    @Binding var zoomLevel: CGFloat
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    let property: Property
    
    @Binding var mapOffset: CGSize
    @Binding var size: CGSize
    @ObservedObject var sessionManager: SessionManager
    @Binding var selectedDetectorIndex: Int
    @Binding var showDetectorDetails: Bool
    @Binding var selectedDetector: Detector?
    @Binding var selectedMarker: GMSMarker?
    var detectors: [Detector]
    @Binding var annotations: [PointAnnotation]
    
    @Binding var newDetector: Detector?
    @Binding var isConfirmingLocation: Bool
    @State var nextButtonColor: Color = Color(red: 0.18, green: 0.21, blue: 0.22)
    
    @Binding var pin: CLLocationCoordinate2D
    @Binding var sensorTapped: Bool
    @Binding var showingOptions: Bool
    @Binding var dragOffset: CGSize
    
    var body: some View {
        VStack {
            Spacer()
            if SessionManager.shared.selectedPropertyIndex >= 0 && SessionManager.shared.selectedPropertyIndex < SessionManager.shared.properties.count {
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
                        VStack {
                            // Property heading
                            HStack(alignment: .center) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 60, height: 60)
                                    .background(
                                        AsyncImage(url: URL(string: property.propertyImage)) { image in
                                            image.resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 60, height: 60)
                                                .clipped()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    )
                                    .cornerRadius(12)
                                Spacer()
                                    .frame(width: 15)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(property.propertyName)
                                        .font(Font.custom("Manrope-SemiBold", size: 16))
                                        .kerning(-1)
                                        .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                                    
                                    let textSensor = "Sensor"
                                    let textSensors = "Sensors"
                                    let detectorCount = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count
                                    Text("\(detectorCount) \(detectorCount == 1 ? textSensor : textSensors)")
                                        .font(Font.custom("Manrope-Medium", size: 14))
                                        .kerning(-0.5)
                                        .foregroundColor(CustomColors.LightGray)
                                        .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .topLeading)
                                }
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .foregroundColor(CustomColors.LightGray)
                                    .background(
                                        Color.clear
                                            .padding(.trailing, 23.0)
                                            .padding(.top, 20)
                                    )
                                    .contentShape(Rectangle())// Makes the entire padded area tappable
                                    .onTapGesture {
                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                        impactMed.impactOccurred()
                                        print("Dots tapped")
                                        showingOptions.toggle()
                                    }
                            }
                            .padding(.horizontal, 18.0)
                            .padding(.top, 18.0)
                            .padding(.bottom, 8.0)
                            
                            Divider()
                                .padding(.horizontal, 15.0)
                            // Rows of sensors
                            let sensorSize = 60
                            let sensorRowCount = 5
                            let horizontalSpacing = 15
                            let availableRowSpace = UIScreen.main.bounds.width - CGFloat(2 * horizontalSpacing + sensorSize * sensorRowCount)
                            let sensorSpacing = availableRowSpace / CGFloat(sensorRowCount - 1)
                            
                            let x = print(sensorSpacing)
                            VStack(spacing: sensorSpacing) {
                                // row 1
                                HStack(spacing: sensorSpacing) {
                                    ForEach(0..<5, id: \.self) { i in
                                        if i < (SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count) {
                                            let d = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i]
                                            ZStack {
                                                
                                                if SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].threat == Threat.Red {
                                                    Circle()
                                                        .fill(CustomColors.TorchRed)
                                                        .frame(width: 60.0, height: 60.0)
                                                    Image("FireWhite")
                                                        .resizable()
                                                        .frame(width: 32, height: 32)
                                                    
                                                    Button {
                                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                        impactMed.impactOccurred()
                                                        selectedDetectorIndex = i
                                                        sensorTapped = true
                                                        selectedDetector = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i]
                                                        sessionManager.selectedDetectorIndex = i
                                                        withAnimation { showDetectorDetails.toggle(); dragOffset = .zero }
                                                        
                                                        zoomLevel = 15
                                                    } label: {
                                                        Circle()
                                                            .fill(Color.clear)
                                                            .frame(width: 60.0, height: 60.0)
                                                    }
                                                } else if SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].threat == Threat.Yellow {
                                                    Circle()
                                                        .fill(CustomColors.WarningYellow)
                                                        .frame(width: 60.0, height: 60.0)
                                                    Image("FireWhite")
                                                        .resizable()
                                                        .frame(width: 32, height: 32)
                                                    Button {
                                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                        impactMed.impactOccurred()
                                                        selectedDetectorIndex = i
                                                        sensorTapped = true
                                                        selectedDetector = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i]
                                                        sessionManager.selectedDetectorIndex = i
                                                        withAnimation { showDetectorDetails.toggle(); dragOffset = .zero }
                                                        
                                                        zoomLevel = 15
                                                    } label: {
                                                        Circle()
                                                            .fill(Color.clear)
                                                            .frame(width: 60.0, height: 60.0)
                                                    }
                                                } else if d.connected == false || (SessionManager.shared.latestTimestampDict.keys.contains(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].id) &&
                                                                                   SessionManager.shared.latestTimestampDict[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].id]?.timeIntervalSinceNow ?? 0 < -300) {
                                                    Circle()
                                                        .fill(Color(red: 0.67, green: 0.72, blue: 0.73))
                                                        .frame(width: 60.0, height: 60.0)
                                                    Image(systemName: "wifi.slash")
                                                        .resizable()
                                                        .frame(width: 22, height: 22 / 1.07)
                                                        .foregroundColor(.white)
                                                    Button {
                                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                        impactMed.impactOccurred()
                                                        sensorTapped = true
                                                        selectedDetectorIndex = i
                                                        selectedDetector = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i]
                                                        sessionManager.selectedDetectorIndex = i
                                                        withAnimation { showDetectorDetails.toggle(); dragOffset = .zero }
                                                        
                                                        zoomLevel = 15
                                                    } label: {
                                                        Circle()
                                                            .fill(Color.clear)
                                                            .frame(width: 60.0, height: 60.0)
                                                    }
                                                } else {
                                                    Circle()
                                                        .fill(colorScheme == .dark ? Color(red: 0.27, green: 0.32, blue: 0.33) : CustomColors.NormalSensorGray)
                                                        .frame(width: 60.0, height: 60.0)
                                                    Text("\(i + 1)")
                                                        .font(Font.custom("Manrope-Medium", size: 18.0))
                                                        .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                                                    Button {
                                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                        impactMed.impactOccurred()
                                                        sensorTapped = true
                                                        selectedDetectorIndex = i
                                                        selectedDetector = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i]
                                                        sessionManager.selectedDetectorIndex = i
                                                        withAnimation { showDetectorDetails.toggle(); dragOffset = .zero }
                                                        
                                                        zoomLevel = 15
                                                    } label: {
                                                        Circle()
                                                            .fill(Color.clear)
                                                            .frame(width: 60.0, height: 60.0)
                                                    }
                                                }
                                            }
                                        } else if (i == SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count) {
                                            // Add sensor button
                                            VStack(spacing: 7.0) {
                                                ZStack {
                                                    Circle()
                                                        .stroke(Color(red: 0.78, green: 0.81, blue: 0.82), lineWidth: 1)
                                                        .background(Circle().fill(Color.clear))
                                                        .frame(width: 60.0, height: 60.0)
                                                    Image(systemName: "plus")
                                                        .foregroundColor(Color(red: 0.78, green: 0.81, blue: 0.82))
                                                        .font(Font.system(size: 24.0))
                                                    Button {
                                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                        impactMed.impactOccurred()
                                                        
                                                        isPresentingScanner = true
                                                    } label: {
                                                        Circle()
                                                            .fill(Color.clear)
                                                            .frame(width: 60.0, height: 60.0)
                                                    }
                                                }
                                            }
                                        } else {
                                            ZStack {
                                                Circle()
                                                    .fill(Color.clear)
                                                    .frame(width: 60.0, height: 60.0)
                                            }
                                        }
                                    }
                                }
                                // row 2
                                //
                                if SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count >= 5 {
                                    HStack(spacing: sensorSpacing) {
                                        ForEach(5..<10, id: \.self) { i in
                                            if i < (SessionManager.shared.selectedProperty?.detectors.count ?? 0) {
                                                let d = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i]
                                                ZStack {
                                                    if SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].threat == Threat.Red {
                                                        Circle()
                                                            .fill(CustomColors.TorchRed)
                                                            .frame(width: 60.0, height: 60.0)
                                                        Image("FireWhite")
                                                            .resizable()
                                                            .frame(width: 32, height: 32)
                                                        Button {
                                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                            impactMed.impactOccurred()
                                                            selectedDetectorIndex = i
                                                            sensorTapped = true
                                                            selectedDetector = sessionManager.selectedProperty?.detectors.first(where: { detector in
                                                                detector.id == sessionManager.selectedProperty?.detectors[i].id
                                                            })
                                                            sessionManager.selectedDetectorIndex = i
                                                            withAnimation { showDetectorDetails.toggle(); dragOffset = .zero }
                                                            zoomLevel = 15
                                                        } label: {
                                                            Circle()
                                                                .fill(Color.clear)
                                                                .frame(width: 60.0, height: 60.0)
                                                        }
                                                    } else if SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].threat == Threat.Yellow {
                                                        Circle()
                                                            .fill(CustomColors.WarningYellow)
                                                            .frame(width: 60.0, height: 60.0)
                                                        Image("FireWhite")
                                                            .resizable()
                                                            .frame(width: 32, height: 32)
                                                        Button {
                                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                            impactMed.impactOccurred()
                                                            selectedDetectorIndex = i
                                                            sensorTapped = true
                                                            selectedDetector = sessionManager.selectedProperty?.detectors.first(where: { detector in
                                                                detector.id == sessionManager.selectedProperty?.detectors[i].id
                                                            })
                                                            sessionManager.selectedDetectorIndex = i
                                                            withAnimation { showDetectorDetails.toggle(); dragOffset = .zero }
                                                            zoomLevel = 15
                                                        } label: {
                                                            Circle()
                                                                .fill(Color.clear)
                                                                .frame(width: 60.0, height: 60.0)
                                                        }
                                                    } else if d.connected == false || SessionManager.shared.latestTimestampDict[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].id]?.timeIntervalSinceNow ?? 0 < -300 {
                                                        Circle()
                                                            .fill(Color(red: 0.67, green: 0.72, blue: 0.73))
                                                            .frame(width: 60.0, height: 60.0)
                                                        Image(systemName: "wifi.slash")
                                                            .resizable()
                                                            .frame(width: 22, height: 22 / 1.07)
                                                            .foregroundColor(.white)
                                                        Button {
                                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                            impactMed.impactOccurred()
                                                            selectedDetectorIndex = i
                                                            sensorTapped = true
                                                            selectedDetector = sessionManager.selectedProperty?.detectors.first(where: { detector in
                                                                detector.id == sessionManager.selectedProperty?.detectors[i].id
                                                            })
                                                            sessionManager.selectedDetectorIndex = i
                                                            withAnimation { showDetectorDetails.toggle(); dragOffset = .zero }
                                                            zoomLevel = 15
                                                        } label: {
                                                            Circle()
                                                                .fill(Color.clear)
                                                                .frame(width: 60.0, height: 60.0)
                                                        }
                                                    } else {
                                                        Circle()
                                                            .fill(colorScheme == .dark ? Color(red: 0.27, green: 0.32, blue: 0.33) : CustomColors.NormalSensorGray)
                                                            .frame(width: 60.0, height: 60.0)
                                                        Text("\(i + 1)")
                                                            .font(Font.custom("Manrope-Medium", size: 18.0))
                                                            .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                                                        Button {
                                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                            impactMed.impactOccurred()
                                                            selectedDetectorIndex = i
                                                            sensorTapped = true
                                                            selectedDetector = sessionManager.selectedProperty?.detectors.first(where: { detector in
                                                                detector.id == sessionManager.selectedProperty?.detectors[i].id
                                                            })
                                                            sessionManager.selectedDetectorIndex = i
                                                            withAnimation { showDetectorDetails.toggle(); dragOffset = .zero }
                                                            
                                                            zoomLevel = 15
                                                        } label: {
                                                            Circle()
                                                                .fill(Color.clear)
                                                                .frame(width: 60.0, height: 60.0)
                                                        }
                                                    }
                                                }
                                            } else if (i == SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count) {
                                                // Add sensor button
                                                VStack(spacing: 7.0) {
                                                    ZStack {
                                                        Circle()
                                                            .stroke(Color(red: 0.78, green: 0.81, blue: 0.82), lineWidth: 1)
                                                            .background(Circle().fill(Color.clear))
                                                            .frame(width: 60.0, height: 60.0)
                                                        Image(systemName: "plus")
                                                            .foregroundColor(Color(red: 0.78, green: 0.81, blue: 0.82))
                                                            .font(Font.system(size: 24.0))
                                                        Button {
                                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                            impactMed.impactOccurred()
                                                            
                                                            isPresentingScanner = true
                                                        } label: {
                                                            Circle()
                                                                .fill(Color.clear)
                                                                .frame(width: 60.0, height: 60.0)
                                                        }
                                                    }
                                                }
                                            } else {
                                                ZStack {
                                                    Circle()
                                                        .fill(Color.clear)
                                                        .frame(width: 60.0, height: 60.0)
                                                }
                                            }
                                        }
                                    }
                                }
                                // row 3
                                if SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count >= 10 {
                                    HStack(spacing: sensorSpacing) {
                                        ForEach(10..<15, id: \.self) { i in
                                            if i < (SessionManager.shared.selectedProperty?.detectors.count ?? 0) {
                                                let d = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i]
                                                ZStack {
                                                    if SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].threat == Threat.Red {
                                                        Circle()
                                                            .fill(CustomColors.TorchRed)
                                                            .frame(width: 60.0, height: 60.0)
                                                        Image("FireWhite")
                                                            .resizable()
                                                            .frame(width: 32, height: 32)
                                                        Button {
                                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                            impactMed.impactOccurred()
                                                            selectedDetectorIndex = i
                                                            selectedDetector = sessionManager.selectedProperty?.detectors.first(where: { detector in
                                                                detector.id == sessionManager.selectedProperty?.detectors[i].id
                                                            })
                                                            sensorTapped = true
                                                            sessionManager.selectedDetectorIndex = i
                                                            withAnimation { showDetectorDetails.toggle(); dragOffset = .zero }
                                                            
                                                            zoomLevel = 15
                                                        } label: {
                                                            Circle()
                                                                .fill(Color.clear)
                                                                .frame(width: 60.0, height: 60.0)
                                                        }
                                                    } else if SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].threat == Threat.Yellow {
                                                        Circle()
                                                            .fill(CustomColors.WarningYellow)
                                                            .frame(width: 60.0, height: 60.0)
                                                        Image("FireWhite")
                                                            .resizable()
                                                            .frame(width: 32, height: 32)
                                                        Button {
                                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                            impactMed.impactOccurred()
                                                            selectedDetectorIndex = i
                                                            sensorTapped = true
                                                            selectedDetector = sessionManager.selectedProperty?.detectors.first(where: { detector in
                                                                detector.id == sessionManager.selectedProperty?.detectors[i].id
                                                            })
                                                            sessionManager.selectedDetectorIndex = i
                                                            withAnimation { showDetectorDetails.toggle(); dragOffset = .zero }
                                                            
                                                            zoomLevel = 15
                                                        } label: {
                                                            Circle()
                                                                .fill(Color.clear)
                                                                .frame(width: 60.0, height: 60.0)
                                                        }
                                                    } else if d.connected == false || SessionManager.shared.latestTimestampDict[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].id]?.timeIntervalSinceNow ?? 0 < -300 {
                                                        Circle()
                                                            .fill(Color(red: 0.67, green: 0.72, blue: 0.73))
                                                            .frame(width: 60.0, height: 60.0)
                                                        Image(systemName: "wifi.slash")
                                                            .resizable()
                                                            .frame(width: 22, height: 22 / 1.07)
                                                            .foregroundColor(Color.white)
                                                        Button {
                                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                            impactMed.impactOccurred()
                                                            selectedDetectorIndex = i
                                                            sensorTapped = true
                                                            selectedDetector = sessionManager.selectedProperty?.detectors.first(where: { detector in
                                                                detector.id == sessionManager.selectedProperty?.detectors[i].id
                                                            })
                                                            withAnimation { showDetectorDetails.toggle(); dragOffset = .zero }
                                                            zoomLevel = 15
                                                        } label: {
                                                            Circle()
                                                                .fill(Color.clear)
                                                                .frame(width: 60.0, height: 60.0)
                                                        }
                                                    } else {
                                                        Circle()
                                                            .fill(colorScheme == .dark ? Color(red: 0.27, green: 0.32, blue: 0.33) : CustomColors.NormalSensorGray)
                                                            .frame(width: 60.0, height: 60.0)
                                                        Text("\(i + 1)")
                                                            .font(Font.custom("Manrope-Medium", size: 18.0))
                                                            .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                                                        Button {
                                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                            impactMed.impactOccurred()
                                                            selectedDetectorIndex = i
                                                            sensorTapped = true
                                                            selectedDetector = sessionManager.selectedProperty?.detectors.first(where: { detector in
                                                                detector.id == sessionManager.selectedProperty?.detectors[i].id
                                                            })
                                                            sessionManager.selectedDetectorIndex = i
                                                            withAnimation { showDetectorDetails.toggle(); dragOffset = .zero }
                                                            zoomLevel = 15
                                                        } label: {
                                                            Circle()
                                                                .fill(Color.clear)
                                                                .frame(width: 60.0, height: 60.0)
                                                        }
                                                    }
                                                }
                                            } else if (i == SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count) {
                                                // Add sensor button
                                                VStack(spacing: 7.0) {
                                                    ZStack {
                                                        Circle()
                                                            .stroke(Color(red: 0.78, green: 0.81, blue: 0.82), lineWidth: 1)
                                                            .background(Circle().fill(Color.clear))
                                                            .frame(width: 60.0, height: 60.0)
                                                        Image(systemName: "plus")
                                                            .foregroundColor(Color(red: 0.78, green: 0.81, blue: 0.82))
                                                            .font(Font.system(size: 24.0))
                                                        Button {
                                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                            impactMed.impactOccurred()
                                                            
                                                            isPresentingScanner = true
                                                        } label: {
                                                            Circle()
                                                                .fill(Color.clear)
                                                                .frame(width: 60.0, height: 60.0)
                                                        }
                                                    }
                                                }
                                            } else {
                                                ZStack {
                                                    Circle()
                                                        .fill(Color.clear)
                                                        .frame(width: 60.0, height: 60.0)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.top, 10.0)
                            .padding(.bottom, 20.0)
                            if newDetector != nil {
                                HStack {
                                    Spacer()
                                    let verb = newDetector?.coordinate == nil ? "Set" : "Change"
                                    Button(action: {
                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                        impactMed.impactOccurred()
                                        let x = print("Added 1.5, new detector count: \(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count), \(SessionManager.shared.selectedProperty?.detectors.count ?? 0)")
                                        if SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count < SessionManager.shared.selectedProperty?.detectors.count ?? 0 {
                                            if let detector = SessionManager.shared.selectedProperty?.detectors.last {
                                                SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.append(detector)
                                            }
                                        }
                                        self.isConfirmingLocation = true
                                        var pointAnnotation = PointAnnotation(id: newDetector?.id ?? "", coordinate: self.pin)
                                        let annotationIcon = "NewSensorIcon\(newDetector?.sensorIdx ?? 0)"
                                        if let annotationImage = UIImage(named: annotationIcon) {
                                            pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
                                        }
                                        pointAnnotation.iconAnchor = .bottom
                                        pointAnnotation.iconSize = 0.25
                                        pointAnnotation.iconOffset = [40, 0]
                                        self.annotations.append(pointAnnotation)
                                        print("Created new sensor annotation with id: \(pointAnnotation.id)")
                                    }) {
                                        Text("\(verb) the position for new sensor")
                                            .font(.custom("Manrope-SemiBold", size: 16))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 60)
                                            .foregroundColor(.white)
                                            .background(
                                                RoundedRectangle(cornerRadius: 100)
                                                    .foregroundColor(self.nextButtonColor)
                                            )
                                            .padding(.horizontal, 16)
                                            .padding(.bottom, 20)
                                    }
                                    Spacer()
                                }
                                Spacer()
                            }
                        }
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .overlay(GeometryReader { geo in
                    Rectangle().fill(Color.clear)
                        .onAppear {
                            self.size = geo.size
                            if !showDetectorDetails {
                                self.mapOffset = geo.size
                                print("Set mapOffset 1 \(self.mapOffset)")
                            }
                        }.onChange(of: geo.size) { updatedSize in
                            if !showDetectorDetails {
                                self.size = updatedSize
                                self.mapOffset = geo.size
                                print("Set mapOffset 2 \(self.mapOffset)")
                            }
                        }
                        .onChange(of: showDetectorDetails) { newValue in
                            if !newValue {
                                print("Property updating mapOffset")
                                self.mapOffset = self.size
                            }
                        }
                })
            }
        }
    }
}
