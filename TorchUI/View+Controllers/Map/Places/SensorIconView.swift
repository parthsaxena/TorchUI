//
//  SensorIconView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

struct SensorIconView: View {
    var sensorName: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
                .fixedSize(horizontal: true, vertical: false)
                .shadow(color: Color.gray,radius: 5.0)
            
            HStack {
                Image("SensorIcon")
                    .resizable()
                    .frame(width: 20, height: 20)
                
                Text(sensorName)
            }
        }
    }
}
