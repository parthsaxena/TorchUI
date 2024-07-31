//
//  SensorDetails.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 06/07/2024.
//

import SwiftUI
import GoogleMaps
import MapboxMaps

enum AddSensorViewState {
    case addSensorName
    case addSensorProperty
    case addSensorNickName
}

struct SensorDetails: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = MapViewModel()
    @State private var isSheetPresent = false
    @State private var isMenuSheetPresent = false
    @State private var isLayerSheetPresent = false
    
    @State private var selectedLayerIndex = 0
    @State private var offset: CGFloat = 0

    let minOffset: CGFloat = 0
    @State private var maxOffset: CGFloat = 310
    
    @GestureState private var dragOffset: CGFloat = 0
    @State private var showToast = false
    @State private var showPopup = false
    @State private var showFireAlert = false
    @State private var sensorPopupHeight: CGFloat = 390
    @State private var mapType: GMSMapViewType = .normal
    @State private var viewHeight: CGFloat = 450
    
    @State private var isAddSensor = false
    @State private var isEditSensor = false
    
    @State private var sensorIDnumber = ""
    @State private var nickName = ""
    
    @State private var addSensorViewState: AddSensorViewState = .addSensorName
    @State private var selectedMapStyle: StyleURI = .streets
    
    var body: some View {
        GeometryReader { geometry in
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
                            LocationSharedView()
                                .padding([.top, .horizontal], 5)
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
                                showFireAlert = true
                                sensorPopupHeight = 494
                            })
                            Spacer()
                        }
                    }
                    .padding([.horizontal, .top])
                    Spacer()
                    VStack {
                        if showFireAlert {
                            VStack {
                                HStack {
                                    VStack {
                                        Image("property-warning")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .padding(.leading, 10)
                                            .padding(.top, 20)
                                            .foregroundColor(CustomColors.TorchBlue)
                                        Spacer()
                                    }
                                    .padding(.leading, 5)
                                    HStack {
                                        Text("Poll:")
                                            .font(Font.custom("Manrope-Bold", size: 16))
                                            .padding(.leading, 5)
                                            .foregroundColor(CustomColors.TorchBlue)
                                        Text("Is the torch sensor wrong?")
                                            .font(Font.custom("Manrope-SemiBold", size: 16))
                                            .padding(.leading, 0)
                                            .padding(.trailing)
                                            .foregroundColor(CustomColors.TorchBlue)
                                    }
                                    .padding(.top, 10)
                                    Spacer()
                                    VStack {
                                        Image("warning-cross")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .padding(.trailing, 10)
                                            .padding(.top, 20)
                                            .foregroundColor(CustomColors.TorchBlue)
                                        Spacer()
                                    }
                                    .padding(.trailing, 5)
                                }
                                Spacer()
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        showPopup = true
                                    }) {
                                        Text("Confirm fire")
                                            .font(.custom("Manrope-SemiBold", size: 14))
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 165, height: 36)
                                    .background(CustomColors.TorchBlue)
                                    .cornerRadius(18)
                                    .padding(.horizontal, 5)
                                    Button(action: {
                                        showFireAlert = false
                                        sensorPopupHeight = 390
                                    }) {
                                        Text("No fire")
                                            .font(.custom("Manrope-SemiBold", size: 14))
                                            .foregroundColor(CustomColors.TorchBlue)
                                    }
                                    .frame(width: 165, height: 36)
                                    .background(.clear)
                                    .cornerRadius(18)
                                    .padding(.horizontal, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 18)
                                            .stroke(CustomColors.TorchBlue, lineWidth: 1) // Border with white color
                                    )
                                    Spacer()
                                }
                                Spacer()
                                    .frame(height: 20)
                            }
                            .frame(height: 104)
                            .background(CustomColors.TorchBlue.opacity(0.15))
                        }
