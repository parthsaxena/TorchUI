//
//  AddNewSensorProperty.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 22/07/2024.
//

import SwiftUI

struct AddNewSensorProperty: View {
    
    @Environment(\.colorScheme) var colorScheme
//    @Binding var sensorIdNumber: String
    @Binding var addSensorViewState: AddSensorViewState
    var onCrossButtonTap: () -> Void
    
    @FocusState private var focusedField: FocusField?
    
    @State private var isPropertyList: Bool = false
    @State private var search = ""
    
    var body: some View {
        VStack {
            HStack(spacing: 4.0) {
                let progressItemWidth = (UIScreen.main.bounds.width - 50) / 3
                
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(width: progressItemWidth, height: 4)
                    .foregroundColor(CustomColors.TorchGreen)
                
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(width: progressItemWidth, height: 4)
                    .foregroundColor(CustomColors.TorchGreen)
                
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(width: progressItemWidth, height: 4)
                    .foregroundColor(Color(red: 227/255, green: 231/255, blue: 232/255))
            }
            .padding(.top, 10)
            ZStack {
                HStack {
                    CustomRoundButton(imageName: "backButtonIcon", onCustomButtonTap: {
                        addSensorViewState = .addSensorName
                    })
                    Spacer()
                    VStack {
                        Text("Add new sensor")
                            .font(Font.custom("Manrope-SemiBold", size: 18.0))
                            .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                        Text("Step 2: Link sensor to a property")
                            .font(Font.custom("Manrope-Regular", size: 16))
                            .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                    }
                    Spacer()
                    Circle()
                        .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                        .frame(width: 40, height: 40)
                        .background(Circle().fill(Color.white))
                        .shadow(color: .gray.opacity(0.15), radius: 5, x: 0, y: 2)
                        .padding()
                        .overlay(
                            Image("home-cross")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .background(Color.white)
                                .clipShape(Circle())
                        )
                        .onTapGesture {
                            onCrossButtonTap()
                        }
                }
            }
            .padding(.top, 10)
            .padding(.leading, 15)
            
            Spacer()
            
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                        withAnimation {
                            isPropertyList = true
                        }
                    }) {
                        HStack {
                            Text("No property")
                                .font(.custom("Manrope-SemiBold", size: 30))
                                .foregroundColor(colorScheme == .dark ? CustomColors.TorchGreen : CustomColors.darkGray)
                            Image("chevron-down")
                                .frame(width: 20, height: 20)
                        }
                    }
                    Text("Link sensor to a property")
                        .font(Font.custom("Manrope-Medium", size: 16.0))
                        .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                }
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    withAnimation {
                        addSensorViewState = .addSensorNickName
                    }
                }) {
                    Text("Next")
                    .font(.custom("Manrope-SemiBold", size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(colorScheme == .dark ? CustomColors.TorchGreen : .white)
                    .background(
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.22))
                    )
                    .padding(.horizontal)
                }
                Spacer()
            }
            .padding(.top, 60)
            HStack {
                Spacer()
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    withAnimation {
                        addSensorViewState = .addSensorNickName
                    }
                }) {
                    Text("Skip")
                    .font(.custom("Manrope-SemiBold", size: 16))
//                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                    .padding(.horizontal)
                }
                Spacer()
            }
        }
        .background(colorScheme == .dark ? CustomColors.DarkModeBackground : Color.white)
        .sheet(isPresented: $isPropertyList) {
            VStack {
                AddSensorPropertyList(searchText: $search, onCrossButtonTap: {
                    isPropertyList = false
                }, onSelectedPropertyButtonTap: {
                    isPropertyList = false
                })
            }
            .presentationDetents([.large])
            .presentationCornerRadius(25)
            .interactiveDismissDisabled(false)
        }
    }
}

//#Preview {
//    AddNewSensorProperty()
//}
