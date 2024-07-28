//
//  SensorBottomSheet.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 06/07/2024.
//

import SwiftUI

struct SensorBottomSheet: View {
    
    var onCrossButtonTap: () -> Void
    var onAddSensorButtonTap: () -> Void
    var onMuteSensorButtonTap: () -> Void
    var onEditSensorButtonTap: () -> Void
    var onAnalyticsButtonTap: () -> Void
    var onDeleteLocationButtonTap: () -> Void
    
    var body: some View {
        VStack {
            PropertyBottomSheetHeader(headerName: "Option")
                .onTapGesture {
                    self.onCrossButtonTap()
                }
            OptionItem(txtTitle: "Add sensor", txtColor: CustomColors.darkGray, imgName: "property-addIcon", imgColor: CustomColors.lightGrayText)
                .onTapGesture {
                    self.onAddSensorButtonTap()
                }
            OptionItem(txtTitle: "Mute sensor", txtColor: CustomColors.darkGray, imgName: "volume-x", imgColor: CustomColors.lightGrayText)
                .onTapGesture {
                    self.onMuteSensorButtonTap()
                }
            OptionItem(txtTitle: "Edit sensor", txtColor: CustomColors.darkGray, imgName: "edit", imgColor: CustomColors.lightGrayText)
                .onTapGesture {
                    self.onEditSensorButtonTap()
                }
            OptionItem(txtTitle: "Analytics", txtColor: CustomColors.darkGray, imgName: "line-chart-up-01", imgColor: CustomColors.lightGrayText)
                .onTapGesture {
                    self.onAnalyticsButtonTap()
                }
            OptionItem(txtTitle: "Delete sensor ", txtColor: CustomColors.TorchRed, imgName: "property-trash", imgColor: CustomColors.TorchRed)
                .onTapGesture {
                    self.onDeleteLocationButtonTap()
                }
        }
        .padding(.top, -10)
    }
}

//#Preview {
//    SensorBottomSheet()
//}
