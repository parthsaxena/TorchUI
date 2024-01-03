//
//  DataItem.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI
import LineChartView

struct DataItem: Identifiable {
    var id = UUID()
    var title: String
    var size: CGFloat
    var color: Color
    var offset = CGSize.zero
}

struct Item: Identifiable {
    var id = UUID()
    var itemName: String
    var itemDescription: String
    var lineChartParameters: LineChartParameters
}
