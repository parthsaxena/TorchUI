//
//  AddSensorOrPropertyView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 04/05/2024.
//

import SwiftUI

struct AddSensorOrPropertyView: View {
    
    let headerName: String
    var onCrossButtonTap: () -> Void
    var onAddSensorButtonTap: () -> Void
    var onCreatePropertyButtonTap: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(headerName)
                    .foregroundColor(CustomColors.darkGray)
                    .font(Font.custom("Manrope-SemiBold", size: 18))
                    .padding(.trailing, -70)
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
            .frame(height: 60)
            .padding(.top, -5)
            HStack {
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
            .frame(height: 52)
            .frame(maxWidth: .infinity)
            .padding(.top, -5)
            .padding(.bottom, 0)
            .padding([.horizontal])
            .onTapGesture {
                self.onAddSensorButtonTap()
            }
            HStack {
                Text("Create a property")
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
            .frame(height: 52)
            .frame(maxWidth: .infinity)
            .padding(.top, 0)
            .padding([.horizontal])
            .onTapGesture {
                self.onCreatePropertyButtonTap()
            }
        }
        .padding(.top, -10)
    }
}

//#Preview {
//    AddSensorOrPropertyView()
//}
