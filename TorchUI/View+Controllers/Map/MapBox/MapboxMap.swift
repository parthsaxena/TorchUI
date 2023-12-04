//
//  MapboxMap.swift
//  TorchUI
//
//  Created by Parth Saxena on 9/20/23.
//

import Foundation
import SwiftUI
import MapboxMaps

struct MapboxMap: UIViewRepresentable {
    
    @Binding var zoomLevel: CGFloat
    @ObservedObject var sessionManager = SessionManager.shared
    var mapView: MapView = MapView(frame: .zero, mapInitOptions: MapInitOptions(resourceOptions: ResourceOptions(accessToken: "pk.eyJ1IjoidnRyZW1zaW4iLCJhIjoiY2xsNzE0M2lmMGd0eTNnazRjM2s3MndvZCJ9.z9GP9XylmH4RKR-swu14nA")))
    
    func makeUIView(context: Context) -> MapView {

        let cameraOptions = CameraOptions(center: sessionManager.selectedProperty?.coordinate, zoom: zoomLevel, bearing: 0.0, pitch: 0.0)
        let options = MapInitOptions(resourceOptions: ResourceOptions(accessToken: "pk.eyJ1IjoidnRyZW1zaW4iLCJhIjoiY2xsNzE0M2lmMGd0eTNnazRjM2s3MndvZCJ9.z9GP9XylmH4RKR-swu14nA"), cameraOptions: cameraOptions)
        let mapView = MapView(frame: .zero, mapInitOptions: options)

        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let pointAnnotationManager = mapView.annotations.makePointAnnotationManager()

        for detector in sessionManager.selectedProperty?.detectors ?? [] {
            if let coordinate = detector.coordinate {
                
                var pointAnnotation = PointAnnotation(coordinate: coordinate)
                var annotationIcon = "DetectorIcons/\(detector.sensorIdx ?? 0)"
                if detector.threat == Threat.Red {
                    annotationIcon = "DetectorIcons/ThreatRed"
                } else if detector.threat == Threat.Yellow {
                    annotationIcon = "DetectorIcons/ThreatYellow"
                }
                
                if let annotationImage = UIImage(named: annotationIcon) {
                    pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
                }
                pointAnnotation.iconAnchor = .bottom
                pointAnnotation.iconSize = 0.25
                pointAnnotationManager.annotations.append(pointAnnotation)
            }
        }
        
        // Build property icon view
        let width = max(80, (SessionManager.shared.selectedProperty?.propertyName.count ?? 0) * 12 + 25)
        let viewFromXib = Bundle.main.loadNibNamed("PropertyIconView", owner: self, options: nil)?[0] as! PropertyIconView
        viewFromXib.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        
        viewFromXib.propertyImageView.layer.shadowColor = UIColor.black.cgColor
        viewFromXib.propertyImageView.layer.shadowOpacity = 0.2
        viewFromXib.propertyImageView.layer.shadowOffset = .zero
        viewFromXib.propertyImageView.layer.shadowRadius = 4
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = viewFromXib.frame
        rectShape.position = viewFromXib.center
        rectShape.path = UIBezierPath(roundedRect: CGRectMake(0, 0, CGFloat(width - 30), viewFromXib.propertyMainView.bounds.height), byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 50, height: 50)).cgPath
        
        viewFromXib.propertyMainView.layer.mask = rectShape
        viewFromXib.propertyLabel.text = SessionManager.shared.selectedProperty?.propertyName
        if let torchGreen = CustomColors.TorchGreen.cgColor {
            viewFromXib.propertyLabel.textColor = UIColor(cgColor: torchGreen)
        }
        viewFromXib.propertyMainView.backgroundColor = UIColor.white
        if let coordinate = sessionManager.selectedProperty?.coordinate {
            let propertyAnnotationOptions = ViewAnnotationOptions(
                geometry: Point(coordinate),
                width: CGFloat(max(80, (SessionManager.shared.selectedProperty?.propertyName.count ?? 0) * 12 + 25)),
                height: 50,
                allowOverlap: false,
                anchor: .center
            )
            try? mapView.viewAnnotations.add(viewFromXib, options: propertyAnnotationOptions)
        }
        return mapView
    }
    
    func updateUIView(_ uiView: MapboxMaps.MapView, context: Context) {
        let cameraOptions = CameraOptions(zoom: zoomLevel, bearing: 0.0, pitch: 0.0)
        uiView.camera.fly(to: cameraOptions, duration: 0.1)
    }
}
