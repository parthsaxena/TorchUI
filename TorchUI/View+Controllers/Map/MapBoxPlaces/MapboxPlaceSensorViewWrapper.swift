//
//  MapboxPlaceSensorViewWrapper.swift
//  TorchUI
//
//  Created by Parth Saxena on 9/20/23.
//

import Foundation
import SwiftUI
import MapboxMaps

struct MapboxPlaceSensorViewWrapper: UIViewControllerRepresentable {
    
    @ObservedObject var sessionManager = SessionManager.shared
    
    @Binding var mapOffset: CGSize
    @Binding var showDetectorDetails: Bool
    @Binding var selectedDetector: Detector?
    @Binding var needsLocationPin: Bool
    @Binding var annotations: [PointAnnotation]
    @Binding var pin: CLLocationCoordinate2D
    @Binding var moveToUserTapped: Bool
    @Binding var sensorTapped: Bool
    
    var zoomLevel = 17.0
    var accessToken = "pk.eyJ1IjoidnRyZW1zaW4iLCJhIjoiY2xsNzE0M2lmMGd0eTNnazRjM2s3MndvZCJ9.z9GP9XylmH4RKR-swu14nA"
    
    func makeUIViewController(context: Context) -> MapboxPlaceSensorViewController {
        
        let vc = self.createMapboxPlaceSensorViewController()
        self.addMarkersToViewController(vc: vc, context: context)
        return vc
    }
    
    func selectedAnnotation(annotation: MapboxMaps.Annotation) {
        
        selectedDetector = SessionManager.shared.newProperty?.detectors.first(where: { detector in
            detector.id == annotation.id
        })
        showDetectorDetails = true
    }
    
    func makeCoordinator() -> MapboxPlaceSensorViewCoordinator {
        return MapboxPlaceSensorViewCoordinator(self)
    }
    
    func updateUIViewController(_ uiViewController: MapboxPlaceSensorViewController, context: Context) {
        
        self.setupCameraOptinos(uiViewController: uiViewController)
        self.setupPinImage(uiViewController: uiViewController)
        self.loadDetectors(uiViewController: uiViewController)
    }
    
    final class MapboxPlaceSensorViewCoordinator: NSObject, AnnotationInteractionDelegate {
        
        var mapboxPlaceSensorViewWrapper: MapboxPlaceSensorViewWrapper
        
        init(_ mapboxPlaceSensorViewWrapper: MapboxPlaceSensorViewWrapper) {
            self.mapboxPlaceSensorViewWrapper = mapboxPlaceSensorViewWrapper
        }
        
        func annotationManager(_ manager: MapboxMaps.AnnotationManager, didDetectTappedAnnotations annotations: [MapboxMaps.Annotation]) {
            mapboxPlaceSensorViewWrapper.selectedAnnotation(annotation: annotations[0])
        }
    }
    
    func addMarkersToViewController(vc: MapboxPlaceSensorViewController, context: Context) {
        
        vc.annotationManager = vc.mapView.annotations.makePointAnnotationManager()
        
        let customView = self.createCustomView()
        if let coordinate = sessionManager.selectedProperty?.coordinate {
            let propertyAnnotationOptions = ViewAnnotationOptions(
                geometry: Point(coordinate),
                width: customView.frame.width,
                height: 50,
                allowOverlap: false,
                anchor: .left
            )
            try? vc.mapView.viewAnnotations.add(customView, options: propertyAnnotationOptions)
            vc.annotationManager.delegate = context.coordinator
        }
    }
    
    func createMapboxPlaceSensorViewController() -> MapboxPlaceSensorViewController {
        
        let vc = MapboxPlaceSensorViewController()
        let myResourceOptions = ResourceOptions(accessToken: accessToken)
        let cameraOptions = CameraOptions(center: sessionManager.selectedProperty?.coordinate, padding: .init(top: 0, left: 0, bottom: self.mapOffset.height == 0 ? 355 : self.mapOffset.height, right: 0), zoom: self.zoomLevel, bearing: 0.0, pitch: 0.0)
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: cameraOptions, styleJSON: jsonString)
        vc.mapView = MapView(frame: UIScreen.main.bounds, mapInitOptions: myMapInitOptions)
        vc.mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vc.mapView.ornaments.compassView.isHidden = true
        vc.mapView.ornaments.scaleBarView.isHidden = true
        vc.mapView.mapboxMap.onEvery(event: .cameraChanged) { event in
            pin = vc.mapView.cameraState.center
            vc.pinImageView.frame = CGRectMake(vc.mapView.anchor.x - 30, vc.mapView.anchor.y - 80, 60, 69)
        }
        vc.mapView.location.options.puckType = .puck2D(Puck2DConfiguration.makeDefault(showBearing: true))
        
