//
//  EditSensor.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 18/07/2024.
//

import SwiftUI

struct EditSensor: View {
    
    var onCrossButtonTap: () -> Void
    
    @State private var textSensorName: String = ""
    @State private var textSensorId: String = ""
    
    @State private var showPopup = false
    @State private var viewHeight: CGFloat = 230
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                PropertyBottomSheetHeader(headerName: "Add new sensors")
                    .onTapGesture {
                        self.onCrossButtonTap()
                    }
                HStack {
                    Text("Sensor nickname")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .padding([.top, .horizontal])
                        .foregroundColor(CustomColors.darkGray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                TextField("Enter sensor nickname", text: $textSensorName)
                    .font(Font.custom("Manrope-SemiBold", size: 16))
                    .padding()
                    .background(CustomColors.lightGrayBorder)
                    .cornerRadius(8)
                    .frame(height: 50)
                    .padding(.horizontal)
                    .kerning(-0.3)
                HStack {
                    Text("Sensor ID number")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .padding([.top, .horizontal])
                        .foregroundColor(CustomColors.darkGray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                ZStack {
                    TextField("1234567890", text: $textSensorId)
                        .font(Font.custom("Manrope-SemiBold", size: 16))
                        .padding()
                        .background(CustomColors.lightGrayBorder)
                        .cornerRadius(8)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .kerning(-0.3)
                    HStack {
                        Spacer()
                        Button(action: {

                        }) {
                            Image("copyIcon")
                                .frame(width: 20, height: 20)
                                .padding(.trailing, 30)
                                .cornerRadius(4)
                        }
                    }
                }
                HStack {
                    Text("Detection method")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .padding([.top, .horizontal])
                        .foregroundColor(CustomColors.darkGray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Button(action: {

                    }) {
                        Image("CheckboxIcon")
                            .frame(width: 16, height: 16)
                            .padding(.leading)
                            .cornerRadius(4)
                    }
                    Text("Thermal camera")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .foregroundColor(CustomColors.darkGray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Button(action: {

                    }) {
                        Image("CheckboxIcon")
                            .frame(width: 16, height: 16)
                            .padding(.leading)
                            .cornerRadius(4)
                    }
                    Text("Spectral analysis")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .foregroundColor(CustomColors.darkGray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Button(action: {

                    }) {
                        Image("CheckboxIcon")
                            .frame(width: 16, height: 16)
                            .padding(.leading)
                            .cornerRadius(4)
                    }
                    Text("Smoke")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .foregroundColor(CustomColors.darkGray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Text("How often to send data?")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .padding([.top, .horizontal])
                        .foregroundColor(CustomColors.darkGray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text("Beta")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .padding([.top, .horizontal])
                        .foregroundColor(CustomColors.TorchRed)
                        .multilineTextAlignment(.leading)
                }
                HStack {
                    Button(action: {

                    }) {
                        Image("radioIcon")
                            .frame(width: 16, height: 16)
                            .padding(.leading)
                            .cornerRadius(4)
                    }
                    Text("Often")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .foregroundColor(CustomColors.darkGray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Button(action: {

                    }) {
                        Image("Checkbox-unselected")
                            .frame(width: 16, height: 16)
                            .padding(.leading)
                            .cornerRadius(4)
                    }
                    Text("Not often")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .foregroundColor(CustomColors.darkGray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Button(action: {

                    }) {
                        Image("Checkbox-unselected")
                            .frame(width: 16, height: 16)
                            .padding(.leading)
                            .cornerRadius(4)
                    }
                    Text("Rarely")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .foregroundColor(CustomColors.darkGray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                Spacer()
                VStack {
                    Button(action: {
                        showPopup = true
                    }) {
                        Text("Save changes")
                            .frame(width: geometry.size.width - 65, height: 50)
                            .foregroundColor(.white)
                            .padding(.horizontal, 15)
                            .background(Color.black)
                            .cornerRadius(25)
                    }
                    Button(action: {
                        //     onSecondryButtonTap()
                    }) {
                        Text("Cancel")
                            .frame(width: geometry.size.width - 65, height: 50)
                            .foregroundColor(CustomColors.TorchRed)
                            .padding(.horizontal, 15)
                            .background(.clear)
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(CustomColors.darkGray.opacity(0.5), lineWidth: 1)
                            )
                    }
                }
            }
            .popup(isShowing: $showPopup, viewHeight: $viewHeight) {
                ConfirmationPopupView(
                    message: "Are you sure you want to exit without saving the changes?",
                    primaryActionTitle: "Exit without saving",
                    secondryActionTitle: "Save and exit",
                    onPrimaryButtonTap: {
                        showPopup = false
                    }, onSecondryButtonTap: {
                        showPopup = false
                    }
                )
            }
        }
    }
}

//#Preview {
//    AddNewSensors()
//}
