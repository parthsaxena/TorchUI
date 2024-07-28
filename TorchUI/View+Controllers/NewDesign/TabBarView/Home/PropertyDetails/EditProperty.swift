//
//  EditProperty.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 17/07/2024.
//

import SwiftUI

struct EditProperty: View {
    
    var selectedIndex: Int
    var onCrossButtonTap: () -> Void
    var onSelectedViewTap: (_ index: Int) -> Void
    
    @State private var textPropertyName: String = ""
    @State private var textPropertyAddress: String = ""
    
    @State private var showPopup = false
    @State private var showAlert = false
    
    @State private var viewHeight: CGFloat = 230
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                PropertyBottomSheetHeader(headerName: "Edit Property")
                    .onTapGesture {
                        self.onCrossButtonTap()
                    }
                HStack {
                    Spacer()
                    VStack {
                        ZStack {
                            Image("schemeMap")
                                .frame(width: 120, height: 120)
                            if selectedIndex == 0 {
                                Image("addImage")
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(selectedIndex == 0 ? .blue.opacity(0.3) : .clear, lineWidth: 5)
                        )
                        Text("Personal photo")
                            .font(Font.custom("Manrope-SemiBold", size: 14))
//                            .padding()
                            .foregroundColor(CustomColors.lightGrayText)
                            .kerning(-0.3)
                    }
                    .frame(width: 120, height: 120)
                    .padding(.trailing, 5)
                    .onTapGesture {
                        onSelectedViewTap(0)
                    }
                    VStack {
                        ZStack {
                            Image("schemeMap")
                                .frame(width: 120, height: 120)
                            if selectedIndex == 1 {
                                Image("addImage")
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .overlay(
                            RoundedRectangle(cornerRadius: 24)
                                .stroke(selectedIndex == 1 ? .blue.opacity(0.3) : .clear, lineWidth: 5)
                        )
                        Text("Satellite photo")
                            .font(Font.custom("Manrope-SemiBold", size: 14))
//                            .padding()
                            .foregroundColor(CustomColors.lightGrayText)
                            .kerning(-0.3)
                    }
                    .frame(width: 120, height: 120)
                    .padding(.leading, 5)
                    .onTapGesture {
                        onSelectedViewTap(1)
                    }
                    Spacer()
                }
                .padding(.vertical, 25)
                HStack {
                    Text("Property name")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .padding([.top, .horizontal])
                        .foregroundColor(CustomColors.darkGray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                TextField("Enter property name", text: $textPropertyName)
                    .font(Font.custom("Manrope-SemiBold", size: 16))
                    .padding()
                    .background(CustomColors.lightGrayBorder)
                    .cornerRadius(8)
                    .frame(height: 50)
                    .padding(.horizontal)
                    .kerning(-0.3)
                HStack {
                    Text("Property address")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .padding([.top, .horizontal])
                        .foregroundColor(CustomColors.darkGray)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                TextField("Enter property address", text: $textPropertyAddress)
                    .font(Font.custom("Manrope-SemiBold", size: 16))
                    .padding()
                    .background(CustomColors.lightGrayBorder)
                    .cornerRadius(8)
                    .frame(height: 50)
                    .padding(.horizontal)
                    .kerning(-0.3)
                Spacer()
                VStack {
                    Button(action: {
                        //                    onPrimaryButtonTap()\
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
                        //                    onSecondryButtonTap()
                        showAlert = true
                    }) {
                        Text("Delete property")
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
                    primaryActionTitle: "Cancel",
                    secondryActionTitle: "Save and exit",
                    onPrimaryButtonTap: {
                        showPopup = false
                    }, onSecondryButtonTap: {
                        showPopup = false
                    }
                )
            }
            .popup(isShowing: $showAlert, viewHeight: $viewHeight) {
                ConfirmationPopupView(
                    message: "Are you sure you want to remove the property?",
                    primaryActionTitle: "Cancel",
                    secondryActionTitle: "Yes, delete",
                    secondryTextColor: CustomColors.TorchRed,
                    onPrimaryButtonTap: {
                        showAlert = false
                    }, onSecondryButtonTap: {
                        showAlert = false
                    }
                )
            }
        }
    }
}

//#Preview {
//    EditProperty()
//}
