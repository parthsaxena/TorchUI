//
//  EmptyPropertyOrSensorView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 05/05/2024.
//

import SwiftUI

struct EmptyPropertyOrSensorView: View {
    
    @State var selectedSegment: Int
    
    var body: some View {
        VStack {
            Text(selectedSegment == 0 ? "There's no property here yet" : "There's no sensors here yet")
                .font(.custom("Manrope-Regular", size: 14))
            Circle()
                .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                .frame(width: 52, height: 52)
                .overlay(
                    Image("home-addIcon")
                        .background(.white)
                )
                .background(.white)
                .onTapGesture {
                    
                }
        }
    }
}

#Preview {
    EmptyPropertyOrSensorView(selectedSegment: 0)
}
