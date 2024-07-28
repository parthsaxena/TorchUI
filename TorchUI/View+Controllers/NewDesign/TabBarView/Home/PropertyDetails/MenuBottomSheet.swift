//
//  MenuBottomSheet.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 01/07/2024.
//

import SwiftUI

struct MenuBottomSheet: View {

    @State private var selectedIndex: Int = 0
    var onCrossButtonTap: () -> Void
    var onFireDetectionButtonTap: () -> Void
    var onBatteryButtonTap: () -> Void
    var onConnectionButtonTap: () -> Void
    var onTemperatureButtonTap: () -> Void
    var onHumidityButtonTap: () -> Void
    
    var body: some View {
        VStack {
            PropertyBottomSheetHeader(headerName: "Sort by")
                .onTapGesture {
                    onCrossButtonTap()
                }
            MenuOptionItem(txtTitle: "Fire detection", txtColor: CustomColors.darkGray, imgName: "FireIcon", imgColor: CustomColors.lightGrayText, selectedIndex: 0, isSelected: selectedIndex == 0, onOptionViewTap: { index in
                selectedIndex = index
                onFireDetectionButtonTap()
            })
            MenuOptionItem(txtTitle: "Battery", txtColor: CustomColors.darkGray, imgName: "Battery100%", imgColor: CustomColors.lightGrayText, selectedIndex: 1, isSelected: selectedIndex == 1, onOptionViewTap: { index in
                selectedIndex = index
                onBatteryButtonTap()
            })
            MenuOptionItem(txtTitle: "Connection", txtColor: CustomColors.darkGray, imgName: "home-wifi", imgColor: CustomColors.lightGrayText, selectedIndex: 2, isSelected: selectedIndex == 2, onOptionViewTap: { index in
                selectedIndex = index
                onConnectionButtonTap()
            })
            MenuOptionItem(txtTitle: "Temperature", txtColor: CustomColors.darkGray, imgName: "Thermometer", imgColor: CustomColors.lightGrayText, selectedIndex: 3, isSelected: selectedIndex == 3, onOptionViewTap: { index in
                selectedIndex = index
                onTemperatureButtonTap()
            })
            MenuOptionItem(txtTitle: "Humidity", txtColor: CustomColors.darkGray, imgName: "Humidity 1", imgColor: CustomColors.lightGrayText, selectedIndex: 4, isSelected: selectedIndex == 4, onOptionViewTap: { index in
                selectedIndex = index
                onHumidityButtonTap()
            })
        }
        .padding(.top, -10)
    }
}

//#Preview {
//    MenuBottomSheet()
//}

struct MenuOptionItem: View {

    let txtTitle: String
    let txtColor: Color
    let imgName: String
    let imgColor: Color
    var selectedIndex: Int
    var isSelected: Bool
    var onOptionViewTap: (_ selectedIndex: Int) -> Void
    
    var body: some View {
        HStack {
            Image(imgName)
                .renderingMode(.template)
                .resizable()
                .frame(width: 20, height: 20)
                .scaledToFit()
                .foregroundColor(imgColor)
                .padding(.leading, 12)
                .padding(.trailing, -12)
            Text(txtTitle)
                .font(Font.custom("Manrope-SemiBold", size: 16))
                .padding()
                .foregroundColor(txtColor)
            Spacer()
            Image(isSelected ? "checkboxSelected" : "checkboxUnselected")
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(.trailing, 10)
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
        .onTapGesture {
            onOptionViewTap(selectedIndex)
        }
    }
}
