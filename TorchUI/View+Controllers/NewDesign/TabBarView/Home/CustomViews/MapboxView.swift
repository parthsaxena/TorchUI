//
//  MapboxView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 01/08/2024.
//

import SwiftUI
import MapboxMaps

struct MapboxView: UIViewRepresentable {
    
    @Binding var mapStyle: StyleURI
    let markers: [Marker] = [
        Marker(coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)), // San Francisco
        Marker(coordinate: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437))  // Los Angeles
    ]
    
    class Coordinator: NSObject {
        var parent: MapboxView
        var mapView: MapView?
        var pointAnnotationManager: PointAnnotationManager?
        
        init(parent: MapboxView) {
            self.parent = parent
        }

        func mapView(_ mapView: MapView, didFinishLoading style: Style) {
            self.mapView = mapView
            mapView.mapboxMap.loadStyleURI(self.parent.mapStyle)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> MapView {
        let resourceOptions = ResourceOptions(accessToken: "pk.eyJ1IjoidnRyZW1zaW4iLCJhIjoiY2xsNzE0M2lmMGd0eTNnazRjM2s3MndvZCJ9.z9GP9XylmH4RKR-swu14nA")
        let mapInitOptions = MapInitOptions(resourceOptions: resourceOptions)
        let mapView = MapView(frame: .zero, mapInitOptions: mapInitOptions)

        mapView.mapboxMap.onNext(event: .mapLoaded) { _ in
            setupAnnotations(for: mapView, context: context)
            updateCamera(for: mapView)
        }
        return mapView
    }

    func updateUIView(_ uiView: MapView, context: Context) {
        uiView.mapboxMap.loadStyleURI(mapStyle) { _ in
            setupAnnotations(for: uiView, context: context)
            updateCamera(for: uiView)
        }
    }
    
    private func setupAnnotations(for mapView: MapView, context: Context) {
        let manager = mapView.annotations.makePointAnnotationManager()
        manager.delegate = context.coordinator as? any AnnotationInteractionDelegate
        context.coordinator.pointAnnotationManager = manager

        let annotations = markers.map { marker in
            var pointAnnotation = PointAnnotation(coordinate: marker.coordinate)
            if let image = resizeImage(image: UIImage(named: "NewSensorIcon1")!, targetSize: CGSize(width: 45, height: 30)) {
                pointAnnotation.image = .init(image: image, name: "NewSensorIcon1")
            }
            return pointAnnotation
        }

        manager.annotations = annotations
    }
    
    private func updateCamera(for mapView: MapView) {
        guard !markers.isEmpty else { return }

        var minLat = markers.first!.coordinate.latitude
        var maxLat = markers.first!.coordinate.latitude
        var minLon = markers.first!.coordinate.longitude
        var maxLon = markers.first!.coordinate.longitude

        for marker in markers {
            minLat = min(minLat, marker.coordinate.latitude)
            maxLat = max(maxLat, marker.coordinate.latitude)
            minLon = min(minLon, marker.coordinate.longitude)
            maxLon = max(maxLon, marker.coordinate.longitude)
        }

        let bounds = CoordinateBounds(
            southwest: CLLocationCoordinate2D(latitude: minLat, longitude: minLon),
            northeast: CLLocationCoordinate2D(latitude: maxLat, longitude: maxLon)
        )

        let cameraOptions = mapView.mapboxMap.camera(for: bounds, padding: .zero, bearing: nil, pitch: nil)
        mapView.mapboxMap.setCamera(to: cameraOptions)
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size

        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height

        let newSize = CGSize(width: size.width * widthRatio, height: size.height * heightRatio)

        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}

struct Marker {
    var coordinate: CLLocationCoordinate2D
}
