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
    @Binding var mapLayerTapped: Bool
    @Binding var zoomChanged: Bool
    @Binding var mapOffset: CGFloat
    @Binding var dragOffset: CGSize
    @Binding var didChangeSensorPosition: Bool
    @State var triggerUI: Bool = false
    @State var initialMapOffset: Bool = false
    @State var isHighZoom: Bool = true
    
    @Binding var isOnSatellite: Bool
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
        vc.mapView.gestures.options.rotateEnabled = false
        vc.annotationManager = vc.mapView.annotations.makePointAnnotationManager()
        vc.annotationManager.delegate = context.coordinator
//        vc.mapView.mapboxMap.loadStyleJSON(Strings.satelliteJSONString)
        vc.mapView.mapboxMap.onEvery(event: .cameraChanged) { event in
            pin = vc.mapView.cameraState.center
            self.zoomLevel = vc.mapView.cameraState.zoom
            print("Set pin: \(pin)")
            print("camera state: \(vc.mapView.cameraState.center)")
            triggerUI.toggle()
//            self.checkZoomLevelAnnotations(uiViewController: vc)
            self.updateAnnotations(uiViewController: vc)
            vc.pinImageView.frame = CGRectMake(vc.mapView.anchor.x - 30, vc.mapView.anchor.y - 80, 60, 69)
        }
        print("GOOOO mapOff: \(self.mapOffset)")
        vc.mapView.location.options.puckType = .puck2D(Puck2DConfiguration.makeDefault(showBearing: true))
        vc.pinImageView = UIImageView(image: UIImage(named: "Pin"))
        vc.pinImageView.isHidden = true
        addMarkersToViewController(vc: vc, context: context)
        self.makeAnnotations(uiViewController: vc)
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
    
