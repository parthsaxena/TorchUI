//
//  SensorSetupOverlayView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI
import CoreLocation
import GoogleMaps
import CodeScanner
import MapboxMaps

struct SensorSetupOverlayView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height

    @Binding var mapOffset: CGSize
    @Binding var size: CGSize
    @Binding var markers: [GMSMarker]
    @State var nextButtonColor: Color = Color(red: 0.18, green: 0.21, blue: 0.22)
    @State var disabledButtonColor: Color = Color(red: 0.78, green: 0.81, blue: 0.82)
    @State var nextButtonEnabled: Bool = true

    @StateObject var sessionManager = SessionManager.shared
    @Binding var isPresentingScanner: Bool
    @Binding var isConfirmingLocation: Bool
    @Binding var selectedSensor: Detector?
    @Binding var selectedDetector: Detector?
    @Binding var sensorTapped: Bool
    
    @Binding var annotations: [PointAnnotation]
    @Binding var pin: CLLocationCoordinate2D
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .cornerRadius(15.0)
                    .ignoresSafeArea()
                    .foregroundColor(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                    .frame(maxHeight: .infinity)
                    .shadow(color: CustomColors.LightGray, radius: 2.0)
                
                VStack {
                    HStack(alignment: .center) {
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Sensor installation")
                                .font(Font.custom("Manrope-SemiBold", size: 24))
                                .foregroundColor(CustomColors.TorchGreen)
                            
                            Text("Select the sensor, then select the location and press the set button")
                                .font(Font.custom("Manrope-Medium", size: 16))
                                .foregroundColor(CustomColors.LightGray)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.top, 2.0)
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 18.0)
                    .padding(.top, 18.0)
                    .padding(.bottom, 8.0)
                    
                    Spacer()
                        .frame(height: 15)
                    
                    // Rows of sensors
                    VStack {
                        // 1st row
//                        var idx = 1
                        if (SessionManager.shared.newProperty != nil) {
                            HStack(spacing: 15.0) {
                                if let detectorsEnumerated = sessionManager.newProperty?.detectors.enumerated() {
                                    ForEach(Array(detectorsEnumerated), id: \.element) { idx, detector in
                                        VStack(spacing: 7.0) {
                                            ZStack {
                                                let strokeColor = detector.coordinate == nil ? Color(red: 0.78, green: 0.81, blue: 0.82) : Color.clear
                                                let bgColor = detector.coordinate == nil ? Color.clear : CustomColors.NormalSensorGray
                                                let fontColor = detector.coordinate == nil ? Color(red: 0.78, green: 0.81, blue: 0.82) : Color(red: 0.45, green: 0.53, blue: 0.55)
                                                Circle()
                                                    .stroke(strokeColor, lineWidth: 1)
                                                    .background(Circle().fill(bgColor))
                                                    .frame(width: 60.0, height: 60.0)
                                                Text("\(idx + 1)")
                                                    .font(Font.custom("Manrope-Medium", size: 18.0))
                                                    .foregroundColor(fontColor)
                                                Button {
                                                    self.selectedSensor = detector
                                                    self.selectedDetector = detector
                                                    self.sensorTapped = true
                                                } label: {
                                                    Circle()
                                                        .fill(Color.clear)
                                                        .frame(width: 60.0, height: 60.0)
                                                }
                                            }
                                            
                                            Circle()
                                                .fill(self.selectedSensor?.id == detector.id ? Color.black : Color.clear)
                                                .frame(width: 5, height: 5)
                                        }
                                    }
                                }
                                
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
                                    
                                    Circle()
                                        .fill(Color.clear)
                                        .frame(width: 5, height: 5)
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal, 15.0)
                        }
                        Spacer()
                            .frame(height: 20.0)
                        
                        HStack {
                            Spacer()
                            if let idx = selectedSensor == nil ? 1 : selectedSensor?.sensorIdx {
                                let verb = selectedSensor?.coordinate == nil ? "Set" : "Change"
                                
                                Button(action: {
                                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                    impactMed.impactOccurred()
                                    
                                    var pointAnnotation = PointAnnotation(id: selectedSensor?.id ?? "", coordinate: self.pin)
                                    let annotationIcon = "NewSensorIcon\(selectedSensor?.sensorIdx ?? 0)"
                                    let annotationImage = UIImage(named: annotationIcon)!
                                    pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
                                    pointAnnotation.iconAnchor = .bottom
                                    pointAnnotation.iconSize = 0.25
                                    pointAnnotation.iconOffset = [40, 0]
                                    
                                    self.annotations.append(pointAnnotation)
                                    self.isConfirmingLocation = true
                                }) {
                                    Text("\(verb) the position for sensor \(idx)")
                                        .font(.custom("Manrope-SemiBold", size: 16))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 60)
                                        .foregroundColor(.white)
                                        .background(
                                            RoundedRectangle(cornerRadius: 100)
                                                .foregroundColor(selectedSensor == nil ? self.disabledButtonColor : self.nextButtonColor)
                                        )
                                        .padding(.horizontal, 16)
                                        .padding(.bottom, 20)
                                }
                                .disabled(selectedSensor == nil)
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            Button {
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                                
                                for i in 0..<self.markers.count {
                                    if self.markers[i].userData as? String == selectedSensor?.id {
                                        self.markers[i].map = nil
                                        self.markers.remove(at: i)
                                    }
                                    break
                                }
                                if let selectedSensor = selectedSensor {
                                    sessionManager.deleteNewDetector(detector: selectedSensor)
                                }
                            } label: {
                                Text("Delete sensor")
                                    .font(Font.custom("Manrope-SemiBold", size: 16.0))
                                    .foregroundColor(CustomColors.LightGray)
                            }
                            Spacer()
                        }
                    }
                    .padding(.top, 10.0)
                    .padding(.bottom, 20.0)
                    Spacer()
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .ignoresSafeArea()
            .overlay(GeometryReader { geo in
                Rectangle().fill(Color.clear)
                    .onAppear {
                        self.size = geo.size
                        self.mapOffset = geo.size
                        print("DESIRE0 \(geo.size)")
                    }.onChange(of: geo.size) { updatedSize in
                        self.size = updatedSize
                        self.mapOffset = geo.size
                        print("DESIRE1 \(geo.size)")
                    }
            })
        }
    }
}
