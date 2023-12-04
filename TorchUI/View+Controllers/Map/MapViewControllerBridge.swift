//
//  MapViewControllerBridge.swift
//  TorchUI
//
//  Created by Parth Saxena on 7/6/23.
//

import Foundation
import GoogleMaps
import GoogleMapsUtils
import SwiftUI

struct MapViewControllerBridge: UIViewControllerRepresentable {
    
    var markers: [GMSMarker]
    @Binding var zoomLevel: Float
    @Binding var isConfirmingLocation: Bool
    @Binding var mapBottomOffset: CGFloat
    @Binding var selectedMarker: GMSMarker?
    @Binding var selectedDetector: Detector?
    @Binding var showDetectorDetails: Bool
    var detectors: [Detector]
    var property: Property
    var onAnimationEnded: () -> ()
    var mapViewWillMove: (Bool) -> ()
    var mapViewDidChange: (GMSCameraPosition) -> ()
    
    var clusterManager: GMUClusterManager!    
    
    func makeUIViewController(context: Context) -> MapViewController {
        
        let uiViewController = MapViewController()
        uiViewController.map = GMSMapView(frame: .zero, camera: GMSCameraPosition(
            latitude: self.property.coordinate?.latitude ?? 0.0,
            longitude: self.property.coordinate?.longitude ?? 0.0,
            zoom: 20
        ))
        uiViewController.map.delegate = context.coordinator
        uiViewController.markers = markers
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            uiViewController.map.animate(toZoom: zoomLevel)
        }
        return uiViewController
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        
        markers.forEach { $0.map = uiViewController.map }
        selectedMarker?.map = uiViewController.map
        animateToSelectedMarker(viewController: uiViewController)
        uiViewController.map.isUserInteractionEnabled = !isConfirmingLocation
        uiViewController.map.padding = UIEdgeInsets(top: 0, left: 0, bottom: mapBottomOffset, right: 0)
        uiViewController.map.animate(toZoom: zoomLevel)
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(self)
    }
    
    private func animateToSelectedMarker(viewController: MapViewController) {

        guard let selectedMarker = selectedMarker else {
            return
        }
        
        let map = viewController.map
        if map.selectedMarker != selectedMarker {
            map.selectedMarker = selectedMarker
            DispatchQueue.main.async {
                map.animate(with: GMSCameraUpdate.setTarget(selectedMarker.position))
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        onAnimationEnded()
                    })
                })
            }
        }
    }
    
    func selectDetector(marker: GMSMarker) {

        let impactMed = UIImpactFeedbackGenerator(style: .medium)
        impactMed.impactOccurred()
        
        guard let id = marker.userData as? String else {
            return
        }

        selectedMarker = marker
        selectedDetector = SessionManager.shared.selectedProperty?.detectors.first(where: { detector in
            detector.id == id
        })
        showDetectorDetails = true
    }
    
    final class MapViewCoordinator: NSObject, GMSMapViewDelegate {
        var mapViewControllerBridge: MapViewControllerBridge
        
        init(_ mapViewControllerBridge: MapViewControllerBridge) {
            self.mapViewControllerBridge = mapViewControllerBridge
        }
        
        func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
            self.mapViewControllerBridge.mapViewWillMove(gesture)
        }
        
        func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
            self.mapViewControllerBridge.mapViewDidChange(position)
        }
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            mapViewControllerBridge.selectDetector(marker: marker)
            return true
        }
        
    }
}
