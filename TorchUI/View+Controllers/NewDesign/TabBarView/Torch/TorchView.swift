//
//  TorchView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 01/05/2024.
//

import SwiftUI
import GoogleMaps

struct TorchView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = MapViewModel()
    
    @State private var isSheetPresent = false
    @State private var isMenuSheetPresent = false
    @State private var isLayerSheetPresent = false
    @State private var isSort = false
    
    @State private var selectedLayerIndex = 0
    @State private var mapType: GMSMapViewType = .normal
    
    @State var opacity: CGFloat = 1.0
    @State private var sortText: String = "Temperature"
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                GoogleMapView(markers: $viewModel.markers, mapType: $mapType)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        VStack {
                            CustomRoundButton(imageName: "backButtonIcon", onCustomButtonTap: {
                                dismiss()
                            })
                            .opacity(0.0)
                            Spacer()
                        }
                        Spacer()
                        VStack {
                            CustomSegmentView(opacity: $opacity, segmentButtonTap: { selectedSegment in
                                print("\(selectedSegment)")
                            })
                            .padding(.vertical, 5)
                            if isSort {
                                HStack {
                                    Text("Sort:\(sortText)")
                                        .font(.custom("Manrope-SemiBold", size: 14))
                                        .foregroundColor(CustomColors.darkGray)
                                        .padding(.leading, 5)
                                        .kerning(-0.3)
                                    Button(action: {
                                        opacity = 1.0
                                        isSort = false
                                    }) {
                                        Image("home-cross")
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                    }
                                }
                                .frame(width: sortText == "Battery" || sortText == "Humidity" ? 125 : 150, height: 36)
                                .padding(.horizontal, 10)
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(color: CustomColors.LightGray, radius: 12, x: 0, y: 2)
                            }
                            Spacer()
                        }
                        Spacer()
                        VStack {
                            CustomRoundButton(imageName: "menu-01", onCustomButtonTap: {
                                isMenuSheetPresent = true
                            })
                            CustomRoundButton(imageName: "layerIcon", onCustomButtonTap: {
                                isLayerSheetPresent = true
                            })
                            CustomRoundButton(imageName: "navigationPointer", onCustomButtonTap: {
                                
                            })
                            Spacer()
                        }
                    }
                    .padding([.horizontal, .top])
                    Spacer()
                }
                .padding(.bottom, -32)
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
            .onAppear {
                viewModel.addMarker(latitude: 37.7749, longitude: -122.4194)
            }
            .background(.white)
            .sheet(isPresented: $isSheetPresent) {
                VStack {
                    SensorBottomSheet(onCrossButtonTap: {
                        isSheetPresent = false
                    }, onAddSensorButtonTap: {
                        isSheetPresent = false
                    }, onMuteSensorButtonTap: {
                        
                    }, onEditSensorButtonTap: {
                        
                    }, onAnalyticsButtonTap: {
                        
                    }, onDeleteLocationButtonTap: {
                        
                    })
                }
                .presentationDetents([.height(350), .height(350)])
                .presentationCornerRadius(25)
                .interactiveDismissDisabled(false)
            }
            .sheet(isPresented: $isMenuSheetPresent) {
                VStack {
                    MenuBottomSheet(onCrossButtonTap: {
                        isMenuSheetPresent = false
                    }, onFireDetectionButtonTap: {
                        sortText = ""
                        opacity = 1.0
                        isSort = false
                        isMenuSheetPresent = false
                    }, onBatteryButtonTap: {
                        sortText = "Battery"
                        opacity = 0.6
                        isSort = true
                        isMenuSheetPresent = false
                    }, onConnectionButtonTap: {
                        sortText = "Connection"
                        opacity = 0.6
                        isSort = true
                        isMenuSheetPresent = false
                    }, onTemperatureButtonTap: {
                        sortText = "Temperature"
                        opacity = 0.6
                        isSort = true
                        isMenuSheetPresent = false
                    }, onHumidityButtonTap: {
                        sortText = "Humidity"
                        opacity = 0.6
                        isSort = true
                        isMenuSheetPresent = false
                    })
                }
                .presentationDetents([.height(370.0), .height(370)])
                .presentationCornerRadius(25)
                .interactiveDismissDisabled(false)
            }
            .sheet(isPresented: $isLayerSheetPresent) {
                VStack {
                    LayerBottomSheet(selectedIndex: selectedLayerIndex, onCrossButtonTap: {
                        isLayerSheetPresent = false
                    }, onSelectedViewTap: { index in
                        selectedLayerIndex = index
                        mapType = index == 0 ? .normal : .satellite
                    })
                }
                .presentationDetents([.height(260.0), .height(260.0)])
                .presentationCornerRadius(25)
                .interactiveDismissDisabled(false)
            }
        }
    }
}

#Preview {
    TorchView()
}
