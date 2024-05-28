//
//  PropertyCard.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 06/05/2024.
//

import SwiftUI
import AmplifyImage

struct PropertyCard: View {
    
    @State var propertyState: PropertyStates
    var index = 0
    
    @State private var titleColor = CustomColors.darkGray
    @State private var subTitleColor = CustomColors.lightGrayText
    @State private var backgroundColor = Color.white
    @State private var circleColor = Color.white
    
    var body: some View {
        VStack {
            HStack {
                Image("propery-avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 52, height: 52)
                    .cornerRadius(12)
                    .padding(.horizontal, 8)
                VStack(alignment: .leading, spacing: 0) {
                    Text("Neighborhood 1")
                        .font(.custom("Manrope-SemiBold", size: 16))
                        .foregroundColor(titleColor)
                    Text("Pacific Coast Hwy, Malibu")
                        .font(.custom("Manrope-Regular", size: 14))
                        .foregroundColor(subTitleColor)
                }
                Spacer()
                CircleGridView(totalSensors: index + 2, circleColor: circleColor, cirlceSize: (index + 2) > 9 ? 10.0 : 12.0)
                    .scaleEffect(x: -1, y: 1, anchor: .center)
            }
            .frame(height: 76)
            
            if index == 2 {
                HStack {
                    Spacer()
                    Image("property-addIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                        .padding(.trailing, -15)
                    Text("Add Sensor")
                        .font(Font.custom("Manrope-SemiBold", size: 16))
                        .padding()
                        .foregroundColor(CustomColors.darkGray)
                    Spacer()
                }
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 26)
                        .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                )
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .padding(.top, 0)
                .padding([.horizontal, .bottom], 12)
                .onTapGesture {
                    
                }
            }
            if index == 3 {
                HStack {
                    VStack {
                        Spacer()
//                            .frame(height: 20)
                        Image("property-warning")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.leading, 10)
                            .foregroundColor(CustomColors.WarningYellow)
                        Spacer()
                    }
                    Text("Warning: a fire was detected within 5 miles of this property. Click to see sensor data")
                        .font(Font.custom("Manrope-Regular", size: 14))
                        .frame(height: 40)
                        .padding(.vertical, 10)
                        .padding(.leading, 5)
                        .padding(.trailing)
                        .foregroundColor(CustomColors.WarningYellow)
                    VStack {
                        Spacer()
//                            .frame(height: 20)
                        Image("warning-cross")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 10)
                            .foregroundColor(CustomColors.WarningYellow)
                        Spacer()
                    }
                }
                .background(CustomColors.WarningYellow.opacity(0.1))
                .padding(.horizontal, -5)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(CustomColors.tabBarBackground, lineWidth: 1)
        )
        .background(backgroundColor)
        .cornerRadius(22)
        .padding(.horizontal, -20)
        .onAppear {
            onAppearSetup()
        }
    }
    
    func onAppearSetup() {
        if propertyState == .normal {
            self.titleColor = CustomColors.darkGray
            self.subTitleColor = CustomColors.lightGrayText
            self.backgroundColor = .white
            self.circleColor = CustomColors.tabBarBackground
        } else if propertyState == .warning {
            self.titleColor = .white
            self.subTitleColor = .white
            self.backgroundColor = CustomColors.WarningYellow
            self.circleColor = CustomColors.torchDarkYellow
        } else if propertyState == .highAlert {
            self.titleColor = .white
            self.subTitleColor = .white
            self.backgroundColor = CustomColors.TorchRed
            self.circleColor = CustomColors.torchDardRed
        }
    }
}
