//
//  SelectProperty.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 23/07/2024.
//

import SwiftUI

struct SelectProperty: View {
    
    @State var index: Int
    var onSelectedPropertyButtonTap: () -> Void
    
    @State private var titleColor = CustomColors.darkGray
    @State private var subTitleColor = CustomColors.lightGrayText
    @State private var backgroundColor = Color.white
    @State private var circleColor = Color.white
    
    var body: some View {
        VStack {
            HStack {
                Image(index == 0 ? "noPropertyIcon" : "propery-avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                    .padding(.leading, 8)
                VStack(alignment: .leading, spacing: 0) {
                    Text(index == 0 ? "No property" : "Neighborhood 1")
                        .font(.custom("Manrope-SemiBold", size: 14))
                        .foregroundColor(titleColor)
                    if index != 0 {
                        Text("Pacific Coast Hwy, Malibu")
                            .font(.custom("Manrope-Regular", size: 14))
                            .foregroundColor(subTitleColor)
                    }
                }
                Spacer()
                Image("Checkbox-unselected")
                    .frame(width: 25, height: 25)
                    .padding(.leading, 8)
                    .onTapGesture {
                        onSelectedPropertyButtonTap()
                    }
            }
            .frame(height: 40)
        }
        .listRowInsets(.init(top: 8, leading: -7.5, bottom: 8, trailing: -2.5))
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

