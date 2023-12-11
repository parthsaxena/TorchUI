//
//  AddPropertySheetView.swift
//  TorchUI
//
//  Created by Parth Saxena on 7/9/23.
//

import SwiftUI

struct AddPropertySheetView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var state: OnboardingState = .propertyName
    @State var propertyName: String = ""
    @State var propertyAddress: String = ""

    var body: some View {
        if state == .propertyName {            
            PropertyNameView(state: $state, propertyName: $propertyName)
        } else if state == .propertyAddress {
            PropertyAddressView(vm: PropertyAddressViewModel(), state: $state, propertyName: propertyName, propertyAddress: $propertyAddress)
        } else if state == .propertyPhoto {
            PropertyPhotoView(state: $state, propertyName: propertyName, propertyAddress: propertyAddress)
        } else if state == .connectToHub {
            
        } else if state == .promptInstallation {
            PromptInstallationView(state: $state, propertyName: propertyName, propertyAddress: propertyAddress)
        } else if state == .placeSensors {
            PlaceSensorView()
        }
    }
}

struct ContentView: View {
    
    @State private var showingSheet = true
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            AddPropertySheetView(propertyName: "asd")
                .presentationCornerRadius(100)
        }
    }
}

struct AddPropertySheetView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
