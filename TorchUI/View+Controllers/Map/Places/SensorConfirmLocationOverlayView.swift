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
    //    let property: Property
    
    @Binding var mapOffset: CGSize
    @Binding var size: CGSize
    @Binding var markers: [GMSMarker]
    @Binding var pin: CLLocationCoordinate2D
    @Binding var selectedSensor: Detector?
    @Binding var isConfirmingLocation: Bool
    @State var nextButtonColor: Color = Color(red: 0.18, green: 0.21, blue: 0.22)
    @State var nextButtonEnabled: Bool = true
    //    @ObservedObject var sessionManager: SessionManager
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
                                //                                SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].loadingData = true
                                
                                sessionManager.setDetectorCoordinate(detector: selectedSensor!, coordinate: self.pin)
                                selectedSensor?.coordinate = self.pin
                                // print("Pin position: \(self.pin)")
                                // print("Set coordinate: \(selectedSensor?.coordinate)")
                                
                                let sensorMarker = GMSMarker(position: self.pin)
                                sensorMarker.userData = selectedSensor!.id
                                let assetName = "NewSensorIcon\(selectedSensor!.sensorIdx!)"
                                // print("Got asset name: \(assetName)")
                                var markerImage = UIImage(named: assetName)
                                markerImage = UIImage(cgImage: (markerImage?.cgImage)!, scale: 4.0, orientation: (markerImage?.imageOrientation)!)
                                sensorMarker.icon = markerImage
                                
                                //                                let sensorView = SensorIconView(sensorName: "1")
                                ////                                sensorView.sensorName = "1"
                                //                                let sensorMarker = GMSMarker(position: self.pin!.position)
                                //                                sensorMarker.iconView = sensorView!
                                //
                                //                                // print(sensorView.bounds)
                                
                                for i in 0..<self.markers.count {
                                    if self.markers[i].userData as! String == selectedSensor!.id {
                                        // print("\(i) markers count before \(self.markers.count)")
                                        self.markers[i].map = nil
                                        self.markers.remove(at: i)
                                        //                                        self.markers[i].userData = "remove"
                                        // print("\(i) markers count after \(self.markers.count)")
                                        
                                        break
                                    }
                                }
                                
                                self.markers.append(sensorMarker)
                                
                                // print("markers: \(self.markers)")
                                ////                                // print(sensorView.propertyImageView.image)
                                
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
                            
                            //                            Button("Confirm position") {
                            //                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                            //                                impactMed.impactOccurred()
                            //
                            //                                sessionManager.setDetectorCoordinate(detector: selectedSensor!, coordinate: self.pin)
                            //                                selectedSensor?.coordinate = self.pin
                            //                                // print("Pin position: \(self.pin)")
                            //                                // print("Set coordinate: \(selectedSensor?.coordinate)")
                            //
                            //                                let sensorMarker = GMSMarker(position: self.pin)
                            //                                sensorMarker.userData = selectedSensor!.id
                            //                                let assetName = "NewSensorIcon\(selectedSensor!.sensorIdx!)"
                            //                                // print("Got asset name: \(assetName)")
                            //                                var markerImage = UIImage(named: assetName)
                            //                                markerImage = UIImage(cgImage: (markerImage?.cgImage)!, scale: 4.0, orientation: (markerImage?.imageOrientation)!)
                            //                                sensorMarker.icon = markerImage
                            //
                            ////                                let sensorView = SensorIconView(sensorName: "1")
                            //////                                sensorView.sensorName = "1"
                            ////                                let sensorMarker = GMSMarker(position: self.pin!.position)
                            ////                                sensorMarker.iconView = sensorView!
                            ////
                            ////                                // print(sensorView.bounds)
                            //
                            //                                for i in 0..<self.markers.count {
                            //                                    if self.markers[i].userData as! String == selectedSensor!.id {
                            //                                        // print("\(i) markers count before \(self.markers.count)")
                            //                                        self.markers[i].map = nil
                            //                                        self.markers.remove(at: i)
                            ////                                        self.markers[i].userData = "remove"
                            //                                        // print("\(i) markers count after \(self.markers.count)")
                            //
                            //                                        break
                            //                                    }
                            //                                }
                            //
                            //                                self.markers.append(sensorMarker)
                            //
                            //                                // print("markers: \(self.markers)")
                            //////                                // print(sensorView.propertyImageView.image)
                            //
                            //                                self.isConfirmingLocation = false
                            //                            }
                            //                            .disabled(!nextButtonEnabled)
                            //                            .font(.custom("Manrope-SemiBold", size: 16))
                            //                            .frame(maxWidth: .infinity)
                            //                            .frame(height: 60)
                            //                            .foregroundColor(.white)
                            //                            .background(
                            //                                RoundedRectangle(cornerRadius: 100)
                            //                                    .foregroundColor(self.nextButtonColor)
                            //                            )
                            //                            .padding(.horizontal, 16)
                            //                            .padding(.bottom, 20)
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                                
                                for i in 0..<self.markers.count {
                                    if self.markers[i].userData as! String == selectedSensor!.id {
                                        // print("\(i) markers count before \(self.markers.count)")
                                        self.markers[i].map = nil
                                        self.markers.remove(at: i)
                                        //                                        self.markers[i].userData = "remove"
                                        // print("\(i) markers count after \(self.markers.count)")
                                        
                                        break
                                    }
                                }
                                
                                sessionManager.deleteNewDetector(detector: selectedSensor!)
                                
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
            //            .frame(width: width, height: 2.2 * height / 5)
            .fixedSize(horizontal: false, vertical: true)
            .ignoresSafeArea()
            //            .overlay(GeometryReader { geo in
            //                Rectangle().fill(Color.clear).onAppear {
            ////                    self.size = geo.size
            //                }
            //            })
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
