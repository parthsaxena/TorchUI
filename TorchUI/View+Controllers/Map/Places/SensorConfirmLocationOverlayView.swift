//
//  SensorConfirmLocationOverlayView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI
import CoreLocation
import GoogleMaps
import CodeScanner
import MapboxMaps

struct SensorConfirmLocationOverlayView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height

    @Binding var mapOffset: CGSize
    @Binding var size: CGSize
    @Binding var markers: [GMSMarker]
    @Binding var pin: CLLocationCoordinate2D
    @Binding var selectedSensor: Detector?
    @Binding var isConfirmingLocation: Bool
    @State var nextButtonColor: Color = Color(red: 0.18, green: 0.21, blue: 0.22)
    @State var nextButtonEnabled: Bool = true

    @StateObject var sessionManager = SessionManager.shared
    
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
                    Spacer()
                        .frame(height: 15)
                    // Rows of sensors
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                                if let selectedSensor = selectedSensor {
                                    sessionManager.setDetectorCoordinate(detector: selectedSensor, coordinate: self.pin)
                                }
                                selectedSensor?.coordinate = self.pin
                                let sensorMarker = GMSMarker(position: self.pin)
                                sensorMarker.userData = selectedSensor?.id
                                let assetName = "NewSensorIcon\(selectedSensor?.sensorIdx ?? 0)"
                                var markerImage = UIImage(named: assetName)
                                if let image = markerImage?.cgImage, let imageOrientation = markerImage?.imageOrientation {
                                    markerImage = UIImage(cgImage: image, scale: 4.0, orientation: imageOrientation)
                                }
                                sensorMarker.icon = markerImage
                                
                                for i in 0..<self.markers.count {
                                    if self.markers[i].userData as? String == selectedSensor?.id {
                                        self.markers[i].map = nil
                                        self.markers.remove(at: i)
                                        break
                                    }
                                }
                                
                                self.markers.append(sensorMarker)
                                self.isConfirmingLocation = false
                            }) {
                                Text("Confirm position")
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
                            .disabled(!nextButtonEnabled)
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
                                        break
                                    }
                                }
                                
                                if let selectedSensor = selectedSensor {
                                    sessionManager.deleteNewDetector(detector: selectedSensor)
                                }
                                self.isConfirmingLocation = false
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
                        print("DESIRE \(geo.size)")
                    }.onChange(of: geo.size) { updatedSize in
                        self.size = updatedSize
                        self.mapOffset = geo.size
                    }
            })
        }
    }
}
