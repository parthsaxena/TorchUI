//
//  AnalyticsSegmentsView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 19/06/2024.
//

import SwiftUI

struct AnalyticsSegmentsView: View {
    
    @Binding var selectedSegment: Int
    var segmentList: [String] = ["All Sensors", "Neighborhood 1", "Neighborhood 2", "Neighborhood 3"]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(Array(segmentList.enumerated()), id: \.offset) { index, title in
                    SegmentView(title: title, isSelected: selectedSegment == index) {
                        selectedSegment = index
                    }
                }
            }
        }
    }
}

//#Preview {
//    AnalyticsSegmentsView(selectedSegment: 0)
//}
