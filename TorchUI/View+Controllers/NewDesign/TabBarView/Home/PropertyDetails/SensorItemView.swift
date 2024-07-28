//
//  SensorItemView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 06/07/2024.
//

import SwiftUI

struct SensorItemView: View {
    
    let counter: Int
    
    var body: some View {
        GeometryReader { geometry in
            let spacing = 5.0
            let sensorSize = (geometry.size.width - spacing) / 8.3
            ScrollView {
                FlowLayout(spacing: spacing) {
                    ForEach(0..<counter, id: \.self) { index in
                        if index == 10 {
                            ZStack {
                                ZStack {
                                    Text("\(index)")
                                        .font(.custom("Manrope-Regular", size: 16))
                                        .foregroundColor(.white)
                                }
                                .frame(width: sensorSize, height: sensorSize)
                                .background(CustomColors.TorchRed)
                                .cornerRadius(sensorSize / 2)
                                if index == 23 {
                                    Image("muteSensorIcon")
                                        .frame(width: 16, height: 16)
                                        .padding(.leading, 28)
                                        .padding(.top, -25)
                                }
                            }
                        } else if index == 15 {
                            ZStack {
                                ZStack {
                                    Text("\(index)")
                                        .font(.custom("Manrope-Regular", size: 16))
                                        .foregroundColor(.white)
                                }
                                .frame(width: sensorSize, height: sensorSize)
                                .background(CustomColors.WarningYellow)
                                .cornerRadius(sensorSize / 2)
                                if index == 23 {
                                    Image("muteSensorIcon")
                                        .frame(width: 16, height: 16)
                                        .padding(.leading, 28)
                                        .padding(.top, -25)
                                }
                            }
                        } else {
                            ZStack {
                                ZStack {
                                    Text("1")
                                        .font(.custom("Manrope-Regular", size: 16))
                                        .foregroundColor(CustomColors.darkGray)
                                }
                                .frame(width: sensorSize, height: sensorSize)
                                .background(CustomColors.lightGrayBorder)
                                .cornerRadius(sensorSize / 2)
                                if index == 23 {
                                    Image("muteSensorIcon")
                                        .frame(width: 16, height: 16)
                                        .padding(.leading, 28)
                                        .padding(.top, -25)
                                }
                            }
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom], 15)
            .background(.white)
            .scrollIndicators(.never, axes: .vertical)
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    SensorItemView(counter: 0)
}
