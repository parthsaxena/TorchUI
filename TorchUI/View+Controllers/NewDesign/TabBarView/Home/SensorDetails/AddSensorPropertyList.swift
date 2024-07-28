//
//  AddSensorPropertyList.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 22/07/2024.
//

import SwiftUI

struct AddSensorPropertyList: View {

    @Environment(\.colorScheme) var colorScheme
    @Binding var searchText: String
    var onCrossButtonTap: () -> Void
    var onSelectedPropertyButtonTap: () -> Void
    
    @State var fieldTextColor: Color = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0) // place holder text color
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        let binding = Binding<String>(get: {
            self.searchText
        }, set: {
            self.searchText = $0

            if $0 != "Search" {
                fieldTextColor = colorScheme == .dark ? Color.white : CustomColors.TorchGreen
            } else {
                fieldTextColor = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0)
            }
        })
        
        HStack {
            Circle()
                .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                .frame(width: 40, height: 40)
                .padding()
                .background(.clear)
                .opacity(0.0)
            Spacer()
            VStack {
                Text("Link sensor to be a property")
                    .font(Font.custom("Manrope-SemiBold", size: 18.0))
                    .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            }
            Spacer()
            Circle()
                .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                .frame(width: 40, height: 40)
                .padding()
                .overlay(
                    Image("home-cross")
                        .background(.white)
                )
                .background(.clear)
                .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 5)
                .onTapGesture {
                    onCrossButtonTap()
                }
        }
        ZStack {
            TextField("Search", text: binding)
                .font(Font.custom("Manrope-SemiBold", size: 16))
                .padding()
                .background(CustomColors.lightGrayBorder)
                .cornerRadius(8)
                .frame(height: 50)
                .padding(.horizontal)
                .padding(.top, -10)
                .kerning(-0.3)
        }
        .padding(.top, -10)
        NavigationView {
            List {
                ForEach(0..<10, id: \.self) { index in
                    SelectProperty(index: index, onSelectedPropertyButtonTap: {
                        onSelectedPropertyButtonTap()
                    })
                }
            }
            .padding(.horizontal)
            .listStyle(PlainListStyle())
            .scrollIndicators(.never, axes: .vertical)
            .scrollContentBackground(.hidden)
//            .background(CustomColors.lightGrayBackground)
        }
    }
}

//#Preview {
//    AddSensorPropertyList()
//}
