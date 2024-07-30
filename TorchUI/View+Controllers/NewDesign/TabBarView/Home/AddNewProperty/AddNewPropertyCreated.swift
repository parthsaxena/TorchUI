//
//  AddNewPropertyCreated.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 29/07/2024.
//

import SwiftUI

struct AddNewPropertyCreated: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var isSheetPresented = false
    @State private var isSensorList = false
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    VStack {
                        Text("Add new property")
                            .font(Font.custom("Manrope-SemiBold", size: 18.0))
                            .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                        Text("Property has been successfully created")
                            .font(Font.custom("Manrope-Regular", size: 16))
                            .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                    }
                    Spacer()
                }
            }
            .padding(.top, 20)
            .padding(.leading, 15)
            Spacer()
            HStack {
                Spacer()
                VStack {
                    ZStack {
                        Image("schemeMap")
                            .frame(width: 120, height: 120)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    Text("Mom's house")
                        .font(Font.custom("Manrope-SemiBold", size: 30))
                        .minimumScaleFactor(0.7)
                        .foregroundColor(CustomColors.TorchGreen)
                        .multilineTextAlignment(.center)
                    Text("Pacific Coast Hwy, Malibu, CA 90265")
                        .font(Font.custom("Manrope-Medium", size: 16.0))
                        .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                        .padding(.top, 5.0)
                }
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    isSheetPresented = true
                }) {
                    Text("Set up sensors for mom's house")
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
                       
                    }
                }) {
                    Text("Go to home screen")
                    .font(.custom("Manrope-SemiBold", size: 16))
                    .frame(height: 50)
                    .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                Spacer()
            }
        }
        .background(colorScheme == .dark ? CustomColors.DarkModeBackground : Color.white)
        .sheet(isPresented: $isSheetPresented) {
            VStack {
                AddSensorView(headerName: "Add sensors", onCrossButtonTap: {
                    isSheetPresented = false
                }, onAddSensorTap: {
                    isSheetPresented = false
                }, onChooseExistingTap: {
                    isSheetPresented = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        isSensorList = true
                    }
                })
            }
            .presentationDetents([.height(200.0), .height(200)])
            .presentationCornerRadius(25)
            .interactiveDismissDisabled(false)
        }
        .sheet(isPresented: $isSensorList) {
            VStack {
                SensorListView(onCrossButtonTap: {
                    isSensorList = false
                }, onAddSensorTap: {
                    isSensorList = false
                })
            }
            .presentationDetents([.large])
            .presentationCornerRadius(25)
            .interactiveDismissDisabled(false)
        }
    }
}