//    func addPropertyIconMarker(vc: MapboxViewController) {
//        let customView = PropertyIconView.instanceFromNib()
//        customView.configure(with: SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName)
//        
//        let rectShape = CAShapeLayer()
//        rectShape.bounds = customView.frame
//        rectShape.position = customView.center
//        rectShape.path = UIBezierPath(roundedRect: CGRectMake(0, 0, customView.propertyMainView.bounds.width, customView.propertyMainView.bounds.height), byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 50, height: 50)).cgPath
//        
//        print("Creating rectshape: \(CGRectMake(0, 0, customView.propertyMainView.bounds.width, customView.propertyMainView.bounds.height))")
//        customView.propertyMainView.layer.mask = rectShape
//        
//        customView.layer.shadowColor = UIColor.black.cgColor
//        customView.layer.shadowOpacity = 0.2
//        customView.layer.shadowOffset = .zero
//        customView.layer.shadowRadius = 4
//        
//        customView.propertyMainView.layoutIfNeeded()
//        customView.propertyLabel.text = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName
//        if let torchGreen = CustomColors.TorchGreen.cgColor {
//            customView.propertyLabel.textColor = UIColor(cgColor: torchGreen)
//        }
//        customView.propertyMainView.backgroundColor = UIColor.white
//        customView.configure(with: SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName)
//        print("Got width conf: \(customView.frame.width)")
//        if let coordinate = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].coordinate {
//            let propertyAnnotationOptions = ViewAnnotationOptions(
//                geometry: Point(coordinate),
//                width: customView.frame.width,
//                height: 50,
//                allowOverlap: false,
//                anchor: .left
//            )
//            try? vc.mapView.viewAnnotations.add(customView, options: propertyAnnotationOptions)
//        }
//    }
    
    func addMarkersToViewController(vc: MapboxViewController, context: Context) {
//        vc.annotationManager = vc.mapView.annotations.makePointAnnotationManager()
//        
//        // Build property icon view
//        let customView = PropertyIconView.instanceFromNib()
//        customView.configure(with: SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName)
//        
//        let rectShape = CAShapeLayer()
//        rectShape.bounds = customView.frame
//        rectShape.position = customView.center
//        rectShape.path = UIBezierPath(roundedRect: CGRectMake(0, 0, customView.propertyMainView.bounds.width, customView.propertyMainView.bounds.height), byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 50, height: 50)).cgPath
//        
//        print("Creating rectshape: \(CGRectMake(0, 0, customView.propertyMainView.bounds.width, customView.propertyMainView.bounds.height))")
//        customView.propertyMainView.layer.mask = rectShape
//        
//        customView.layer.shadowColor = UIColor.black.cgColor
//        customView.layer.shadowOpacity = 0.2
//        customView.layer.shadowOffset = .zero
//        customView.layer.shadowRadius = 4
//        
//        customView.propertyMainView.layoutIfNeeded()
//        customView.propertyLabel.text = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName
//        if let torchGreen = CustomColors.TorchGreen.cgColor {
//            customView.propertyLabel.textColor = UIColor(cgColor: torchGreen)
//        }
//        customView.propertyMainView.backgroundColor = UIColor.white
//        customView.configure(with: SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName)
//        print("Got width conf: \(customView.frame.width)")
//        vc.mapView.viewAnnotations.removeAll()
//        if let coordinate = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].coordinate {
//            let propertyAnnotationOptions = ViewAnnotationOptions(
//                geometry: Point(coordinate),
//                width: customView.frame.width,
//                height: 50,
//                allowOverlap: false,
//                anchor: .left
//            )
//            try? vc.mapView.viewAnnotations.add(customView, options: propertyAnnotationOptions)            
//        }
//        // iterate over selected property's detectors
//        if SessionManager.shared.selectedPropertyIndex < SessionManager.shared.properties.count {
//            for detector in SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors {
//                if let coordinate = detector.coordinate {
//                    
//                    let startAngle = Angle(degrees: 168.75)
//                    let endAngle = Angle(degrees: 180)
//                    
//                    // Use right
//                    if (startAngle.degrees > 0 && startAngle.degrees < 180) {
//                        
//                        print("custom annot: leftcustom")
//                        let customAnnotationView = UIHostingController(rootView: LeftCustomAnnotationView(text: "\(max(detector.sensorIdx ?? 0, 1))", startAngle: startAngle, endAngle: endAngle))
//                        customAnnotationView.view.frame = CGRect(x: 0, y: 0, width: 90, height: 17)
//                        customAnnotationView.view.backgroundColor = .clear
//                        customAnnotationView.view.sizeToFit()
//
//                        let options = ViewAnnotationOptions(
//                            geometry: Point(coordinate),
//                            width: customAnnotationView.view.bounds.width,
//                            height: customAnnotationView.view.bounds.height,
//                            associatedFeatureId: nil,
//                            allowOverlap: false,
//                            visible: true,
//                            anchor: .right
//                        )
//
//                        // Add the view annotation to the MapView's view annotation manager
//                        do {
//                            try vc.mapView.viewAnnotations.add(customAnnotationView.view, options: options)
//                        } catch {
//                            print("Failed to add the custom view annotation: \(error)")
//                        }
//                    } else {
//                        
//                        print("custom annot: rightcustom")
//                        let customAnnotationView = UIHostingController(rootView: RightCustomAnnotationView(text: "\(max(detector.sensorIdx ?? 0, 1))", startAngle: startAngle, endAngle: endAngle))
//                        customAnnotationView.view.frame = CGRect(x: 0, y: 0, width: 50, height: 17)
//                        customAnnotationView.view.backgroundColor = .clear
//                        customAnnotationView.view.sizeToFit()
//
//                        let options = ViewAnnotationOptions(
//                            geometry: Point(coordinate),
//                            width: customAnnotationView.view.bounds.width,
//                            height: customAnnotationView.view.bounds.height,
//                            associatedFeatureId: nil,
//                            allowOverlap: false,
//                            visible: true,
//                            anchor: .left
//                        )
//
//                        // Add the view annotation to the MapView's view annotation manager
//                        do {
//                            try vc.mapView.viewAnnotations.add(customAnnotationView.view, options: options)
//                        } catch {
//                            print("Failed to add the custom view annotation: \(error)")
//                        }
//                    }
//                    
////                    var pointAnnotation = PointAnnotation(id: detector.id, coordinate: coordinate)
////                    var annotationIcon = "DetectorIcons/\(max(detector.sensorIdx ?? 0, 1))"
////                    if detector.threat == Threat.Red {
////                        annotationIcon = "DetectorIcons/ThreatRed"
////                    } else if detector.threat == Threat.Yellow {
////                        annotationIcon = "DetectorIcons/ThreatYellow"
////                    }
////
////                    if let annotationImage = UIImage(named: annotationIcon) {
////                        pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
////                        pointAnnotation.iconAnchor = .left
////                        pointAnnotation.iconSize = 0.25
////                    }
////                    vc.annotationManager.annotations.append(pointAnnotation)
//                }
//            }
//        }
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
//            self.addMarkersToViewController(vc: uiViewController, context: context)
            self.makeAnnotations(uiViewController: uiViewController)
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
        } else if (self.mapLayerTapped) {
            DispatchQueue.main.async {
                self.mapLayerTapped = false
                print("map layer tapped: \(self.mapLayerTapped)")
                if (self.isOnSatellite) {
                    uiViewController.mapView.mapboxMap.loadStyleJSON(Strings.jsonString) { _ in
                        self.isOnSatellite = false
                    }
                    //                    loadStyleJSON(Strings.jsonString)
                } else {
                    uiViewController.mapView.mapboxMap.loadStyleJSON(Strings.satelliteJSONString) { _ in
                        self.isOnSatellite = true
                    }
                    //                    uiViewController.mapView.mapboxMap.loadStyleJSON(Strings.satelliteJSONString)
                }
            }
        } else if (self.didChangeSensorPosition) {
            DispatchQueue.main.async {
                self.didChangeSensorPosition = false
                
                let propertyIdx = SessionManager.shared.selectedPropertyIndex
                let sensorIdx = SessionManager.shared.selectedDetectorIndex
                
//                SessionManager.shared.updateSensor(property_id: SessionManager.shared.properties[propertyIdx].id, device_id: SessionManager.shared.properties[propertyIdx].detectors[sensorIdx].id, coordinate: uiViewController.mapView.location.latestLocation?.coordinate, deviceName: SessionManager.shared.properties[propertyIdx].detectors[sensorIdx].deviceName)
//                SessionManager.shared.properties[propertyIdx].detectors[sensorIdx].coordinate = uiViewController.mapView.location.latestLocation?.coordinate
                print("SENS UPDATE1 \(SessionManager.shared.properties[propertyIdx].detectors[sensorIdx].id) \(uiViewController.mapView.location.latestLocation?.coordinate)")
//                cameraOptions.padding = UIEdgeInsets(top: 0.0, left: 0.0, bottom: self.mapOffset, right: 0.0)
//                var cameraOptions = CameraOptions(zoom: zoomLevel, bearing: 0.0, pitch: 0.0)
//                cameraOptions.center = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].coordinate
//                uiViewController.mapView.camera.fly(to: cameraOptions, duration: 0.1)
                self.makeAnnotations(uiViewController: uiViewController)
                self.sensorTapped = true
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
        self.updateAnnotations(uiViewController: uiViewController)
        
//        uiViewController.mapView.viewAnnotations.annotations.forEach { (key: UIView, value: ViewAnnotationOptions) in
//            if key.frame.minY < 150 {
//                key.isHidden = true
//            } else {
//                key.isHidden = false
//            }
//        }
        
//        self.makeAnnotations(uiViewController: uiViewController)
//        uiViewController.annotationManager.annotations = []
//        if (SessionManager.shared.selectedPropertyIndex >= 0 && SessionManager.shared.selectedPropertyIndex < SessionManager.shared.properties.count) {
//            let detectors = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors
//            for detector in detectors {
//                guard let coord = detector.coordinate else {
//                    continue
//                }
//                
//                var pointAnnotation = PointAnnotation(id: detector.id, coordinate: coord)
//                var annotationIcon = "DetectorIcons/ThreatGreenSmall"
//                if detector.threat == Threat.Red {
//                    annotationIcon = "DetectorIcons/ThreatMapRed\(max(detector.sensorIdx ?? 0, 1))"
//                    if uiViewController.mapView.cameraState.zoom < ICON_SMALL_ZOOM_THRESHOLD {
//                        annotationIcon = "DetectorIcons/ThreatRedSmall"
//                    }
//                } else if detector.threat == Threat.Yellow {
//                    annotationIcon = "DetectorIcons/ThreatMapYellow\(max(detector.sensorIdx ?? 0, 1))"
//                    if uiViewController.mapView.cameraState.zoom < ICON_SMALL_ZOOM_THRESHOLD {
//                        annotationIcon = "DetectorIcons/ThreatYellowSmall"
//                    }
//                } else {
//                    annotationIcon = "DetectorIcons/\(max(detector.sensorIdx ?? 0, 1))"
//                    if uiViewController.mapView.cameraState.zoom < ICON_SMALL_ZOOM_THRESHOLD {
//                        annotationIcon = "DetectorIcons/ThreatGreenSmall"
//                    }
//                }
//
//                if let annotationImage = UIImage(named: annotationIcon) {
//                    pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
//                }
//                pointAnnotation.iconAnchor = .center
//                pointAnnotation.iconSize = 0.25
//                
//                print("Adding annot updateUI")
//                uiViewController.annotationManager.annotations.append(pointAnnotation)
//            }
//        }
//        
        for annotation in self.annotations {
            uiViewController.annotationManager.annotations.append(annotation)
        }
    }
    
//    func checkZoomLevelAnnotations(uiViewController: MapboxViewController) {
//        print("updating annots 1: \(uiViewController.annotationManager.annotations)")
//        uiViewController.annotationManager.annotations = []
//        if (SessionManager.shared.selectedPropertyIndex >= 0 && SessionManager.shared.selectedPropertyIndex < SessionManager.shared.properties.count) {
//            let detectors = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors
//            for detector in detectors {
//                guard let coord = detector.coordinate else {
//                    continue
//                }
//                
//                var pointAnnotation = PointAnnotation(id: detector.id, coordinate: coord)
//                var annotationIcon = "DetectorIcons/ThreatGreenSmall"
//                if detector.threat == Threat.Red {
//                    annotationIcon = "DetectorIcons/ThreatMapRed\(max(detector.sensorIdx ?? 0, 1))"
//                    if uiViewController.mapView.cameraState.zoom < ICON_SMALL_ZOOM_THRESHOLD {
//                        annotationIcon = "DetectorIcons/ThreatRedSmall"
//                    }
//                } else if detector.threat == Threat.Yellow {
//                    annotationIcon = "DetectorIcons/ThreatMapYellow\(max(detector.sensorIdx ?? 0, 1))"
//                    if uiViewController.mapView.cameraState.zoom < ICON_SMALL_ZOOM_THRESHOLD {
//                        annotationIcon = "DetectorIcons/ThreatYellowSmall"
//                    }
//                } else {
//                    annotationIcon = "DetectorIcons/\(max(detector.sensorIdx ?? 0, 1))"
//                    if uiViewController.mapView.cameraState.zoom < ICON_SMALL_ZOOM_THRESHOLD {
//                        annotationIcon = "DetectorIcons/ThreatGreenSmall"
//                    }
//                }
//
//                if let annotationImage = UIImage(named: annotationIcon) {
//                    pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
//                }
//                pointAnnotation.iconAnchor = .center
//                pointAnnotation.iconSize = 0.25
//                
//                print("Adding annot updateUI")
//                uiViewController.annotationManager.annotations.append(pointAnnotation)
//            }
//        }
//        
//        for annotation in self.annotations {
//            uiViewController.annotationManager.annotations.append(annotation)
//        }
//    }
    
    func makeAnnotations(uiViewController: MapboxViewController) {
        
        uiViewController.mapView.viewAnnotations.removeAll()
        uiViewController.annotationManager.annotations = []
        
        uiViewController.mapView.location.options.puckType = .puck2D(Puck2DConfiguration.makeDefault(showBearing: true))
        isHighZoom = true
        print("MAKING ANNOTATIONS ADDING HIGH ZOOM")        
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
        if let coordinate = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].coordinate {
            let propertyAnnotationOptions = ViewAnnotationOptions(
                geometry: Point(coordinate),
                width: customView.frame.width,
                height: 50,
                allowOverlap: true,
                anchor: .left,
                offsetX: -20
            )
            try? uiViewController.mapView.viewAnnotations.add(customView, options: propertyAnnotationOptions)
        }
        
        var i = 0
        for detector in SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors {
            if let coordinate = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].coordinate {
//                let irHot = detector .irHot
                print("SENS UPDATE MAKE \(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].id) \(coordinate)")
                @State var irHot = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].irHot
                var leftFlag = false
                for j in 0..<irHot.count {
                    let startAngle = Angle(degrees: irHot[j][0])
                    let endAngle = Angle(degrees: irHot[j][1])
                    if (startAngle.degrees > 0 && startAngle.degrees < 180) {
                        leftFlag = true
                        break
                    }
                }
                                
                var imageIcon = "DetectorIcons/\(max(detector.sensorIdx ?? 0, 1))"
                var beamColor = CustomColors.TorchRed
                var showText = false
                if detector.threat == Threat.Red {
                    imageIcon = "DetectorIcons/ThreatRed"
                    beamColor = CustomColors.TorchRed
                    showText = true
                } else if detector.threat == Threat.Yellow {
                    imageIcon = "DetectorIcons/ThreatYellow"
                    beamColor = CustomColors.WarningYellow
                    showText = true
                }
                
                // Use right
                if (leftFlag) {
                    print("custom annot: leftcustom")
                    let customAnnotationView = UIHostingController(rootView: LeftCustomAnnotationView(text: "\(max(detector.sensorIdx ?? 0, 1))", beams: $irHot, imageIcon: imageIcon, beamColor: beamColor, showText: showText, detectorIdx: i, annotationsStatus: $annotationsStatus))
//                    customAnnotationView.view.frame = CGRect(x: 0, y: 0, width: 90, height: 17)
                    customAnnotationView.view.backgroundColor = .clear
                    customAnnotationView.view.sizeToFit()

                    let options = ViewAnnotationOptions(
                        geometry: Point(coordinate),
                        width: customAnnotationView.view.bounds.width,
                        height: customAnnotationView.view.bounds.height,
                        associatedFeatureId: nil,
                        allowOverlap: true,
                        visible: true,
                        anchor: .right,
                        offsetX: 20
                    )

                    // Add the view annotation to the MapView's view annotation manager
                    do {
                        try uiViewController.mapView.viewAnnotations.add(customAnnotationView.view, options: options)
                    } catch {
                        print("Failed to add the custom view annotation: \(error)")
                    }
                } else {
                    
                    print("custom annot: rightcustom")
                    let customAnnotationView = UIHostingController(rootView: RightCustomAnnotationView(text: "\(max(detector.sensorIdx ?? 0, 1))", beams: $irHot, showText: showText, detectorIdx: i, annotationsStatus: $annotationsStatus))
//                    customAnnotationView.view.frame = CGRect(x: 0, y: 0, width: 50, height: 17)
                    customAnnotationView.view.backgroundColor = .clear
                    customAnnotationView.view.sizeToFit()

                    let options = ViewAnnotationOptions(
                        geometry: Point(coordinate),
                        width: customAnnotationView.view.bounds.width,
                        height: customAnnotationView.view.bounds.height,
                        associatedFeatureId: nil,
                        allowOverlap: true,
                        visible: true,
                        anchor: .left,
                        offsetX: -20
                    )

                    // Add the view annotation to the MapView's view annotation manager
                    do {
                        try uiViewController.mapView.viewAnnotations.add(customAnnotationView.view, options: options)
                    } catch {
                        print("Failed to add the custom view annotation: \(error)")
                    }
                }
            }
            
            i += 1
        }
    }
    
    func updateAnnotations(uiViewController: MapboxViewController) {
        print("CHECKING ZOOM \(uiViewController.mapView.cameraState.zoom)")
        
        if (SessionManager.shared.selectedPropertyIndex >= 0 && SessionManager.shared.selectedPropertyIndex < SessionManager.shared.properties.count) {
            if uiViewController.mapView.cameraState.zoom < ICON_SMALL_ZOOM_THRESHOLD && isHighZoom {
                isHighZoom = false
                uiViewController.mapView.viewAnnotations.removeAll()
                uiViewController.annotationManager.annotations = []
                print("CHECKING ZOOM ADDING LOW ZOOM")
                uiViewController.mapView.location.options.puckType = nil
                var i = 0
                for detector in SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors {
                    guard let coord = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].coordinate else {
                        continue
                    }
                    print("SENS UPDATE UPPDATE \(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].id) \(coord)")
                    
                    var pointAnnotation = PointAnnotation(id: detector.id, coordinate: coord)
                    var annotationIcon = "DetectorIcons/ThreatGreenSmall"
                    if detector.threat == Threat.Red {
                        annotationIcon = "DetectorIcons/ThreatRedSmall"
                    } else if detector.threat == Threat.Yellow {
                        annotationIcon = "DetectorIcons/ThreatYellowSmall"
                    }

                    if let annotationImage = UIImage(named: annotationIcon) {
                        pointAnnotation.image = .init(image: annotationImage, name: annotationIcon)
                    }
                    pointAnnotation.iconAnchor = .center
                    pointAnnotation.iconSize = 0.25
                                        
                    uiViewController.annotationManager.annotations.append(pointAnnotation)
                    
                    i += 1
                }
                print("CHECKING ZOOM ADDING LOW ZOOM END: \(uiViewController.annotationManager.annotations)")
            } else if (uiViewController.mapView.cameraState.zoom >= ICON_SMALL_ZOOM_THRESHOLD && !isHighZoom) {
                isHighZoom = true
                uiViewController.mapView.viewAnnotations.removeAll()
                uiViewController.annotationManager.annotations = []
                print("CHECKING ZOOM ADDING HIGH ZOOM")
                uiViewController.mapView.location.options.puckType = .puck2D(Puck2DConfiguration.makeDefault(showBearing: true))
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
                if let coordinate = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].coordinate {
                    let propertyAnnotationOptions = ViewAnnotationOptions(
                        geometry: Point(coordinate),
                        width: customView.frame.width,
                        height: 50,
                        allowOverlap: true,
                        anchor: .left,
                        offsetX: -20
                    )
                    try? uiViewController.mapView.viewAnnotations.add(customView, options: propertyAnnotationOptions)
                }
                
                var i = 0
                for detector in SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors {
                    if let coordinate = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].coordinate {
//                        let irHot = detector.irHot
                        print("SENS UPDATE UPPDATE \(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].id) \(coordinate)")
                        @State var irHot = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[i].irHot
                        var leftFlag = false
                        for j in 0..<irHot.count {
                            let startAngle = Angle(degrees: irHot[j][0])
                            let endAngle = Angle(degrees: irHot[j][1])
                            if (startAngle.degrees > 0 && startAngle.degrees < 180) {
                                leftFlag = true
                                break
                            }
                        }
                                        
                        var imageIcon = "DetectorIcons/\(max(detector.sensorIdx ?? 0, 1))"
                        var beamColor = CustomColors.TorchRed
                        var showText = false
                        if detector.threat == Threat.Red {
                            imageIcon = "DetectorIcons/ThreatRed"
                            beamColor = CustomColors.TorchRed
                            showText = true
                        } else if detector.threat == Threat.Yellow {
                            imageIcon = "DetectorIcons/ThreatYellow"
                            beamColor = CustomColors.WarningYellow
                            showText = true
                        }
                        
                        // Use right
                        if (leftFlag) {
                            print("custom annot: leftcustom")
                            let customAnnotationView = UIHostingController(rootView: LeftCustomAnnotationView(text: "\(max(detector.sensorIdx ?? 0, 1))", beams: $irHot, imageIcon: imageIcon, beamColor: beamColor, showText: showText, detectorIdx: i, annotationsStatus: $annotationsStatus))
//                            customAnnotationView.view.frame = CGRect(x: 0, y: 0, width: 90, height: 17)
                            customAnnotationView.view.backgroundColor = .clear
                            customAnnotationView.view.sizeToFit()

                            let options = ViewAnnotationOptions(
                                geometry: Point(coordinate),
                                width: customAnnotationView.view.bounds.width,
                                height: customAnnotationView.view.bounds.height,
                                associatedFeatureId: nil,
                                allowOverlap: true,
                                visible: true,
                                anchor: .right,
                                offsetX: -20
                            )

                            // Add the view annotation to the MapView's view annotation manager
                            do {
                                try uiViewController.mapView.viewAnnotations.add(customAnnotationView.view, options: options)
                            } catch {
                                print("Failed to add the custom view annotation: \(error)")
                            }
                        } else {
                            
                            print("custom annot: rightcustom")
                            let customAnnotationView = UIHostingController(rootView: RightCustomAnnotationView(text: "\(max(detector.sensorIdx ?? 0, 1))", beams: $irHot, showText: showText, detectorIdx: i, annotationsStatus: $annotationsStatus))
//                            customAnnotationView.view.frame = CGRect(x: 0, y: 0, width: 50, height: 17)
                            customAnnotationView.view.backgroundColor = .clear
                            customAnnotationView.view.sizeToFit()

                            let options = ViewAnnotationOptions(
                                geometry: Point(coordinate),
                                width: customAnnotationView.view.bounds.width,
                                height: customAnnotationView.view.bounds.height,
                                associatedFeatureId: nil,
                                allowOverlap: true,
                                visible: true,
                                anchor: .left,
                                offsetX: -20
                            )

                            // Add the view annotation to the MapView's view annotation manager
                            do {
                                try uiViewController.mapView.viewAnnotations.add(customAnnotationView.view, options: options)
                            } catch {
                                print("Failed to add the custom view annotation: \(error)")
                            }
                        }
                    }
                    i += 1
                }
            } else {
                print("XXAA no change")
            }
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
