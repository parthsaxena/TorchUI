//
//  DetectorModel.swift
//  TorchUI
//
//  Created by Parth Saxena on 6/28/23.
//

import Foundation
import GoogleMaps
import CoreLocation

struct Detector: Hashable, Identifiable  {
    
    let id: String
    var deviceName: String
    var deviceBattery: Double
    
    var measurements: [String: String] = ["fire_rating":"0"]
    var coordinate: CLLocationCoordinate2D?
    var threat: Threat = Threat.Green
    var spectralStatus: Threat = Threat.Green
    var thermalStatus: Threat = Threat.Green
    var smokeStatus: Threat = Threat.Green
    
    var selected: Bool = false
    var sensorIdx: Int?
    var connected: Bool = true
    var irHot: [[Double]] = []
    
    var lastTimestamp: Date = Date()
    var isNewlyInstalled: Bool = false
    var muted: Bool?
}

extension CLLocationCoordinate2D: Hashable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
}
