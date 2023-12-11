//
//  Color+Extension.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

extension Color {
    
    static func BatteryLevel(batteryLevel: Double) -> Color {
        
        let battery = batteryLevel / 100.0
        switch battery {
        case 0...0.2:
            return CustomColors.TorchRed // returns red color for range %0 to %20
        case 0.2...0.5:
            return CustomColors.WarningYellow // returns yellow color for range %20 to %50
        case 0.5...1.0:
            return CustomColors.GoodGreen // returns green color for range %50 to %100
        default:
            return Color.clear
        }
    }
}
