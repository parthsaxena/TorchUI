//
//  SensorListView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 30/07/2024.
//

import SwiftUI

struct SensorListView: View {

    @Environment(\.colorScheme) var colorScheme
    var onCrossButtonTap: () -> Void
    var onAddSensorTap: () -> Void
    
    var body: some View {
        HStack {
            Circle()
                .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                .frame(width: 40, height: 40)
                .padding()
                .background(.clear)
                .opacity(0.0)
            Spacer()
            VStack {
                Text("Select the sensors")
                    .font(Font.custom("Manrope-SemiBold", size: 18.0))
                    .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            }
            Spacer()
            Circle()
                .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                .frame(width: 40, height: 40)
                .background(Circle().fill(Color.white))
                .shadow(color: .gray.opacity(0.15), radius: 5, x: 0, y: 2)
                .padding()
                .overlay(
                    Image("home-cross")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .background(Color.white)
                        .clipShape(Circle())
                )
                .onTapGesture {
                    onCrossButtonTap()
                }
        }
        NavigationView {
            List {
                ForEach(0..<10, id: \.self) { index in
                    SelectSensor(index: index, onSelectedSensorTap: {
                        
                    })
                }
            }
            .padding(.horizontal)
            .listStyle(PlainListStyle())
            .scrollIndicators(.never, axes: .vertical)
            .scrollContentBackground(.hidden)
        }
        HStack {
            Spacer()
            Button(action: {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                onAddSensorTap()
            }) {
                Text("Add")
                .font(.custom("Manrope-SemiBold", size: 16))
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(colorScheme == .dark ? CustomColors.TorchGreen : .white)
                .background(
                    RoundedRectangle(cornerRadius: 100)
                        .foregroundColor(Color(red: 0.18, green: 0.21, blue: 0.22))
                )
                .padding(.horizontal)
            }
            Spacer()
        }
    }
}
