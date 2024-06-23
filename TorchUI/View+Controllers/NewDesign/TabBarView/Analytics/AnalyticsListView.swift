//
//  AnalyticsListView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 19/06/2024.
//

import SwiftUI


struct AnalyticsListView: View {

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(0..<10) { index in
                    AnalyticsCard()
                }
            }
            .padding([.leading, .trailing])
            .background(CustomColors.lightGrayBackground)
        }
        .background(.clear)
    }
}

#Preview {
    AnalyticsListView()
}
