//
//  NotificationsView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 01/05/2024.
//

import SwiftUI

struct NotificationsView: View {
    
    @State private var isSheetPresented = false
    @State private var isEmpty = false
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack(spacing: 0) {
                    NotificationsHeaderView()
                    if isEmpty {
                        Spacer()
                        NotificationEmptyListView()
                        Spacer()
                    } else {
                        NotificationListView()
                            .frame(width: geometry.size.width)
                    }
                }
                .background(CustomColors.lightGrayBackground)
            }
        }
    }
}

#Preview {
    NotificationsView()
}
