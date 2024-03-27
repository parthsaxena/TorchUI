//
//  PropertyModel.swift
//  TorchUI
//
//  Created by Parth Saxena on 6/28/23.
//

import Foundation
import GoogleMaps

struct Property: Hashable, Identifiable, Equatable {
    
    var id: String
    var propertyName: String
    var propertyAddress: String
    var propertyImage: String
    var coordinate: CLLocationCoordinate2D?
    var detectors: [Detector] = []
    var threat: Threat = Threat.Green
    var propertyDescription: String = ""
    var loadingData: Bool = false
//    var muted: Bool?
    
    var muted: Bool {
        return detectors.allSatisfy { $0.muted ?? false }
    }
}

struct SearchResult: Hashable, Identifiable {
    
    let id = UUID()
    let address: String
}
