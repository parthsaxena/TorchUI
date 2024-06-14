//
//  NotificationsHeaderView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 11/06/2024.
//

import SwiftUI

struct NotificationsHeaderView: View {

    private let strHeaderTitle = "Notifications"
    private let strClearActions = "Clear all"
    
    var body: some View {
        HStack {
            Text(strHeaderTitle)
                .font(.custom("Manrope-SemiBold", size: 34))
                .foregroundColor(CustomColors.darkGray)
                .kerning(-2)
            Spacer()
            Button(action: {
                
            }) {
                Text(strClearActions)
                    .font(.custom("Manrope-SemiBold", size: 14))
                    .foregroundColor(CustomColors.TorchRed)
            }

        }
        .padding()
    }
}

#Preview {
    NotificationsHeaderView()
}
