//
//  EmptyListView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 31/05/2024.
//

import SwiftUI

struct EmptyListView: View {
    
    @Binding var selectedSegment: Int
    
    private let strEmptyProperties = "There's no property here yet"
    private let strEmptySensors = "There's no sensors here yet"
    
    var body: some View {
        VStack {
            Text(selectedSegment == 0 ? strEmptyProperties : strEmptySensors).tag(0)
                .font(.custom("Manrope-Regular", size: 14))
            Circle()
                .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                .frame(width: 52, height: 52)
                .overlay(
                    Image("home-addIcon")
                        .background(.white)
                )
                .background(.white)
                .cornerRadius(26.0)
                .onTapGesture {
                    
                }
        }
        .background(.clear)
    }
}

//#Preview {
//    EmptyListView()
//}
