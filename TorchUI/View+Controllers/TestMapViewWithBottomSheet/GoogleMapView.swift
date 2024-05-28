//
//  GoogleMapView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 02/05/2024.
//

import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 37.7749, longitude: -122.4194, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        // Update the view
    }
}

struct TestMapView: View {
    
    @State private var isSheetPresented = true
    
    var body: some View {
        ZStack {
            GoogleMapView()
                .edgesIgnoringSafeArea(.all)
                .sheet(isPresented: $isSheetPresented) {
                    Text("Half screen content here")
                        .presentationDetents([.fraction(0.15), .medium])
                        .interactiveDismissDisabled(true)
                }
        }
    }
}
