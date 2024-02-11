//
//  MapboxMapViewWrapper.swift
//  TorchUI
//
//  Created by Parth Saxena on 9/20/23.
//

import Foundation
import SwiftUI
import MapboxMaps

struct MapboxMapViewWrapper: UIViewControllerRepresentable {
    let jsonString = Strings.jsonString
    
    @Binding var showDetectorDetails: Bool
    @Binding var zoomLevel: CGFloat
    @ObservedObject var sessionManager = SessionManager.shared
    @Binding var selectedDetectorIndex: Int
    @Binding var annotations: [PointAnnotation]
    @Binding var pin: CLLocationCoordinate2D
    @Binding var needsLocationPin: Bool
    @Binding var sensorTapped: Bool
    @Binding var moveToUserTapped: Bool
    @Binding var zoomChanged: Bool
    @Binding var mapOffset: CGFloat
    @Binding var dragOffset: CGSize
    @State var triggerUI: Bool = false
    @State var initialMapOffset: Bool = false
    
    @Binding var annotationsStatus: DetectorInfoStatus
    
    let ICON_SMALL_ZOOM_THRESHOLD = 12.0
    
    func makeUIViewController(context: Context) -> MapboxViewController {
        
        let vc = MapboxViewController()
        vc.zoomLevel = self.zoomLevel

        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1IjoidnRyZW1zaW4iLCJhIjoiY2xsNzE0M2lmMGd0eTNnazRjM2s3MndvZCJ9.z9GP9XylmH4RKR-swu14nA")
        let cameraOptions = CameraOptions(center: sessionManager.selectedProperty?.coordinate, padding: UIEdgeInsets(top: 0.0, left: 0.0, bottom: self.mapOffset, right: 0.0), anchor: CGPoint(x: 0, y: 17), zoom: self.zoomLevel, bearing: 0.0, pitch: 0.0)
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: cameraOptions, styleJSON: self.jsonString)
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        vc.mapView = MapView(frame: frame, mapInitOptions: myMapInitOptions)
        vc.mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vc.mapView.ornaments.compassView.isHidden = true
        vc.mapView.ornaments.scaleBarView.isHidden = true
        vc.mapView.mapboxMap.onEvery(event: .cameraChanged) { event in
            pin = vc.mapView.cameraState.center
            print("Set pin: \(pin)")
            print("camera state: \(vc.mapView.cameraState.center)")
            triggerUI.toggle()
//            self.checkZoomLevelAnnotations(uiViewController: vc)
            vc.pinImageView.frame = CGRectMake(vc.mapView.anchor.x - 30, vc.mapView.anchor.y - 80, 60, 69)
        }
        print("GOOOO mapOff: \(self.mapOffset)")
        vc.mapView.location.options.puckType = .puck2D(Puck2DConfiguration.makeDefault(showBearing: true))
        vc.pinImageView = UIImageView(image: UIImage(named: "Pin"))
        vc.pinImageView.isHidden = true
        addMarkersToViewController(vc: vc, context: context)
        return vc
    }
    
    func selectedAnnotation(annotation: MapboxMaps.Annotation) {
        
        let id = annotation.id
        let impactMed = UIImpactFeedbackGenerator(style: .medium)
        impactMed.impactOccurred()

        for i in 0..<SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count {
            if SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].id == id {
                SessionManager.shared.selectedDetectorIndex = i
                selectedDetectorIndex = i
                break
            }
        }
        zoomLevel = 15
        sensorTapped = true
        showDetectorDetails = true
        dragOffset = .zero
    }
    
    func addPropertyIconMarker(vc: MapboxViewController) {
        let customView = PropertyIconView.instanceFromNib()
        customView.configure(with: SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName)
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = customView.frame
        rectShape.position = customView.center
        rectShape.path = UIBezierPath(roundedRect: CGRectMake(0, 0, customView.propertyMainView.bounds.width, customView.propertyMainView.bounds.height), byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 50, height: 50)).cgPath
        
        print("Creating rectshape: \(CGRectMake(0, 0, customView.propertyMainView.bounds.width, customView.propertyMainView.bounds.height))")
        customView.propertyMainView.layer.mask = rectShape
        
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOpacity = 0.2
        customView.layer.shadowOffset = .zero
        customView.layer.shadowRadius = 4
        
        customView.propertyMainView.layoutIfNeeded()
        customView.propertyLabel.text = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName
        if let torchGreen = CustomColors.TorchGreen.cgColor {
            customView.propertyLabel.textColor = UIColor(cgColor: torchGreen)
        }
        customView.propertyMainView.backgroundColor = UIColor.white
        customView.configure(with: SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName)
        print("Got width conf: \(customView.frame.width)")
        if let coordinate = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].coordinate {
            let propertyAnnotationOptions = ViewAnnotationOptions(
                geometry: Point(coordinate),
                width: customView.frame.width,
                height: 50,
                allowOverlap: false,
                anchor: .left
            )
            try? vc.mapView.viewAnnotations.add(customView, options: propertyAnnotationOptions)
        }
    }
    
    func addMarkersToViewController(vc: MapboxViewController, context: Context) {
        vc.annotationManager = vc.mapView.annotations.makePointAnnotationManager()
        
        // Build property icon view
        let customView = PropertyIconView.instanceFromNib()
        customView.configure(with: SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName)
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = customView.frame
        rectShape.position = customView.center
        rectShape.path = UIBezierPath(roundedRect: CGRectMake(0, 0, customView.propertyMainView.bounds.width, customView.propertyMainView.bounds.height), byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 50, height: 50)).cgPath
        
        print("Creating rectshape: \(CGRectMake(0, 0, customView.propertyMainView.bounds.width, customView.propertyMainView.bounds.height))")
        customView.propertyMainView.layer.mask = rectShape
        
        customView.layer.shadowColor = UIColor.black.cgColor
        customView.layer.shadowOpacity = 0.2
        customView.layer.shadowOffset = .zero
        customView.layer.shadowRadius = 4
        
        customView.propertyMainView.layoutIfNeeded()
        customView.propertyLabel.text = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName
        if let torchGreen = CustomColors.TorchGreen.cgColor {
            customView.propertyLabel.textColor = UIColor(cgColor: torchGreen)
        }
        customView.propertyMainView.backgroundColor = UIColor.white
        customView.configure(with: SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName)
        print("Got width conf: \(customView.frame.width)")
        vc.mapView.viewAnnotations.removeAll()
        if let coordinate = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].coordinate {
            let propertyAnnotationOptions = ViewAnnotationOptions(
                geometry: Point(coordinate),
                width: customView.frame.width,
                height: 50,
                allowOverlap: false,
                anchor: .left
            )
            try? vc.mapView.viewAnnotations.add(customView, options: propertyAnnotationOptions)
        }
        // iterate over selected property's detectors
        if SessionManager.shared.selectedPropertyIndex < SessionManager.shared.properties.count {
            for detector in SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors {
                if let coord = detector.coordinate {
                    //TODO: - Check for selected detector status from UserDefaults
                    
//                    print("annotations status is set to : \(annotationsStatus)")
//                    var pointAnnotation = PointAnnotation(id: detector.id, coordinate: coordinate)
//                    var annotationIcon = "DetectorIcons/\(max(detector.sensorIdx ?? 0, 1))"
//                    if detector.threat == Threat.Red {
//                        annotationIcon = "DetectorIcons/ThreatRed"
//                    } else if detector.threat == Threat.Yellow {
//                        annotationIcon = "DetectorIcons/ThreatYellow"
//                    }
//
//                    if let annotationImage = UIImage(named: annotationIcon) {
//                        pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
//                        pointAnnotation.iconAnchor = .left
//                        pointAnnotation.iconSize = 0.25
//                    }
//                    vc.annotationManager.annotations.append(pointAnnotation)
                    
                    
                    var pointAnnotation = PointAnnotation(id: detector.id, coordinate: coord)
                    var annotationIcon = ""
                                    
                    if vc.mapView.cameraState.zoom < ICON_SMALL_ZOOM_THRESHOLD {
                        switch detector.threat {
                        case .Red:
                            annotationIcon = "DetectorIcons/ThreatRedSmall"
                        case .Yellow:
                            annotationIcon = "DetectorIcons/ThreatYellowSmall"
                        case .Green:
                            annotationIcon = "DetectorIcons/ThreatGreenSmall"
                        }
                        pointAnnotation.iconSize = 0.25
                        
                    } else {
                        switch annotationsStatus {
                        case .fire:
                            switch detector.threat {
                            case .Red:
                                annotationIcon = "DetectorIcons/ThreatMapRed\(max(detector.sensorIdx ?? 0, 1))"
                            case .Yellow:
                                annotationIcon = "DetectorIcons/ThreatMapYellow\(max(detector.sensorIdx ?? 0, 1))"
                            case .Green:
                                annotationIcon = "DetectorIcons/\(max(detector.sensorIdx ?? 0, 1))"
                            }
                            pointAnnotation.iconSize = 0.25
                            
                        case .battery:
                            if detector.deviceBattery < 20 {
                                annotationIcon = "battery-bad\(max(detector.sensorIdx ?? 0, 1))"
                            } else if detector.deviceBattery < 70 {
                                annotationIcon = "battery-mid\(max(detector.sensorIdx ?? 0, 1))"
                            } else {
                                annotationIcon = "battery-good\(max(detector.sensorIdx ?? 0, 1))"
                            }

                        case .connection:
                            if detector.connected {
                                annotationIcon = "connection-good\(max(detector.sensorIdx ?? 0, 1))"
                            } else {
                                annotationIcon = "connection-bad\(max(detector.sensorIdx ?? 0, 1))"
                            }

                        case .temperature:
                            switch detector.threat {
                            case .Red:
                                annotationIcon = "temperature-bad\(max(detector.sensorIdx ?? 0, 1))"
                            case .Yellow:
                                annotationIcon = "temperature-mid\(max(detector.sensorIdx ?? 0, 1))"
                            case .Green:
                                annotationIcon = "temperature-good\(max(detector.sensorIdx ?? 0, 1))"
                            }
                            
                        case .humidity:
                            switch detector.threat {
                            case .Red:
                                annotationIcon = "humidity-bad\(max(detector.sensorIdx ?? 0, 1))"
                            case .Yellow:
                                annotationIcon = "humidity-mid\(max(detector.sensorIdx ?? 0, 1))"
                            case .Green:
                                annotationIcon = "humidity-good\(max(detector.sensorIdx ?? 0, 1))"
                            }
                        }
                    }

                    if let annotationImage = UIImage(named: annotationIcon) {
                        pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
                    }
                    pointAnnotation.iconAnchor = .center
                    print("Adding annot updateUI")
                    vc.annotationManager.annotations.append(pointAnnotation)
                
                    
                    
                }
            }
        }
        vc.annotationManager.delegate = context.coordinator
    }
    
    func makeCoordinator() -> MapboxViewCoordinator {
        return MapboxViewCoordinator(self)
    }
    
    func updateUIViewController(_ uiViewController: MapboxViewController, context: Context) {
        // print("Panning0: \(self.sensorTapped)")
        if (SessionManager.shared.propertyUpdated) {
            print("Update UI add annots trigger")
            SessionManager.shared.propertyUpdated = false
            self.addMarkersToViewController(vc: uiViewController, context: context)
            return
        }
        
        print("GOOOO2 mapOff: \(self.mapOffset)")
        if (self.moveToUserTapped) {
            print("offset: 1")
            DispatchQueue.main.async {
                var cameraOptions = CameraOptions(zoom: 15.0, bearing: 0.0, pitch: 0.0)
                self.moveToUserTapped = false
                print("camera state: \(uiViewController.mapView.cameraState.center)")
                print("latestLocation: \(uiViewController.mapView.location.latestLocation?.coordinate)")
                cameraOptions.center = uiViewController.mapView.location.latestLocation?.coordinate
                cameraOptions.padding = UIEdgeInsets(top: 0.0, left: 0.0, bottom: self.mapOffset, right: 0.0)
                uiViewController.mapView.camera.fly(to: cameraOptions, duration: 0.1)
            }
        } else if (self.sensorTapped) {
            print("offset: 2")
            DispatchQueue.main.async {
                var cameraOptions = CameraOptions(zoom: zoomLevel, bearing: 0.0, pitch: 0.0)
                self.sensorTapped = false
                cameraOptions.center = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].coordinate
                cameraOptions.padding = UIEdgeInsets(top: 0.0, left: 0.0, bottom: self.mapOffset, right: 0.0)
                uiViewController.mapView.camera.fly(to: cameraOptions, duration: 0.1)
            }
        } else if (self.zoomChanged) {
            print("offset: 3")
            DispatchQueue.main.async {
                self.zoomChanged = false
                var cameraOptions = CameraOptions(zoom: zoomLevel, bearing: 0.0, pitch: 0.0)
                cameraOptions.padding = UIEdgeInsets(top: 0.0, left: 0.0, bottom: self.mapOffset, right: uiViewController.mapView.cameraState.padding.right)
                uiViewController.mapView.camera.fly(to: cameraOptions, duration: 0.1)
            }
        } else if (!self.initialMapOffset && self.mapOffset != 0) {
            print("offset: 4")
            DispatchQueue.main.async {
                self.initialMapOffset = true
                var cameraOptions = CameraOptions(zoom: zoomLevel, bearing: 0.0, pitch: 0.0)
                cameraOptions.padding = UIEdgeInsets(top: 0.0, left: 0.0, bottom: self.mapOffset, right: uiViewController.mapView.cameraState.padding.right)
                uiViewController.mapView.camera.fly(to: cameraOptions, duration: 0.1)
            }
        }

        if self.needsLocationPin {
            uiViewController.pinImageView.isHidden = false
            uiViewController.pinImageView.frame = CGRectMake(uiViewController.mapView.anchor.x - 30, uiViewController.mapView.anchor.y - 80, 60, 69)
        } else {
            uiViewController.pinImageView.isHidden = true
        }

        print("updating annots: \(uiViewController.annotationManager.annotations)")
        uiViewController.annotationManager.annotations = []
        if (SessionManager.shared.selectedPropertyIndex >= 0 && SessionManager.shared.selectedPropertyIndex < SessionManager.shared.properties.count) {
            let detectors = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors
            for detector in detectors {
                guard let coord = detector.coordinate else {
                    continue
                }
                
                var pointAnnotation = PointAnnotation(id: detector.id, coordinate: coord)
                var annotationIcon = ""
                                
                if uiViewController.mapView.cameraState.zoom < ICON_SMALL_ZOOM_THRESHOLD {
                    switch detector.threat {
                    case .Red:
                        annotationIcon = "DetectorIcons/ThreatRedSmall"
                    case .Yellow:
                        annotationIcon = "DetectorIcons/ThreatYellowSmall"
                    case .Green:
                        annotationIcon = "DetectorIcons/ThreatGreenSmall"
                    }
                    pointAnnotation.iconSize = 0.25
                    
                } else {
                    switch annotationsStatus {
                    case .fire:
                        switch detector.threat {
                        case .Red:
                            annotationIcon = "DetectorIcons/ThreatMapRed\(max(detector.sensorIdx ?? 0, 1))"
                        case .Yellow:
                            annotationIcon = "DetectorIcons/ThreatMapYellow\(max(detector.sensorIdx ?? 0, 1))"
                        case .Green:
                            annotationIcon = "DetectorIcons/\(max(detector.sensorIdx ?? 0, 1))"
                        }
                        pointAnnotation.iconSize = 0.25
                        
                    case .battery:
                        if detector.deviceBattery < 20 {
                            annotationIcon = "battery-bad\(max(detector.sensorIdx ?? 0, 1))"
                        } else if detector.deviceBattery < 70 {
                            annotationIcon = "battery-mid\(max(detector.sensorIdx ?? 0, 1))"
                        } else {
                            annotationIcon = "battery-good\(max(detector.sensorIdx ?? 0, 1))"
                        }

                    case .connection:
                        if detector.connected {
                            annotationIcon = "connection-good\(max(detector.sensorIdx ?? 0, 1))"
                        } else {
                            annotationIcon = "connection-bad\(max(detector.sensorIdx ?? 0, 1))"
                        }

                    case .temperature:
                        switch detector.threat {
                        case .Red:
                            annotationIcon = "temperature-bad\(max(detector.sensorIdx ?? 0, 1))"
                        case .Yellow:
                            annotationIcon = "temperature-mid\(max(detector.sensorIdx ?? 0, 1))"
                        case .Green:
                            annotationIcon = "temperature-good\(max(detector.sensorIdx ?? 0, 1))"
                        }
                        
                    case .humidity:
                        switch detector.threat {
                        case .Red:
                            annotationIcon = "humidity-bad\(max(detector.sensorIdx ?? 0, 1))"
                        case .Yellow:
                            annotationIcon = "humidity-mid\(max(detector.sensorIdx ?? 0, 1))"
                        case .Green:
                            annotationIcon = "humidity-good\(max(detector.sensorIdx ?? 0, 1))"
                        }
                    }
                }

                if let annotationImage = UIImage(named: annotationIcon) {
                    pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
                }
                pointAnnotation.iconAnchor = .center
                print("Adding annot updateUI")
                uiViewController.annotationManager.annotations.append(pointAnnotation)
            }
        }
        
