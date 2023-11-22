//
//  AddDetectorConfirmLocationOverlayView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI
import CoreLocation
import GoogleMaps
import CodeScanner
import MapboxMaps

struct AddDetectorConfirmLocationOverlayView: View {
    @Environment(\.colorScheme) var colorScheme
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    //    let property: Property
    
    @Binding var size: CGSize
    @Binding var annotations: [PointAnnotation]
    @Binding var pin: CLLocationCoordinate2D
    @Binding var newDetector: Detector?
    @Binding var isConfirmingLocation: Bool
    @State var nextButtonColor: Color = Color(red: 0.18, green: 0.21, blue: 0.22)
    @State var nextButtonEnabled: Bool = true
    @Binding var needsLocationPin: Bool
    //    @ObservedObject var sessionManager: SessionManager
    @StateObject var sessionManager = SessionManager.shared
    
    @Binding var newDetectorIndex: Int
    
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
                                
                                //                                sessionManager.setDetectorCoordinate(detector: newDetector!, coordinate: self.pin)
                                //                                self.annotations = []
                                newDetector?.coordinate = self.pin
                                
                                print("ADDDDING \(newDetectorIndex)")
                                SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[newDetectorIndex].coordinate = self.pin
                                print("Added 2, new detector count: \(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count)")
                                //                                SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[newDetectorIndex/*].coordinate = self.pin*/
                                //                                newDetector!.coordinate = self.pin
                                //                                SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.append(newDetector!)
                                print("Pin position: \(self.pin)")
                                print("Set coordinate: \(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[newDetectorIndex].coordinate ?? CLLocationCoordinate2D())")
                                
                                var pointAnnotation = PointAnnotation(id: newDetector!.id, coordinate: self.pin)
                                let annotationIcon = "NewSensorIcon\(newDetector!.sensorIdx!)"
                                
                                print("Created new sensor annotation with id: \(pointAnnotation.id)")
                                
                                let annotationImage = UIImage(named: annotationIcon)!
                                annotationImage.scale(newWidth: 1.0)
                                pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
                                //            pointAnnotation.image?.image.scale = 4.0
                                pointAnnotation.iconAnchor = .bottom
                                pointAnnotation.iconSize = 0.25
                                pointAnnotation.iconOffset = [40, 0]
                                
                                //                                self.annotations.append(pointAnnotation)
                                
                                //                                let sensorMarker = GMSMarker(position: self.pin)
                                //                                sensorMarker.userData = newDetector!.id
                                //                                let assetName = "NewSensorIcon\(newDetector!.sensorIdx!)"
                                //                                print("Got asset name: \(assetName)")
                                //                                var markerImage = UIImage(named: assetName)
                                //                                markerImage = UIImage(cgImage: (markerImage?.cgImage)!, scale: 4.0, orientation: (markerImage?.imageOrientation)!)
                                //                                sensorMarker.icon = markerImage
                                
                                //                                for i in 0..<self.annotations.count {
                                //                                    guard let id = self.annotations[i].id else {
                                //                                        continue
                                //                                    }
                                //
                                //                                    if id == newDetector!.id {
                                //                                        print("\(i) markers count before \(self.annotations.count)")
                                //                                        self.annotations.remove(at: i)
                                ////                                        self.markers[i].userData = "remove"
                                //                                        print("\(i) markers count after \(self.annotations.count)")
                                //
                                //                                        break
                                //                                    }
                                //                                }
                                //
                                //                                self.annotations.append(sensorMarker)
                                
                                SessionManager.shared.registerDevice(property: SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex], detector: SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[newDetectorIndex])
                                
                                //                                SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.append(newDetector!)
                                self.isConfirmingLocation = false
                                self.newDetector = nil
                                self.needsLocationPin = false
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
                                
                                for i in 0..<self.annotations.count {
                                    if self.annotations[i].id == newDetector!.id {
                                        print("\(i) markers count before \(self.annotations.count)")
                                        //                                        self.an[i].map = nil
                                        self.annotations.remove(at: i)
                                        //                                        self.markers[i].userData = "remove"
                                        print("\(i) markers count after \(self.annotations.count)")
                                        
                                        break
                                    }
                                }
                                
                                //                                for i in 0..<(SessionManager.shared.selectedProperty?.detectors.count)! {
                                //                                    if self.annotations[i].id as! String == newDetector!.id {
                                //                                        SessionManager.shared.selectedProperty?.detectors.remove(at: i)
                                //                                        break
                                //                                    }
                                //                                }
                                
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
            .overlay(GeometryReader { geo in
                Rectangle().fill(Color.clear).onAppear {
                    //                    self.size = geo.size
                }
            })
        }
    }
}
