//
//  MapboxPlaceSensorViewController.swift
//  TorchUI
//
//  Created by Parth Saxena on 9/20/23.
//

import Foundation
import MapboxMaps
import SwiftUI

class MapboxPlaceSensorViewController: UIViewController {
    //    @ObservedObject var sessionManager = SessionManager.shared
    let jsonString = Strings.jsonString
    
    var pinImageView: UIImageView!
    var mapView: MapView!
    var selectedProperty: Property!
    var selectedDetector: Detector!
    var annotationManager: PointAnnotationManager!
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(mapView)
        self.pinImageView.frame = CGRectMake(self.view.center.x - 30, self.view.center.y - 193, 60, 69)
        self.view.addSubview(pinImageView)
    }
}

