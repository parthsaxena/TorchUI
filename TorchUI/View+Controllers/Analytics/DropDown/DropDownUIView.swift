//
//  DropDownUIView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 26/12/2023.
//

import SwiftUI

struct DropDownUIView: View {
    
    @State private var isDropdownExpanded = false
    @State private var selectedOptions: Set<String> = []

    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]

    var body: some View {
        VStack {
            DisclosureGroup("Select Options", isExpanded: $isDropdownExpanded) {
                VStack(alignment: .leading) {
                    ForEach(options, id: \.self) { option in
                        HStack {
                            Image(systemName: selectedOptions.contains(option) ? "checkmark.square" : "square")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(selectedOptions.contains(option) ? .blue : .black)
                                .onTapGesture {
                                    if selectedOptions.contains(option) {
                                        selectedOptions.remove(option)
                                    } else {
                                        selectedOptions.insert(option)
                                    }
                                }

                            Text(option)
                                .padding(.leading, 8)
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding(.leading, 20)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.blue, lineWidth: 1)
            )
            .onTapGesture {
                withAnimation {
                    isDropdownExpanded.toggle()
                }
            }

            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownUIView()
    }
}