//                        .padding(.horizontal, -30)
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                HStack {
                                    Text("Bard yard #3")
                                        .font(.custom("Manrope-SemiBold", size: 20))
                                        .foregroundColor(CustomColors.darkGray)
                                        .kerning(-0.5)
                                    Image("volume-x")
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 16, height: 16)
                                        .padding(.top, 4)
                                    Spacer()
                                }
                                Text("Neighborhood 1. Sensor 3")
                                    .font(.custom("Manrope-Medium", size: 16))
                                    .foregroundColor(CustomColors.lightGrayText)
                                    .kerning(-0.3)
                            }
                            .padding(.leading, 20)
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
                        VStack {
                            HStack {
                                VStack {
                                    Text("2%")
                                        .font(.custom("Manrope-SemiBold", size: 40))
                                        .foregroundColor(.white)
                                        .kerning(-1.5)
                                    Text("Chance of fire")
                                        .font(.custom("Manrope-SemiBold", size: 14))
                                        .foregroundColor(.white)
                                        .kerning(-0.7)
                                }
                                .frame(width: 115, height: 108)
                                .background(CustomColors.green)
                                .cornerRadius(8)
                                VStack(spacing: 5) {
                                    HStack {
                                        Text("Thermal camera")
                                            .font(.custom("Manrope-SemiBold", size: 14))
                                            .foregroundColor(CustomColors.lightGrayText)
                                            .kerning(-0.3)
                                            .padding(.leading, 15)
                                        Spacer()
                                        Text("Normal")
                                            .font(.custom("Manrope-Bold", size: 14))
                                            .foregroundColor(CustomColors.green)
                                            .kerning(-0.3)
                                        Image("rightTick")
                                            .frame(width: 16, height: 16)
                                            .tint(CustomColors.green)
                                            .padding(.trailing, 15)
                                    }
                                    HStack {
                                        Text("Spectral analysis")
                                            .font(.custom("Manrope-SemiBold", size: 14))
                                            .foregroundColor(CustomColors.lightGrayText)
                                            .kerning(-0.3)
                                            .padding(.leading, 15)
                                        Spacer()
                                        Text("Normal")
                                            .font(.custom("Manrope-Bold", size: 14))
                                            .foregroundColor(CustomColors.green)
                                            .kerning(-0.3)
                                        Image("rightTick")
                                            .frame(width: 16, height: 16)
                                            .tint(CustomColors.green)
                                            .padding(.trailing, 15)
                                    }
                                    HStack {
                                        Text("Smoke")
                                            .font(.custom("Manrope-SemiBold", size: 14))
                                            .foregroundColor(CustomColors.lightGrayText)
                                            .kerning(-0.3)
                                            .padding(.leading, 15)
                                        Spacer()
                                        Text("Normal")
                                            .font(.custom("Manrope-Bold", size: 14))
                                            .foregroundColor(CustomColors.green)
                                            .kerning(-0.3)
                                        Image("rightTick")
                                            .frame(width: 16, height: 16)
                                            .tint(CustomColors.green)
                                            .padding(.trailing, 15)
                                    }
                                }
                                .frame(height: 108)
                                .background(.white)
                                //                            .padding(.leading, 8)
                                //                            .padding(.trailing, 0)
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                        VStack {
                            HStack {
                                VStack(spacing: 5) {
                                    HStack {
                                        Text("Internal temperature")
                                            .font(.custom("Manrope-SemiBold", size: 14))
                                            .foregroundColor(CustomColors.lightGrayText)
                                            .kerning(-0.3)
                                            .padding(.leading, 15)
                                        Spacer()
                                        Text("96°F")
                                            .font(.custom("Manrope-Bold", size: 14))
                                            .foregroundColor(CustomColors.green)
                                            .kerning(-0.3)
                                            .padding(.trailing, 15)
                                    }
                                    HStack {
                                        Text("Internal humidity")
                                            .font(.custom("Manrope-SemiBold", size: 14))
                                            .foregroundColor(CustomColors.lightGrayText)
                                            .kerning(-0.3)
                                            .padding(.leading, 15)
                                        Spacer()
                                        Text("86%")
                                            .font(.custom("Manrope-Bold", size: 14))
                                            .foregroundColor(CustomColors.green)
                                            .kerning(-0.3)
                                            .padding(.trailing, 15)
                                    }
                                }
                                .frame(height: 80)
                                .background(.white)
                                .cornerRadius(8)
                                VStack(spacing: 5) {
                                    Image("BatteryIcon")
                                        .frame(width: 32, height: 32)
                                        .tint(CustomColors.green)
                                    Text("100%")
                                        .font(.custom("Manrope-SemiBold", size: 14))
                                        .foregroundColor(CustomColors.lightGrayText)
                                        .kerning(-0.7)
                                }
                                .frame(width: 64, height: 80)
                                .background(.white)
                                .cornerRadius(8)
                                VStack(spacing: 5) {
                                    Image("wifi 1")
                                        .frame(width: 32, height: 32)
                                        .tint(CustomColors.green)
                                    Text("9 min")
                                        .font(.custom("Manrope-SemiBold", size: 14))
                                        .foregroundColor(CustomColors.lightGrayText)
                                        .kerning(-0.7)
                                }
                                .frame(width: 64, height: 80)
                                .background(.white)
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                        VStack {
                            HStack(spacing: 2) {
                                Text("Air quality:")
                                    .font(.custom("Manrope-SemiBold", size: 14))
                                    .foregroundColor(CustomColors.lightGrayText)
                                    .kerning(-0.7)
                                    .padding(.leading, 15)
                                Text("normal")
                                    .font(.custom("Manrope-SemiBold", size: 14))
                                    .foregroundColor(CustomColors.darkGray)
                                    .kerning(-0.7)
                                    .padding(.leading, 5)
                                Spacer()
                            }
                            ZStack {
                                HStack {
                                    Text("")
                                }
                                .padding(.vertical, 5)
                                .background(.white)
                                .frame(width: 6, height: 20)
                                .padding(.leading, 100)
                                .cornerRadius(3)
                            }
                            .frame(width: (geometry.size.width - 60), height: 30)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.red, Color.green]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(15)
                            .overlay(
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 6, height: 25)
                                    .cornerRadius(3)
                            )
                        }
                        .frame(height: 84)
                        .background(.white)
                        .clipShape(RoundedCorner(topLeft: 8, topRight: 8, bottomLeft: 36, bottomRight: 36))
                        .padding(.horizontal)
                        Spacer()
                    }
                    .frame(height: sensorPopupHeight)
                    .background(CustomColors.lighterBackgroundGray)
                    .cornerRadius(25)
                    .offset(y: -offset + dragOffset) // Adjust the offset
                    .animation(.interactiveSpring(), value: dragOffset)
                    .gesture(
                        DragGesture()
                            .updating($dragOffset) { value, state, _ in
//                                print("height \(value.location.y) \(value.translation.height ) \(state)")
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
                sensorPopupHeight = showFireAlert ? 494 : 390
                viewModel.addMarker(latitude: 37.7749, longitude: -122.4194)
            }
            .background(.white)
            .sheet(isPresented: $isSheetPresent) {
                VStack {
                    SensorBottomSheet(onCrossButtonTap: {
                        isSheetPresent = false
                    }, onAddSensorButtonTap: {
                        isSheetPresent = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            isAddSensor = true
                        }
                    }, onMuteSensorButtonTap: {
                        isSheetPresent = false
                    }, onEditSensorButtonTap: {
                        isSheetPresent = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            isEditSensor = true
                        }
                    }, onAnalyticsButtonTap: {
                        isSheetPresent = false
                    }, onDeleteLocationButtonTap: {
                        isSheetPresent = false
                    })
                }
                .presentationDetents([.height(350), .height(350)])
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
                .presentationDetents([.height(370.0), .height(370)])
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
            .sheet(isPresented: $isEditSensor) {
                VStack {
                    EditSensor(onCrossButtonTap: {
                        isEditSensor = false
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
            .toast(isShowing: $showToast, message: "Fire confirmed! Thanks!")
            .popup(isShowing: $showPopup, viewHeight: $viewHeight) {
                CustomPopupView(onSendButtonTap: {
                    sensorPopupHeight = 390
                    showFireAlert = false
                    showPopup = false
                    showToast = true
                }, onCancelButtonTap: {
                    showPopup = false
                })
            }
        }
    }
}

#Preview {
    SensorDetails()
}

struct LocationSharedView: View {
    
    var body: some View {
        HStack {
            Text("38.75829, 121.09201")
                .font(.custom("Manrope-Bold", size: 14))
                .foregroundColor(CustomColors.darkGray)
                .padding(.trailing, 2)
            Button(action: {
                
            }) {
                Image("share-07")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
        }
        .frame(height: 36)
        .padding(.horizontal, 10)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: CustomColors.LightGray, radius: 12, x: 0, y: 2)
    }
}
