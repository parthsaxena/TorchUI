//
//  AlertModel.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

struct AlertModel: Identifiable {
    var id = UUID()
    //    var propertyIndex: Int
    //    var detectorIndex: Int
    var property: Property
    var detector: Detector
    var threat: Threat
}
