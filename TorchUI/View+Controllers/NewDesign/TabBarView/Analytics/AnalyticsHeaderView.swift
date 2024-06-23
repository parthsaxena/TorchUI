//
//  AnalyticsHeaderView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 19/06/2024.
//

import SwiftUI

struct AnalyticsHeaderView: View {

    private let strHeaderTitle = "Analytics"
    
    var body: some View {
        HStack {
            Text(strHeaderTitle)
                .font(.custom("Manrope-SemiBold", size: 34))
                .foregroundColor(CustomColors.darkGray)
                .kerning(-2)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AnalyticsHeaderView()
}
