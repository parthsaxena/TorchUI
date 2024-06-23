//
//  AnalyticsView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 19/06/2024.
//

import SwiftUI

struct AnalyticsView: View {

    @Environment(\.colorScheme) var colorScheme
    @State var segmentationSelection: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                AnalyticsHeaderView()
                AnalyticsSegmentsView(selectedSegment: $segmentationSelection)
                AnalyticsListView()
            }
            .background(CustomColors.lightGrayBackground)
            .onAppear {

            }
        }
    }
}

//#Preview {
//    AnalyticsView()
//}
