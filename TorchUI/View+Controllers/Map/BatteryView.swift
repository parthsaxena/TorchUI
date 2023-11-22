//
//  BatteryView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

struct BatteryView : View {
    var batteryLevel: Double
    
    var body: some View {
        // UIDevice.current.batteryLevel always returns -1, and I don't know why. so here's a value for you to preview
        //        let batteryLevel = 0.4
        GeometryReader { geo in
            HStack(spacing: 1) {
                
                GeometryReader { rectangle in
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(lineWidth: 1)
                        .foregroundColor(Color.BatteryLevel(batteryLevel: batteryLevel))
                    RoundedRectangle(cornerRadius: 2)
                        .padding(1)
                        .frame(width: rectangle.size.width - (rectangle.size.width * (1 - (batteryLevel / 100.0))))
                        .foregroundColor(Color.BatteryLevel(batteryLevel: batteryLevel))
                }
                HalfCircleShape()
                    .frame(width: geo.size.width / 7, height: geo.size.height / 7)
                    .foregroundColor(Color.BatteryLevel(batteryLevel: batteryLevel))
                
            }
            //            .padding(.leading)
        }
    }
}
