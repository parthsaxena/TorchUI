//
//  LocationManager.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 08/12/2023.
//

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static var shared = LocationManager()
    var locationManager: CLLocationManager!
    var currentLocation: CLLocationCoordinate2D?
    
    func loadLocationManager() {
        
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location: CLLocation = locations.first {
            self.currentLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            locationManager.stopUpdatingLocation()
        }
    }
}
