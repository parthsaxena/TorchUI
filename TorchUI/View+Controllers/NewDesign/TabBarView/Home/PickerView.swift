//
//  PickerView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 23/05/2024.
//

import SwiftUI

struct PickerView: View {
    
    @State private var selectedSegment = 0
    var segmentButtonTap: (_ selectedSegment: Int) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 10
            HStack(spacing: 0) {
                Text("My Properties").tag(0)
                    .font(.custom("Manrope-SemiBold", size: 14))
                    .foregroundColor(selectedSegment == 0 ? CustomColors.darkGray: CustomColors.lightGrayText)
                    .frame(width: width / 2, height: 36)
                    .background(selectedSegment == 0 ? .white : .clear)
                    .cornerRadius(8)
                    .shadow(color: Color.gray.opacity(0.25), radius: 8, x: 0, y: 0)
                    .padding(.leading, 4)
                    .onTapGesture {
                        selectedSegment = 0
                        segmentButtonTap(selectedSegment)
                    }
                Text("My Sensors").tag(1)
                    .font(.custom("Manrope-SemiBold", size: 14))
                    .foregroundColor(selectedSegment == 1 ? CustomColors.darkGray: CustomColors.lightGrayText)
                    .frame(width: width / 2, height: 36)
                    .background(selectedSegment == 1 ? .white : .clear)
                    .cornerRadius(8)
                    .shadow(color: Color.gray.opacity(0.25), radius: 8, x: 0, y: 0)
                    .padding(.trailing, 4)
                    .onTapGesture {
                        selectedSegment = 1
                        segmentButtonTap(selectedSegment)
                    }
            }
            .frame(height: 44)
            .background(CustomColors.pickerBackgroundGray)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(CustomColors.tabBarBackground, lineWidth: 1)
            )
        }
    }
}

//#Preview {
//    PickerView(segmentButtonTap: 0)
//}