        vc.pinImageView = UIImageView(image: UIImage(named: "Pin"))
        vc.pinImageView.isHidden = true
        return vc
    }
    
    func setupCameraOptinos(uiViewController: MapboxPlaceSensorViewController) {
        if self.moveToUserTapped {
            
            DispatchQueue.main.async {
                var cameraOptions = CameraOptions(padding: .init(top: -28, left: 0, bottom: self.mapOffset.height, right: 0), zoom: 15.0, bearing: 0.0, pitch: 0.0)
                self.moveToUserTapped = false
                cameraOptions.center = uiViewController.mapView.location.latestLocation?.coordinate
                uiViewController.mapView.camera.fly(to: cameraOptions, duration: 0.1)
            }
        } else if (selectedDetector != nil && self.sensorTapped) {
            
            var cameraOptions = CameraOptions(padding: .init(top: 0, left: 0, bottom: self.mapOffset.height, right: 0), zoom: zoomLevel, bearing: 0.0, pitch: 0.0)
            if let selectedDetector = selectedDetector, let coordinate = selectedDetector.coordinate {
                cameraOptions.center = coordinate
            }
            uiViewController.mapView.camera.fly(to: cameraOptions, duration: 0.1)
        } else if (uiViewController.mapView.cameraState.padding.bottom != self.mapOffset.height) {
            
            let cameraOptions = CameraOptions(padding: .init(top: 0, left: 0, bottom: self.mapOffset.height, right: 0), zoom: zoomLevel, bearing: 0.0, pitch: 0.0)
            uiViewController.mapView.camera.fly(to: cameraOptions, duration: 0.1)
        }
    }
    
    func setupPinImage(uiViewController: MapboxPlaceSensorViewController) {
        
        if self.needsLocationPin {
            uiViewController.pinImageView.isHidden = false
            let anchorX = uiViewController.mapView.anchor.x
            let anchorY = uiViewController.mapView.anchor.y
            uiViewController.pinImageView.frame = CGRectMake(anchorX - 30, anchorY - 80, 60, 69)
        } else {
            uiViewController.pinImageView.isHidden = true
        }
    }

    func loadDetectors(uiViewController: MapboxPlaceSensorViewController) {
        
        uiViewController.annotationManager.annotations = []
        if let detectors = sessionManager.selectedProperty?.detectors {
            for detector in detectors {
                if let coordinate = detector.coordinate {
                    var pointAnnotation = PointAnnotation(id: detector.id, coordinate: coordinate)
                    var annotationIcon = "DetectorIcons/\(detector.sensorIdx ?? 0)"
                    if detector.threat == Threat.Red {
                        annotationIcon = "DetectorIcons/ThreatRed"
                    } else if detector.threat == Threat.Yellow {
                        annotationIcon = "DetectorIcons/ThreatYellow"
                    }
                    
                    if let annotationImage = UIImage(named: annotationIcon) {
                        
                        pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
                        pointAnnotation.iconAnchor = .bottom
                        pointAnnotation.iconSize = 0.25
                        uiViewController.annotationManager.annotations.append(pointAnnotation)
                    }
                }
            }
        }
        self.loadAnnotations(uiViewController: uiViewController)
    }
    
    func loadAnnotations(uiViewController: MapboxPlaceSensorViewController) {
        for annotation in self.annotations {
            uiViewController.annotationManager.annotations.append(annotation)
        }
    }
    
    func makeRectShape(customView: PropertyIconView) -> CAShapeLayer {
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = customView.frame
        rectShape.position = customView.center
        let width = customView.propertyMainView.bounds.width
        let height = customView.propertyMainView.bounds.height
        rectShape.path = UIBezierPath(
            roundedRect: CGRectMake(0, 0, width, height),
            byRoundingCorners: [.topRight, .bottomRight],
            cornerRadii: CGSize(width: 50, height: 50)).cgPath
        return rectShape
    }
    
    func createCustomView() -> PropertyIconView {
        
        let customView = PropertyIconView.instanceFromNib()
        customView.configure(with: SessionManager.shared.selectedProperty?.propertyName ?? "")
        customView.propertyMainView.layer.mask = self.makeRectShape(customView: customView)
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOpacity = 0.2
        customView.layer.shadowOffset = .zero
        customView.layer.shadowRadius = 4
        
        customView.propertyMainView.layoutIfNeeded()
        customView.propertyLabel.text = SessionManager.shared.selectedProperty?.propertyName
        if let torchGreen = CustomColors.TorchGreen.cgColor {
            customView.propertyLabel.textColor = UIColor(cgColor: torchGreen)
        }
        customView.propertyMainView.backgroundColor = UIColor.white
        customView.configure(with: SessionManager.shared.selectedProperty?.propertyName ?? "")
        return customView
    }
}
