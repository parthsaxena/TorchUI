//
//  ScrollableSegmentsView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 24/12/2023.
//

import SwiftUI

struct ScrollableSegmentsView: View {
    
    @Binding var selectedSegment: AnalyticsTypeSelection
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(AnalyticsTypeSelection.allCases, id: \.self) { title in
                    SegmentView(title: title.rawValue, isSelected: selectedSegment == title) {
                        print("Selected segment: \(title.rawValue)")
                        selectedSegment = title
                    }
                }
            }
        }
    }
}

//#Preview {
//    ScrollableSegmentsView()
//}
