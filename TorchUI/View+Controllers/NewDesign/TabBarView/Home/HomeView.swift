//
//  HomeView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 01/05/2024.
//

import SwiftUI
import AmplifyImage

struct HomeView: View {
    
    @State private var selectedSegment = 0
    @State private var isSheetPresented = false
    @State private var isEmpty = false
    
    var body: some View {
        NavigationView {
            VStack {
                HomeHeadertView(isSheetPresented: $isSheetPresented)
                PickerView(segmentButtonTap: { value in
                    selectedSegment = value
                })
                .frame(height: 44)
                .padding(.top, -10)
                .padding(.horizontal)
                Spacer()
                if isEmpty {
                    EmptyListView(selectedSegment: $selectedSegment)
                    Spacer()
                } else {
                    SearchableList(selectedSegment: $selectedSegment)
                }
            }
            .background(CustomColors.lightGrayBackground)
        }
        .sheet(isPresented: $isSheetPresented) {
            VStack {
                AddSensorOrPropertyView(headerName: "Options", onCrossButtonTap: {
                    isSheetPresented = false
                }, onAddSensorButtonTap: {
                    
                }, onCreatePropertyButtonTap: {
                    
                })
            }
            .presentationDetents([.height(200.0), .height(200)])
            .presentationCornerRadius(25)
            .interactiveDismissDisabled(true)
        }
    }
}

#Preview {
    HomeView()
}
