//
//  GoogleMapView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 02/05/2024.
//

import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    
    @Binding var markers: [GMSMarker]
    @Binding var mapType: GMSMapViewType
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 37.7749, longitude: -122.4194, zoom: 8.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.mapType = mapType
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        // Update the view
        uiView.clear()
        uiView.mapType = mapType
        for marker in markers {
            marker.map = uiView
        }
    }
}

class MapViewModel: ObservableObject {
    
    @Published var markers: [GMSMarker] = []

    func addMarker(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        marker.title = title
//        marker.snippet = snippet
        if let originalImage = UIImage(named: "NewSensorIcon1") {
            let size = CGSize(width: 45, height: 30) // Set your desired size here
            let resizedImage = resizeImage(image: originalImage, targetSize: size)
            marker.icon = resizedImage
        }
        markers.append(marker)
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let resizedImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        return resizedImage
    }
}

struct TestMapView: View {
    
    @State private var isSheetPresented = true
    
    var body: some View {
        ZStack {
//            GoogleMapView()
//                .edgesIgnoringSafeArea(.all)
//                .sheet(isPresented: $isSheetPresented) {
//                    Text("Half screen content here")
//                        .presentationDetents([.fraction(0.15), .medium])
//                        .interactiveDismissDisabled(true)
//                }
        }
    }
}