//        for annotation in self.annotations {
//            uiViewController.annotationManager.annotations.append(annotation)
//        }
    }
    
    func checkZoomLevelAnnotations(uiViewController: MapboxViewController) {
        print("updating annots 1: \(uiViewController.annotationManager.annotations)")
        uiViewController.annotationManager.annotations = []
        if (SessionManager.shared.selectedPropertyIndex >= 0 && SessionManager.shared.selectedPropertyIndex < SessionManager.shared.properties.count) {
            let detectors = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors
            for detector in detectors {
                guard let coord = detector.coordinate else {
                    continue
                }
                
                var pointAnnotation = PointAnnotation(id: detector.id, coordinate: coord)
                var annotationIcon = "DetectorIcons/ThreatGreenSmall"
                if detector.threat == Threat.Red {
                    annotationIcon = "DetectorIcons/ThreatMapRed\(max(detector.sensorIdx ?? 0, 1))"
                    if uiViewController.mapView.cameraState.zoom < ICON_SMALL_ZOOM_THRESHOLD {
                        annotationIcon = "DetectorIcons/ThreatRedSmall"
                    }
                } else if detector.threat == Threat.Yellow {
                    annotationIcon = "DetectorIcons/ThreatMapYellow\(max(detector.sensorIdx ?? 0, 1))"
                    if uiViewController.mapView.cameraState.zoom < ICON_SMALL_ZOOM_THRESHOLD {
                        annotationIcon = "DetectorIcons/ThreatYellowSmall"
                    }
                } else {
                    annotationIcon = "DetectorIcons/\(max(detector.sensorIdx ?? 0, 1))"
                    if uiViewController.mapView.cameraState.zoom < ICON_SMALL_ZOOM_THRESHOLD {
                        annotationIcon = "DetectorIcons/ThreatGreenSmall"
                    }
                }

                if let annotationImage = UIImage(named: annotationIcon) {
                    pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
                }
                pointAnnotation.iconAnchor = .center
                pointAnnotation.iconSize = 0.25
                
                print("Adding annot updateUI")
                uiViewController.annotationManager.annotations.append(pointAnnotation)
            }
        }
        
        for annotation in self.annotations {
            uiViewController.annotationManager.annotations.append(annotation)
        }
    }
    
    final class MapboxViewCoordinator: NSObject, AnnotationInteractionDelegate {
        var mapboxMapViewWrapper: MapboxMapViewWrapper
        
        init(_ mapboxMapViewWrapper: MapboxMapViewWrapper) {
            self.mapboxMapViewWrapper = mapboxMapViewWrapper
        }
        
        func annotationManager(_ manager: MapboxMaps.AnnotationManager, didDetectTappedAnnotations annotations: [MapboxMaps.Annotation]) {
            mapboxMapViewWrapper.selectedAnnotation(annotation: annotations[0])
        }
    }
}
