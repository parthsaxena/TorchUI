//
//  HomeHeadertView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 31/05/2024.
//

import SwiftUI

struct HomeHeadertView: View {
    
    @Binding var isSheetPresented: Bool

    private let strHeaderTitle = "All assets"
    var body: some View {
        HStack {
            Text(strHeaderTitle)
                .font(.custom("Manrope-SemiBold", size: 34))
                .foregroundColor(CustomColors.darkGray)
                .kerning(-2)
            Spacer()
            Circle()
                .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                .frame(width: 32, height: 32)
                .overlay(
                    Image("home-addIcon")
                        .background(.white)
                )
                .background(.white)
                .cornerRadius(16.0)
                .onTapGesture {
                    isSheetPresented = true
                }
        }
        .padding()
    }
}

//#Preview {
//    HomeHeadertView()
//}
