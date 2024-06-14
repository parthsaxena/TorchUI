//
//  NotificationSectionHeader.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 12/06/2024.
//

import SwiftUI

struct NotificationSectionHeader: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.custom("Manrope-SemiBold", size: 16))
                .foregroundColor(CustomColors.lightGrayText)
            Spacer()
        }
        .background(.clear)
    }
}

//#Preview {
//    NotificationSectionHeader()
//}
