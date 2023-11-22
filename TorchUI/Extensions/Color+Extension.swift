//
//  Color+Extension.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

extension Color {
    static func BatteryLevel(batteryLevel: Double) -> Color {
        print("battery: \(batteryLevel)")
        let battery = batteryLevel / 100.0
        print("battery: \(battery)")
        switch battery {
            // returns red color for range %0 to %20
        case 0...0.2:
            return CustomColors.TorchRed
            // returns yellow color for range %20 to %50
        case 0.2...0.5:
            return CustomColors.WarningYellow
            // returns green color for range %50 to %100
        case 0.5...1.0:
            return CustomColors.GoodGreen
        default:
            return Color.clear
        }
    }
    
    //    static var BatteryLevel : Color {
    //        let batteryLevel = 0.4
    ////        print(batteryLevel)
    //        switch batteryLevel {
    //            // returns red color for range %0 to %20
    //            case 0...0.2:
    //                return Color.red
    //            // returns yellow color for range %20 to %50
    //            case 0.2...0.5:
    //                return Color.yellow
    //            // returns green color for range %50 to %100
    //            case 0.5...1.0:
    //                return Color.green
    //            default:
    //                return Color.clear
    //        }
    //    }
}
