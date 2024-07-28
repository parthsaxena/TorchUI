//
//  LayerBottomSheet.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 01/07/2024.
//

import SwiftUI

struct LayerBottomSheet: View {
    
    var selectedIndex: Int
    var onCrossButtonTap: () -> Void
    var onSelectedViewTap: (_ index: Int) -> Void

    var body: some View {
        GeometryReader { geometry in
            VStack {
                PropertyBottomSheetHeader(headerName: "Map Selection")
                    .onTapGesture {
                        self.onCrossButtonTap()
                    }
                HStack {
                    VStack {
                        ZStack {
                            Image("schemeMap")
                            if selectedIndex == 0 {
                                Image("blueTick")
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(selectedIndex == 0 ? .blue.opacity(0.3) : .clear, lineWidth: 5)
                        )
                        Text("Scheme")
                            .font(Font.custom("Manrope-SemiBold", size: 16))
                            .padding()
                            .foregroundColor(CustomColors.darkGray)
                    }
                    .padding(.leading, 15)
                    .padding(.trailing, 0)
                    .onTapGesture {
                        onSelectedViewTap(0)
                    }
                    VStack {
                        ZStack {
                            Image("schemeMap")
                            if selectedIndex == 1 {
                                Image("blueTick")
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(selectedIndex == 1 ? .blue.opacity(0.3) : .clear, lineWidth: 5)
                        )
                        Text("Satellite")
                            .font(Font.custom("Manrope-SemiBold", size: 16))
                            .padding()
                            .foregroundColor(CustomColors.darkGray)
                    }
                    .padding(.trailing, 15)
                    .padding(.leading, 0)
                    .onTapGesture {
                        onSelectedViewTap(1)
                    }
                }
            }
            .padding(.top, -10)
        }
    }
}

//#Preview {
//    LayerBottomSheet()
//}
