//
//  NotificationEmptyListView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 11/06/2024.
//

import SwiftUI

struct NotificationEmptyListView: View {

    private let strEmptyNotification = "There's no notification here yet"
    
    var body: some View {
        VStack {
            Text(strEmptyNotification)
                .font(.custom("Manrope-Regular", size: 14))
        }
        .background(.clear)
    }
}

#Preview {
    NotificationEmptyListView()
}
