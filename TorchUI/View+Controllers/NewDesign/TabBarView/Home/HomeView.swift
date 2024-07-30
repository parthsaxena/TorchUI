//
//  HomeView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 01/05/2024.
//

import SwiftUI
//import AmplifyImage
enum AddPropertyViewState {
    case addPropertyName
    case addPropertyAddress
    case addPropertyPhoto
    case addPropertyCreated
}

struct HomeView: View {
    
    @State private var selectedSegment = 0
    @State private var isSheetPresented = false
    @State private var isEmpty = false
    @State private var isPropertyDetails: Bool = false
    @State private var isSensorDetails: Bool = false
    @State private var isAddSensor = false
    @State private var isAddProperty = false
    
    @State private var sensorIDnumber = ""
    @State private var nickName = ""
    
    @State private var propertyName = ""
    @State private var propertyAddress = ""
    
    @State private var addSensorViewState: AddSensorViewState = .addSensorName
    @State private var addPropertyViewState: AddPropertyViewState = .addPropertyName
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HomeHeadertView(isSheetPresented: $isSheetPresented)
                PickerView(segmentButtonTap: { value in
                    selectedSegment = value
                })
                .frame(height: 44)
                .padding(.top, -10)
                .padding(.horizontal)
                Spacer()
                if isEmpty {
                    EmptyListView(selectedSegment: $selectedSegment)
                    Spacer()
                } else {
                    ZStack {
                        HomeViewList(selectedSegment: $selectedSegment, onItemTap: { index in
                            isPropertyDetails = true
                        })
                        .frame(width: geometry.size.width)
                        .offset(x: selectedSegment == 0 ? 0 : -geometry.size.width)
                        HomeViewList(selectedSegment: $selectedSegment, onItemTap: { index in
                            isSensorDetails = true
                        })
                        .frame(width: geometry.size.width)
                        .offset(x: selectedSegment == 1 ? 0 : geometry.size.width)
                    }
                    .animation(.easeInOut, value: selectedSegment)
                }
            }
            .background(CustomColors.lightGrayBackground)
            .navigationBarItems(
                trailing: NavigationLink(destination: PropertyDetails(), isActive: $isPropertyDetails, label: {
                    PropertyDetails()
                })
            )
            .navigationBarItems(
                trailing: NavigationLink(destination: SensorDetails(), isActive: $isSensorDetails, label: {
                    SensorDetails()
                })
            )
            .background(Color.clear)
            .sheet(isPresented: $isSheetPresented) {
                VStack {
                    AddSensorOrPropertyView(headerName: "Options", onCrossButtonTap: {
                        isSheetPresented = false
                    }, onAddSensorButtonTap: {
                        isSheetPresented = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            isAddSensor = true
                        }
                    }, onCreatePropertyButtonTap: {
                        isSheetPresented = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                            isAddProperty = true
                        }
                    })
                }
                .presentationDetents([.height(200.0), .height(200)])
                .presentationCornerRadius(25)
                .interactiveDismissDisabled(false)
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
            }
            .sheet(isPresented: $isAddProperty) {
                VStack {
                    if addPropertyViewState == .addPropertyName {
                        AddNewPropertyName(propertyName: $propertyName, addPropertyViewState: $addPropertyViewState, onCrossButtonTap: {
                            isAddProperty = false
                        })
                    }
                    
                    if addPropertyViewState == .addPropertyAddress {
                        AddNewPropertyAddress(propertyAddress: $propertyAddress, addPropertyViewState: $addPropertyViewState, onCrossButtonTap: {
                            isAddProperty = false
                        })
                    }
                    
                    if addPropertyViewState == .addPropertyPhoto {
                        AddNewPropertyPhoto(addPropertyViewState: $addPropertyViewState, selectedIndex: 1, onCrossButtonTap: {
                            isAddProperty = false
                        }, onPhotoTypeViewTap: { index in
                            
                        })
                    }
                    
                    if addPropertyViewState == .addPropertyCreated {
                        AddNewPropertyCreated()
                    }
                }
                .presentationDetents([.large])
                .presentationCornerRadius(25)
                .interactiveDismissDisabled(false)
            }
        }
    }
}

#Preview {
    HomeView()
}
