//
//  SelectSensor.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 30/07/2024.
//

import SwiftUI

struct SelectSensor: View {
    
    @State var index: Int
    var onSelectedSensorTap: () -> Void
    
    @State private var titleColor = CustomColors.darkGray
    @State private var subTitleColor = CustomColors.lightGrayText
    @State private var backgroundColor = Color.white
    @State private var circleColor = Color.white
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Text("1")
                        .font(.custom("Manrope-Regular", size: 16))
                        .foregroundColor(.white)
                }
                .frame(width: 40, height: 40)
                .background(CustomColors.lightGrayBorder)
                .cornerRadius(40 / 2)
                VStack(alignment: .leading, spacing: 0) {
                    Text("NBard yard #1")
                        .font(.custom("Manrope-SemiBold", size: 14))
                        .foregroundColor(titleColor)
                }
                Spacer()
                Image("Checkbox-unselected")
                    .frame(width: 25, height: 25)
                    .padding(.leading, 8)
                    .onTapGesture {
                        onSelectedSensorTap()
                    }
            }
            .frame(height: 40)
        }
        .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: -2.5))
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}
