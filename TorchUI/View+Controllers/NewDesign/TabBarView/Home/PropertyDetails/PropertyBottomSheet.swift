//
//  PropertyBottomSheet.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 23/06/2024.
//

import SwiftUI

struct PropertyBottomSheet: View {

    var onCrossButtonTap: () -> Void
    var onAddSensorButtonTap: () -> Void
    var onMutePropertyButtonTap: () -> Void
    var onEditPropertyButtonTap: () -> Void
    var onDeleteLocationButtonTap: () -> Void
    
    var body: some View {
        VStack {
            PropertyBottomSheetHeader(headerName: "Option")
                .onTapGesture {
                    self.onCrossButtonTap()
                }
            OptionItem(txtTitle: "Add Sensor", txtColor: CustomColors.darkGray, imgName: "property-addIcon", imgColor: CustomColors.lightGrayText)
                .onTapGesture {
                    self.onAddSensorButtonTap()
                }
            OptionItem(txtTitle: "Mute Property", txtColor: CustomColors.darkGray, imgName: "volume-x", imgColor: CustomColors.lightGrayText)
                .onTapGesture {
                    self.onMutePropertyButtonTap()
                }
            OptionItem(txtTitle: "Edit Property", txtColor: CustomColors.darkGray, imgName: "edit", imgColor: CustomColors.lightGrayText)
                .onTapGesture {
                    self.onEditPropertyButtonTap()
                }
            OptionItem(txtTitle: "Delete Location", txtColor: CustomColors.TorchRed, imgName: "property-trash", imgColor: CustomColors.TorchRed)
                .onTapGesture {
                    self.onDeleteLocationButtonTap()
                }
        }
        .padding(.top, -10)
    }
}

struct PropertyBottomSheetHeader: View {
    
    @State var headerName: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(headerName)
                    .foregroundColor(CustomColors.darkGray)
                    .font(Font.custom("Manrope-SemiBold", size: 18))
                    .padding(.trailing, -70)
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
            }
            .frame(height: 60)
            .padding(.top, 5)
        }
        .padding(.top, 10)
    }
}

struct OptionItem: View {

    let txtTitle: String
    let txtColor: Color
    let imgName: String
    let imgColor: Color
    
    var body: some View {
        HStack {
            Image(imgName)
                .renderingMode(.template)
                .resizable()
                .frame(width: 20, height: 18)
                .scaledToFit()
                .foregroundColor(imgColor)
                .padding(.leading, 12)
                .padding(.trailing, -12)
            Text(txtTitle)
                .font(Font.custom("Manrope-SemiBold", size: 16))
                .padding()
                .foregroundColor(txtColor)
            Spacer()
        }
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 26)
                .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
        )
        .frame(height: 52)
        .frame(maxWidth: .infinity)
        .padding(.top, 0)
        .padding(.bottom, 0)
        .padding([.horizontal])
    }
}
