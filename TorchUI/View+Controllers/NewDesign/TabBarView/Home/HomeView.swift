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
        GeometryReader { geometry in
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
                        ZStack {
                            SearchableList(selectedSegment: $selectedSegment)
                                .frame(width: geometry.size.width)
                                .offset(x: selectedSegment == 0 ? 0 : -geometry.size.width/*(selectedSegment > 0 ? 1 : -1)*/)
                                .animation(.smooth, value: selectedSegment)
                            SearchableList(selectedSegment: $selectedSegment)
                                .frame(width: geometry.size.width)
                                .offset(x: selectedSegment == 1 ? 0 : geometry.size.width/*(selectedSegment > 0 ? 1 : -1)*/)
                                .animation(.smooth, value: selectedSegment)
                        }
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
                .interactiveDismissDisabled(false)
            }
        }
    }
}

#Preview {
    HomeView()
}
