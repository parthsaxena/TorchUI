//
//  AnalyticsSwiftUIView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 22/12/2023.
//

import SwiftUI

struct AnalyticsSwiftUIView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var segmentationSelection : AnalyticsTypeSelection = .thermalCameras
    var items: [Item] = [
        Item(itemName: "Camera (Northeast) 1", itemDescription: "Temperature and Time 1"),
        Item(itemName: "Camera (Northeast) 2", itemDescription: "Temperature and Time 2"),
        Item(itemName: "Camera (Northeast) 3", itemDescription: "Temperature and Time 3"),
        Item(itemName: "Camera (Northeast) 4", itemDescription: "Temperature and Time 4"),
        Item(itemName: "Camera (Northeast) 5", itemDescription: "Temperature and Time 5")
    ]
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    AccountBackButton()
                    Spacer()
                }
                HStack {
                    Spacer()
                    VStack {
                        Text("Analytics")
                            .font(Font.custom("Manrope-SemiBold", size: 18.0))
                            .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                            .padding(.top, 0)
                        Text("Sensor 3 hours Napa")
                            .font(Font.custom("Manrope-SemiBold", size: 14.0))
                            .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.LightGray)
                            .padding(.top, 0)
                    }
                    Spacer()
                }
            }
            .padding(.top, 10)
            .padding(.horizontal, 15)
            ScrollableSegmentsView()
            NavigationView {
                List {
                    ForEach(items) { item in
                        AnalyticsCellView(item: item, action: {
                            print("dropdown clicked")
                        })
                    }
                }
                .listRowSeparator(.hidden)
                .listRowSpacing(20)
                .listStyle(InsetGroupedListStyle())
            }
            .padding(.top, -8)
            Spacer()
        }
        .background(colorScheme == .dark ? CustomColors.DarkModeBackground : Color.white)
    }
}

#Preview {
    AnalyticsSwiftUIView()
}
