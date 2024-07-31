//
//  PropertyDetails.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 23/06/2024.
//

import SwiftUI
import GoogleMaps
import MapboxMaps

struct PropertyDetails: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = MapViewModel()
    @State private var isSheetPresent = false
    @State private var isMenuSheetPresent = false
    @State private var isLayerSheetPresent = false
    
    @State private var selectedLayerIndex = 0
    
    @State private var offset: CGFloat = 0

    @State private var counter = 27
    @State private var counterHeigtht = 0.0
    let minOffset: CGFloat = 0
    @State private var maxOffset: CGFloat = 160
    
    @GestureState private var dragOffset: CGFloat = 0
    @State var isPresentingScanner: Bool = false
    
    @State var showAnimation = false
    @State private var mapType: GMSMapViewType = .normal
    
    @State private var isEditProperty = false
    @State private var isAddSensor = false
    
    @State private var sensorIDnumber = ""
    @State private var nickName = ""
    
    @State private var addSensorViewState: AddSensorViewState = .addSensorName
    @State private var selectedMapStyle: StyleURI = .streets
    
    var body: some View {
        ZStack {
            MapboxView(mapStyle: $selectedMapStyle)//(markers: $viewModel.markers, mapType: $mapType)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    VStack {
                        CustomRoundButton(imageName: "backButtonIcon", onCustomButtonTap: {
                            dismiss()
                        })
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
                VStack {
                    HStack {
                        Image("propery-avatar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .cornerRadius(12)
                            .padding(.horizontal, 8)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Neighborhood 1")
                                .font(.custom("Manrope-SemiBold", size: 20))
                                .foregroundColor(CustomColors.darkGray)
                                .kerning(-1.5)
                            Text("Pacific Coast Hwy, Malibu")
                                .font(.custom("Manrope-SemiBold", size: 16))
                                .foregroundColor(CustomColors.lightGrayText)
                                .kerning(-0.7)
                        }
                        Spacer()
                        Button(action: {
                            isSheetPresent = true
                        }) {
                            Image("dotIcon")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }
                        .padding(.trailing)
                    }
                    .frame(height: 76)
                    if counter == 0 {
                        if showAnimation {
                            HStack {
                                Spacer()
                                    .frame(width: 10)
                                CircleButtonWithAnimation(isPresentingScanner: $isPresentingScanner)
                                Spacer()
                            }
                        }
                    } else {
                        SensorItemView(counter: counter)
                    }
                    Spacer()
                }
                .frame(height: 80 + counterHeigtht)
                .background(.white)
                .cornerRadius(25)
                .offset(y: -offset + dragOffset) // Adjust the offset
                .animation(.interactiveSpring(), value: dragOffset)
                .gesture(
                    DragGesture()
                        .updating($dragOffset) { value, state, _ in
                            if value.location.y > 90 || value.translation.height >= 0 {
                                state = value.translation.height
                            }
                        }
                        .onEnded { value in
                            let dragHeight = value.translation.height
                            withAnimation(.spring()) {
                                if dragHeight > 0 {
                                    offset = minOffset - maxOffset
                                } else {
                                    offset = minOffset
                                }
                            }
                        }
                )
            }
            .padding(.bottom, -32)
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                showAnimation = true
            }
            
            if counter == 0 {
                counterHeigtht = 120
                maxOffset = counterHeigtht
            } else if counter < 8 {
                let mode: CGFloat = (counter % 7) == 0 ? 0 : 1
                counterHeigtht = 70.0 * (CGFloat(Int(counter / 7)) + mode)
                maxOffset = counterHeigtht
                viewModel.addMarker(latitude: 37.7749, longitude: -122.4194)
            } else {
                let mode: CGFloat = (counter % 7) == 0 ? 0 : 1
                counterHeigtht = 60.0 * (CGFloat(Int(counter / 7)) + mode)
                maxOffset = counterHeigtht
                viewModel.addMarker(latitude: 37.7749, longitude: -122.4194)
            }
        }
        .background(Color.clear)
        .sheet(isPresented: $isSheetPresent) {
            VStack {
                PropertyBottomSheet(onCrossButtonTap: {
                    isSheetPresent = false
                }, onAddSensorButtonTap: {
                    isSheetPresent = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        isAddSensor = true
                    }
                }, onMutePropertyButtonTap: {}, onEditPropertyButtonTap: {
                    isSheetPresent = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        isEditProperty = true
                    }
                }, onDeleteLocationButtonTap: {
                    isSheetPresent = false
                })
            }
            .presentationDetents([.height(290), .height(290)])
            .presentationCornerRadius(25)
            .interactiveDismissDisabled(false)
            .onAppear {
                withAnimation(.spring()) {
                    offset = minOffset - maxOffset
                }
            }
        }
        .sheet(isPresented: $isMenuSheetPresent) {
            VStack {
                MenuBottomSheet(onCrossButtonTap: {
                    isMenuSheetPresent = false
                }, onFireDetectionButtonTap: {
                    
                }, onBatteryButtonTap: {
                    
                }, onConnectionButtonTap: {
                    
                }, onTemperatureButtonTap: {
                    
                }, onHumidityButtonTap: {
                    
                })
            }
            .presentationDetents([.height(350.0), .height(350)])
            .presentationCornerRadius(25)
            .interactiveDismissDisabled(false)
            .onAppear {
                withAnimation(.spring()) {
                    offset = minOffset - maxOffset
                }
            }
        }
        .sheet(isPresented: $isLayerSheetPresent) {
            VStack {
                LayerBottomSheet(selectedIndex: selectedLayerIndex, onCrossButtonTap: {
                    isLayerSheetPresent = false
                }, onSelectedViewTap: { index in
                    selectedLayerIndex = index
                    mapType = index == 0 ? .normal : .satellite
                    selectedMapStyle = index == 0 ? .streets : .satelliteStreets
                })
            }
            .presentationDetents([.height(260.0), .height(260.0)])
            .presentationCornerRadius(25)
            .interactiveDismissDisabled(false)
            .onAppear {
                withAnimation(.spring()) {
                    offset = minOffset - maxOffset
                }
            }
        }
        .sheet(isPresented: $isEditProperty) {
            VStack {
                EditProperty(selectedIndex: 0, onCrossButtonTap: {
                    isEditProperty = false
                }, onSelectedViewTap: { index in
                    isEditProperty = false
                })
            }
            .presentationDetents([.large])
            .presentationCornerRadius(25)
            .interactiveDismissDisabled(false)
            .onAppear {
                withAnimation(.spring()) {
                    offset = minOffset - maxOffset
                }
            }
        }
        .sheet(isPresented: $isAddSensor) {
            VStack {
                if addSensorViewState == .addSensorName {
                    AddNewSensor(sensorIdNumber: $sensorIDnumber, addSensorViewState: $addSensorViewState, onCrossButtonTap: {
                        isAddSensor = false
                    })
                }
                
                if addSensorViewState == .addSensorProperty {
                    AddNewSensorProperty(addSensorViewState: $addSensorViewState, onCrossButtonTap: {
                        isAddSensor = false
                    })
                }
                
                if addSensorViewState == .addSensorNickName {
                    AddSensorNickname(nickName:  $nickName, addSensorViewState: $addSensorViewState, onCrossButtonTap: {
                        isAddSensor = false
                    })
                }
            }
            .presentationDetents([.large])
            .presentationCornerRadius(25)
            .interactiveDismissDisabled(false)
            .onAppear {
                withAnimation(.spring()) {
                    offset = minOffset - maxOffset
                }
            }
        }
    }
}

#Preview {
    PropertyDetails()
}
