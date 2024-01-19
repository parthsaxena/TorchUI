//
//  SegmentView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 24/12/2023.
//

import SwiftUI

struct SegmentView: View {
    
    var title: String
    var isSelected: Bool
    var action: () -> Void
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack() {
            Text(title)
                .font(Font.custom("Manrope-SemiBold", size: 16.0))
                .padding(10)
                .background(.clear)
                .foregroundColor(isSelected ? CustomColors.TorchRed : (colorScheme == .dark ? Color.white : CustomColors.LightGray))
                .onTapGesture {
                    action()
                }
            Rectangle()
                .foregroundColor(isSelected ? CustomColors.TorchRed : CustomColors.SegmentBottomLineColor)
                .frame(height: 1.5)
            
        }
    }
}

#Preview {
    SegmentView(title: "", isSelected: false, action: {})
}
