//
//  MapView.swift
//  TorchUI
//
//  Created by Parth Saxena on 6/28/23.
//

import SwiftUI
import CoreLocation
import GoogleMaps
import CodeScanner
import MapboxMaps

struct MainMapView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    @ObservedObject var sessionManager = SessionManager.shared
    
    // Google maps tutorial START
    static var detectors: [Detector] = []
    @State var annotations: [PointAnnotation] = [PointAnnotation]()
    
    @State var hideOverlay: Bool = false
    @State var showDetectorDetails: Bool = false
    @State var zoomInCenter: Bool = false
    @State var selectedDetector: Detector?
    @State var selectedDetectorIndex: Int = -1
    @State var newDetector: Detector?
    @State var newDetectorIndex: Int = 0
    //    @State var selectedDetector: Detector? = SessionManager.shared.properties[0].detectors[0]
    @State var selectedMarker: GMSMarker?
    
    @State var mapOffset: CGSize = CGSize()
    @State var propertyOverlaySize: CGSize = CGSize()
    @State var detectorOverlaySize: CGSize = CGSize()
    
    @State private var dragOffset = CGSize.zero
    @State var shouldShowRedOverlay = false
    @State var showRedOverlay: Bool = false
    @State private var isCopied: Bool = false
    
    @State var zoomLevel: CGFloat = 17
    
    @State var isAddingSensor: Bool = false
    @State var isPresentingScanner: Bool = false
    @State var shouldHideOnPositionSelection: Bool = false
    @State var isConfirmingLocation: Bool = false
    
    @State var pin: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    @State var needsLocationPin: Bool = false
    
    @State var sensorTapped: Bool = false
    
    @State var zoomChanged: Bool = false
    
    @State var moveToUserTapped: Bool = false
    @State var mapLayerTapped: Bool = false
    
    @State var showingDeletePropertyOptions: Bool = false
    @State var showingDeleteDetectorOptions: Bool = false
    
    @State private var shouldShowMenu: Bool = false
    @State var annotationsStatus: DetectorInfoStatus = .fire
    
    @State var isNickName: Bool = false
    @State var name: String = ""
    @State var isOnSatellite = false
    @State var didChangeSensorPosition = false
    //    @State var mapLayerTapped = false
    @State var viewAnalytics: Bool = false
    
    //    @State private var shouldShowMenu: Bool = false
    //    @State var annotationsStatus: DetectorInfoStatus = .fire
    
    var combinedBinding: Binding<Bool> {
        Binding(
            get: {
                //  let x = print("BIND:\(self.showingDeletePropertyOptions || self.showingDeleteDetectorOptions)");
                return self.showingDeletePropertyOptions || self.showingDeleteDetectorOptions },
            set: { newValue in
                // Decide how you want to handle the set. For this example, I'll set both states.
                self.showingDeletePropertyOptions = newValue
                self.showingDeleteDetectorOptions = newValue
            }
        )
    }
    
    // Google maps tutorial END
    
    init() {
        //        print("MARKERS: \(markers)")
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack(alignment: .top) {
                    MapboxMapViewWrapper(showDetectorDetails: $showDetectorDetails, zoomLevel: $zoomLevel, selectedDetectorIndex: $selectedDetectorIndex, annotations: $annotations, pin: self.$pin, needsLocationPin: $needsLocationPin, sensorTapped: $sensorTapped, moveToUserTapped: $moveToUserTapped, mapLayerTapped: $mapLayerTapped, zoomChanged: $zoomChanged, mapOffset: $mapOffset.height, dragOffset: $dragOffset, didChangeSensorPosition: $didChangeSensorPosition, isOnSatellite: $isOnSatellite, annotationsStatus: $annotationsStatus)
                        .ignoresSafeArea()
                    //                        .animation(.easeIn)
                    
                    let DETECTOR_MIN_OFFSET = 50.0
                    let PROPERTY_MIN_OFFSET = 75.0
                    let THRESHOLD = 150.0
                    let ANIMATION_DURATION = 0.20
                    let slideTransition: AnyTransition = AnyTransition.move(edge: .bottom)
                    // Heading saying Set up torch sensors
                    HStack {
                        Spacer()
                        if newDetector?.coordinate == nil  {
                            if SessionManager.shared.properties.count > 0 {
                                let headerName = newDetector != nil ? "Sensor \(newDetector?.deviceName ?? "")" : SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName
                                Text(String(headerName))
                                    .font(Font.custom("Manrope-SemiBold", fixedSize: 20))
                                    .foregroundColor(CustomColors.TorchGreen)
                                    .padding(.top, 25)
                            }
                        } else {
                            let headerName = "Change position"
                            Text(String(headerName))
                                .font(Font.custom("Manrope-SemiBold", fixedSize: 20))
                                .foregroundColor(CustomColors.TorchGreen)
                                .padding(.top, 25)
                        }
                        Spacer()
                    }
                    if !isConfirmingLocation {
                        //                    VStack {
                        //                        Rectangle()
                        //                            .fill(
                        //                                RadialGradient(colors: [Color.clear, CustomColors.TorchRed], center: .center, startRadius: width - 200, endRadius: width + 50)
                        //                            )
                        //                            .frame(width: width, height: height - detectorOverlaySize.height)
                        //                            .padding(.bottom, -40)
                        //                            .ignoresSafeArea()
                        DetectorDetailOverlayView(size: $detectorOverlaySize, mapOffset: $mapOffset, sessionManager: sessionManager, showingDeleteDetectorOptions: $showingDeleteDetectorOptions, showDetectorDetails: $showDetectorDetails, dragOffset: $dragOffset, shouldShowRedOverlay: $shouldShowRedOverlay, showRedOverlay: $showRedOverlay, needsLocationPin: $needsLocationPin, shouldHideOnPositionSelection: $shouldHideOnPositionSelection, newDetector: $newDetector, didChangeSensorPosition: $didChangeSensorPosition, viewAnalytics: $viewAnalytics)
                        //                    DetectorDetailOverlayVie/*w(size: $detectorOverlaySize, mapOffset: $mapOffset, sessionManager: sessionManager, showingDeleteDetectorOptions: $showingDeleteDetectorOptions, showDetectorDetails: $showDetectorDetails, dragOffset: $dragOffset, shouldShowRedOverlay: $shouldShowRedOverlay, showRedOverlay: $showRedOverlay, didChangeSensorPosition: $didChangeSensorPosition)*/
                            .onAppear(perform: {
                                withAnimation(.easeIn(duration: 2.0)) {
                                    shouldShowRedOverlay = true
                                }
                            })
                            .offset(x: 0, y: (!showDetectorDetails) ? UIScreen.main.bounds.height : self.dragOffset.height)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        if showDetectorDetails {
                                            print("Gesture: \(gesture.translation), size: \(self.detectorOverlaySize)")
                                            if gesture.translation.height < 0 && self.dragOffset.height > 0 {
                                                print("Dragging up")
                                                self.dragOffset = .zero // gesture.translation // (self.detectorOverlaySize.height - DETECTOR_MIN_OFFSET) - fabs(gesture.translation.height)
                                                self.mapOffset.height = DETECTOR_MIN_OFFSET + fabs(gesture.translation.height)
                                            } else if gesture.translation.height > 0 && gesture.translation.height <= self.detectorOverlaySize.height {
                                                print("Dragging down")
                                                self.dragOffset = gesture.translation
                                                self.mapOffset.height = (self.detectorOverlaySize.height - gesture.translation.height)
                                            }
                                            shouldShowRedOverlay = false
                                        }
                                    }
                                    .onEnded { _ in
                                        if showDetectorDetails {
                                            if self.dragOffset.height + THRESHOLD > self.detectorOverlaySize.height {
                                                print("Threshold")//
                                                withAnimation(.easeIn(duration: ANIMATION_DURATION)) {
                                                    self.dragOffset.height = self.detectorOverlaySize.height - DETECTOR_MIN_OFFSET
                                                    self.mapOffset.height = DETECTOR_MIN_OFFSET
                                                    
                                                }
                                                
                                            } else {
                                                print("Threshold1")
                                                withAnimation(.easeIn(duration: ANIMATION_DURATION)) {
                                                    self.dragOffset = .zero
                                                    self.mapOffset.height = (self.detectorOverlaySize.height)
                                                    shouldShowRedOverlay = true
                                                }
                                            }
                                        }
                                    }
                            )
                            .transition(slideTransition)
                            .confirmationDialog("Select a color", isPresented: combinedBinding, titleVisibility: .hidden) {
                                Button(showingDeletePropertyOptions ? "Delete property" : "Delete detector", role: .destructive) {
                                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                    impactMed.impactOccurred()
                                    if (showingDeletePropertyOptions) {
                                        SessionManager.shared.deleteProperty()
                                        withAnimation {
                                            SessionManager.shared.appState = .properties
                                        }
                                    } else if (showingDeleteDetectorOptions) {
                                        withAnimation(.easeIn(duration: 0.1)) {
                                            self.dragOffset = .zero
                                        }
                                        DispatchQueue.main.async {
                                            print("comp0: \(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count)")
                                            showDetectorDetails.toggle(); dragOffset = .zero
                                            if (SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count <= 1) {
                                                //                                            withAnimation {
                                                print("Setting app state \(SessionManager.shared.appState)")
                                                //                                                SessionManager.shared.appState = .properties
                                                print("Finished app state \(SessionManager.shared.appState)")
                                                //                                            }
                                            }
                                            print("comp1: \(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors.count), \(self.annotations)")
                                            selectedDetector = nil
                                            SessionManager.shared.deleteDetector()
                                            
                                            DispatchQueue.main.async {
                                                for (i, annotation) in self.annotations.enumerated() {
                                                    print("i, ann: \(i) \(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id) \(annotation)")
                                                    if annotation.id == SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id {
                                                        self.annotations.remove(at: i)
                                                        print("removed, \(self.annotations)")
                                                        break
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    combinedBinding.wrappedValue = false
                                    dismiss()
                                }
                                Button("Edit location") {
                                    SessionManager.shared.appState = .updateProperty
                                }
                            }
                        //                    }
                        if let selectedProperty = sessionManager.selectedProperty {
                            PropertyDetailOverlayView(isPresentingScanner: $isPresentingScanner, zoomLevel: $zoomLevel, property: selectedProperty, mapOffset: $mapOffset, size: $propertyOverlaySize, sessionManager: sessionManager, selectedDetectorIndex: $selectedDetectorIndex, showDetectorDetails: $showDetectorDetails,selectedDetector: $selectedDetector, selectedMarker: $selectedMarker, detectors: MainMapView.detectors, annotations: $annotations, newDetector: $newDetector, isConfirmingLocation: $isNickName, pin: self.$pin, sensorTapped: $sensorTapped, showingOptions: $showingDeletePropertyOptions, dragOffset: $dragOffset, showRedOverlay: $showRedOverlay, shouldHideOnPositionSelection: $shouldHideOnPositionSelection, didChangeSensorPosition: self.$didChangeSensorPosition, needsLocationPin: $needsLocationPin)
                                .offset(x: 0, y: showDetectorDetails ? UIScreen.main.bounds.height : self.dragOffset.height)
                                .gesture(
                                    DragGesture()
                                        .onChanged { gesture in
                                            if !showDetectorDetails {
                                                //                                                print("Dragging: \(gesture.translation), \(self.propertyOverlaySize)")
                                                if gesture.translation.height < 0 && self.dragOffset.height > 0 {
                                                    print("Dragging up")
                                                    
                                                    self.dragOffset = .zero// gesture.translation //(self.propertyOverlaySize.height - PROPERTY_MIN_OFFSET) - fabs(gesture.translation.height)
                                                    self.mapOffset.height = PROPERTY_MIN_OFFSET + fabs(gesture.translation.height)
                                                } else if gesture.translation.height > 0 && gesture.translation.height <= self.propertyOverlaySize.height {
                                                    print("Dragging down")
                                                    self.dragOffset = gesture.translation
                                                    self.mapOffset.height = (self.propertyOverlaySize.height )
                                                }
                                            }
                                        }
                                        .onEnded { _ in
                                            if !showDetectorDetails {
                                                if self.dragOffset.height + THRESHOLD > self.propertyOverlaySize.height {
                                                    print("Threshold")//
                                                    withAnimation(.easeIn(duration: ANIMATION_DURATION)) {
                                                        self.dragOffset.height = self.propertyOverlaySize.height - PROPERTY_MIN_OFFSET
                                                        self.mapOffset.height = PROPERTY_MIN_OFFSET
                                                    }
                                                    
                                                } else {
                                                    print("Threshold1")
                                                    withAnimation(.easeIn(duration: ANIMATION_DURATION)) {
                                                        self.dragOffset = .zero
                                                        self.mapOffset.height = (self.propertyOverlaySize.height)
                                                    }
                                                }
                                            }
                                        }
                                )
                                .transition(slideTransition)
                                .sheet(isPresented: $isPresentingScanner) {
                                    VStack {
                                        HStack {
                                            Spacer()
                                            Text("Scan the QR code on your Torch device")
                                                .font(Font.custom("Manrope-Medium", fixedSize: 20))
                                                .foregroundColor(CustomColors.TorchGreen)
                                                .padding(.top, 20)
                                            Spacer()
                                        }
                                        
                                        CodeScannerView(codeTypes: [.qr], showViewfinder: true) { response in
                                            if case let .success(result) = response {
                                                
                                                let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                                                impactMed.impactOccurred()
                                                isPresentingScanner = false
                                                shouldHideOnPositionSelection = true
                                                let index = SessionManager.shared.selectedPropertyIndex
                                                let properties = SessionManager.shared.properties
                                                let isAlreadyAdded = properties[index].detectors.contains(where: { $0.id == result.string })
                                                if isAlreadyAdded {
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                        shouldHideOnPositionSelection = false
                                                        showingAlert = true
                                                    }
                                                    return
                                                }
                                                // create detector model
                                                var detector = Detector(id: result.string, deviceName: String((SessionManager.shared.properties[index].detectors.count) + 1), deviceBattery: 0.0, coordinate: nil, selected: true, sensorIdx: SessionManager.shared.properties[index].detectors.count + 1)
                                                detector.isNewlyInstalled = true
                                                self.newDetector = detector
                                                self.newDetectorIndex = SessionManager.shared.properties[index].detectors.count
                                                needsLocationPin = true
                                                // manually appending since selected==False already for all other detectors
                                                SessionManager.shared.properties[index].detectors.append(detector)
                                                SessionManager.shared.selectedDetectorIndex = SessionManager.shared.properties[index].detectors.count - 1
                                                sessionManager.selectedProperty?.detectors.append(detector)
                                            }
                                        }
                                        .ignoresSafeArea(.container)
                                    }
                                }
                                .confirmationDialog("Select a color", isPresented: combinedBinding, titleVisibility: .hidden) {
                                    Button(showingDeletePropertyOptions ? "Delete property" : "Delete sensor", role: .destructive) {
                                        
                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                        impactMed.impactOccurred()
                                        if (showingDeletePropertyOptions) {
                                            withAnimation {
                                                SessionManager.shared.appState = .properties
                                            }
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                SessionManager.shared.deleteProperty()
                                            }
                                        } else if (showingDeleteDetectorOptions) {
                                            DispatchQueue.main.async {
                                                for (i, annotation) in self.annotations.enumerated() {
                                                    if annotation.id == SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id {
                                                        self.annotations.remove(at: i)
                                                        print("removed, \(self.annotations)")
                                                        break
                                                    }
                                                }
                                            }
                                            
                                            SessionManager.shared.deleteDetector()
                                            
                                            withAnimation(.easeIn(duration: 0.1)) {
                                                self.dragOffset = .zero
                                            }
                                            showDetectorDetails.toggle(); dragOffset = .zero
                                            selectedDetector = nil
                                        }
                                        combinedBinding.wrappedValue = false
                                        dismiss()
                                    }
                                    Button("Edit location") {
                                        SessionManager.shared.appState = .updateProperty
                                    }
                                }
                        }
                    }
                    
                    // Overlay
                    if showDetectorDetails && !hideOverlay {
                        HStack {
                            BackButton(selectedDetector: $selectedDetector, showDetectorDetails: $showDetectorDetails, dragOffset: $dragOffset, showRedOverlay: $showRedOverlay)
                                .padding(.leading, 10)
                                .padding(.top, 10)
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            VStack {
                                if let detector = selectedDetector {
                                    //                                if let detectorId = detector.sensorIdx {
                                    //                                    Text("Sensor\(detectorId)")
                                    //                                        .font(
                                    //                                            Font.custom("Manrope", size: 20)
                                    //                                                .weight(.semibold)
                                    //                                        )
                                    //                                        .foregroundColor(CustomColors.TorchGreen)
                                    //                                }
                                    if let coordinates = detector.coordinate {
                                        HStack(alignment: .top, spacing: 8) {
                                            let lat = coordinates.latitude
                                            let long = coordinates.longitude
                                            Text("\(lat), \(long)")
                                                .font(
                                                    Font.custom("Manrope", size: 14)
                                                        .weight(.semibold)
                                                )
                                                .foregroundColor(CustomColors.TorchGreen)
                                                .onTapGesture(count: 1) {
                                                    UIPasteboard.general.setValue("\(lat), \(long)",
                                                                                  forPasteboardType: "public.plain-text")
                                                    isCopied = true
                                                    DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1) {
                                                        if isCopied {
                                                            isCopied = false
                                                        }
                                                    }
                                                }
                                            
                                            //                                        Button(action: {
                                            //                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                            //                                            impactMed.impactOccurred()
                                            //
                                            //                                        }) {Image("share-07")
                                            //                                                .frame(width: 20, height: 20)
                                            //                                        }
                                            
                                            ShareLink(item: "\(lat), \(long)") {
                                                Image("share-07")
                                                    .frame(width: 20, height: 20)
                                            }
                                            
                                            
                                        }
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .background(.white)
                                        .cornerRadius(12)
                                        .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.03), radius: 4, x: 0, y: 8)
                                        .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.08), radius: 12, x: 0, y: 20)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 12)
                                                .inset(by: 0.25)
                                                .stroke(.white, lineWidth: 0.5)
                                        )
                                    }
                                }
                            }
                            .padding(.top, 22)
                            Spacer()
                        }
                        // Right side buttons: Hamburger, ZoomIn, ZoomOut, Layers, CurrentLocation
                        //                    HStack {
                        //                        Spacer()
                        //                        VStack(spacing: 1) {
                        //                            HamburgerButton(hideOverlay: $hideOverlay)
                        //
                        //                            Spacer()
                        ////                                .frame(height: 150)
                        //                        }
                        //                        .padding(.trailing, 10)
                        //                        .padding(.top, 10)
                        //                    }
                        VStack {
                            HStack {
                                Spacer()
                                VStack(spacing: 0) {
                                    HamburgerButton(hideOverlay: $hideOverlay) {
                                        self.shouldShowMenu = true
                                    }
                                    
                                    Spacer()
                                    
                                    ZoomInButton(zoomLevel: $zoomLevel, zoomChanged: $zoomChanged)
                                    ZoomOutButton(zoomLevel: $zoomLevel, zoomChanged: $zoomChanged)
                                    
                                    Spacer()
                                    
                                    MapLayerButton(mapLayerTapped: $mapLayerTapped)
                                    LocationButton(moveToUserTapped: $moveToUserTapped)
                                }
                                .padding(.trailing, 10)
                                .padding(.top, 10)
                            }
                            Spacer()
                            Spacer()
                                .frame(height: self.detectorOverlaySize.height + 10)
                        }
                        
                    }  else if isConfirmingLocation {
                        let x = print("isConfirmingLocation")
                        AddDetectorConfirmLocationOverlayView(size: $detectorOverlaySize, annotations: $annotations, pin: $pin, newDetector: $newDetector, isConfirmingLocation: $isConfirmingLocation, needsLocationPin: $needsLocationPin, newDetectorIndex: self.$newDetectorIndex, isNickName: $isNickName)
                    } else if !hideOverlay {
                        
                        //
                        HStack {
                            PropertiesBackButton()
                                .padding(.leading, 10)
                                .padding(.top, 10)
                            Spacer()
                        }
                        
                        // Right side buttons: Hamburger, ZoomIn, ZoomOut, Layers, CurrentLocation
                        HStack {
                            Spacer()
                            VStack(spacing: 1) {
                                HamburgerButton(hideOverlay: $hideOverlay) {
                                    self.shouldShowMenu = true
                                }
                                
                                Spacer()
                                    .frame(height: 150)
                                
                                ZoomInButton(zoomLevel: $zoomLevel, zoomChanged: $zoomChanged)
                                ZoomOutButton(zoomLevel: $zoomLevel, zoomChanged: $zoomChanged)
                                //                                LocationButton()
                            }
                            .padding(.trailing, 10)
                            .padding(.top, 10)
                        }
                        
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                            }
                            .padding(.trailing, 10)
                            HStack {
                                Spacer()
                                MapLayerButton(mapLayerTapped: $mapLayerTapped)
                            }
                            .padding(.trailing, 10)
                            HStack {
                                Spacer()
                                LocationButton(moveToUserTapped: $moveToUserTapped)
                            }
                            .padding(.trailing, 10)
                            .padding(.bottom, 50)
                            Spacer()
                                .frame(height: self.propertyOverlaySize.height + 10)
                        }
                    }
                    if isCopied {
                        VStack {
                            Spacer()
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Copied to clipboard")
                                    .font(
                                        Font.custom("Manrope", size: 14)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            //                    .frame(maxWidth: .infinity, alignment: .topLeading)
                            .background(Color(red: 0.09, green: 0.11, blue: 0.11))
                            .cornerRadius(12)
                            Spacer()
                        }
                        .frame(width: width)
                        .background(.black.opacity(0.4))
                    }
                    
                    if isNickName {
                        let x = print("showing isNickname")
                        NickNameUIView(name: $name, isNickName: $isNickName, newDetector: $newDetector)
                    }
                    
                    if shouldShowMenu {
                        DetectorStatusMenu(sessionManager: SessionManager(), showDetectorMenu: $shouldShowMenu, annotationsStatus: $annotationsStatus)
                    }
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
                .navigationBarItems(
                    trailing: NavigationLink(destination: AnalyticsSwiftUIView(viewAnalytics: $viewAnalytics), isActive: $viewAnalytics) {
                    })
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Error!"),
                message: Text("This sensor has already been installed at this property"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
