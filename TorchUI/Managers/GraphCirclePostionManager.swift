//
//  GraphCirclePostionManager.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 08/03/2024.
//

import SwiftUI

class GraphCirclePositionManager {
    
    static var shared = GraphCirclePositionManager()
    
    var isMoveCircle: Bool = false
    var termalCameraCirclePositions: [Int] = []
    var spectralAnalysisCirclePositions: [Int] = []
    var smokeCirclePositions: [Int] = []
    var temperatureHumidityCirclePositions: [Int] = []
}
