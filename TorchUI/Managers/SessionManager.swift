//
//  SessionManager.swift
//  TorchUI
//
//  Created by Parth Saxena on 7/6/23.
//

import Foundation
import CoreLocation
import LineChartView
import Amplify
import UIKit

final class SessionManager: ObservableObject {
    
    static var shared = SessionManager()
    private let RED_THRESHOLD = 80
    private let YELLOW_THRESHOLD = 60
    @Published var propertyUpdated = false
    
    @Published var latestTimestampDict: [String : Date] = [:]
    @Published var properties: [Property] = []
    @Published var selectedProperty: Property?
    @Published var selectedPropertyIndex = 0
    @Published var selectedDetectorIndex = 0
    
    @Published var newProperty: Property?
    //    @Published var deviceAnalytics: [String : [String: [[String: String]]]] = [:]
    @Published var deviceAnalytics: [String : [String: [String: [AnalyticDatapoint]]]] = [:]
    
    @Published var lastAppState: AppState? = nil
    @Published var appState: AppState = .properties
    
    @Published var alerts: [AlertModel] = []
    
    @Published var propertiesLoaded: Bool = false
    @Published var firstTransition: Bool = true
    @Published var showSplashScreen = true
    @Published var firstTimeLoaded: Bool = false
    
    @Published var unparsedProperties = 0
    
    @Published var deletedDetectors: Set<String> = []
    @Published var deletedProperties: Set<String> = []
    
    @Published var loadingProperties = [
        Property(id: "0", propertyName: "House in Napa", propertyAddress: "2237 Kamp Court", propertyImage: ""),
        Property(id: "1", propertyName: "House in Napa", propertyAddress: "2237 Kamp Court", propertyImage: ""),
        Property(id: "2", propertyName: "House in Napa", propertyAddress: "2237 Kamp Court", propertyImage: ""),
        Property(id: "3", propertyName: "House in Napa", propertyAddress: "2237 Kamp Court", propertyImage: "")
    ]
    
    init() {
        //        dummyUserSetup()
    }
    
    func clearData() {
        print("setting properties empty cd")
        self.propertiesLoaded = false
        self.appState = .properties
        self.properties = []
        self.selectedProperty = nil
        self.newProperty = nil
    }
    
    func clearProperties() {
        print("setting properties empty cp")
        self.propertiesLoaded = false
        self.properties = []
        self.alerts = []
    }
    
    func dummyUserSetup() {
        let property = Property(id: "0", propertyName: "House in Napa", propertyAddress: "2237 Kamp Court", propertyImage: "Property", detectors: [
            Detector(id: "1", deviceName: "Backyard", deviceBattery: 13.0, measurements: ["fire_rating" : "93","temperature" : "47"], coordinate: CLLocationCoordinate2D(latitude: 37.656434, longitude: -121.972), threat: .Red, spectralStatus: .Yellow, thermalStatus: .Red, smokeStatus: .Green, connected: true, lastTimestamp: Date()),
            //            Detector(id: "1", deviceName: "Backyard", deviceBattery: 13.0,
            //                     measurements: ["fire_rating" : "93"],
            //                     coordinate: CLLocationCoordinate2D(latitude: 37.656434, longitude: -121.972), spectralStatus: .Red, thermalStatus: .Yellow, smokeStatus: .Green),
            Detector(id: "2", deviceName: "Frontyard", deviceBattery: 91.0,
                     measurements: ["fire_rating" : "81"],
                     coordinate: CLLocationCoordinate2D(latitude: 37.655521, longitude: -121.962646), threat: Threat.Red),
            Detector(id: "3", deviceName: "Frontyard", deviceBattery: 74.0,
                     measurements: ["fire_rating" : "77"],
                     coordinate: CLLocationCoordinate2D(latitude: 37.646415, longitude: -121.963075), threat: Threat.Yellow),
            Detector(id: "4", deviceName: "Backyard", deviceBattery: 87.0,
                     measurements: ["fire_rating" : "17"],
                     coordinate: CLLocationCoordinate2D(latitude: 37.644036, longitude: -121.979566)),
            Detector(id: "5", deviceName: "Frontyard", deviceBattery: 56.0,
                     measurements: ["fire_rating" : "96"],
                     coordinate: CLLocationCoordinate2D(latitude: 37.648386, longitude: -121.969259), threat: Threat.Red),
            Detector(id: "6", deviceName: "Frontyard", deviceBattery: 41.0,
                     measurements: ["fire_rating" : "46"],
                     coordinate: CLLocationCoordinate2D(latitude: 37.647842, longitude: -121.962045)),
            
            // random from here on
            Detector(id: "7", deviceName: "Backyard", deviceBattery: 87.0, coordinate: CLLocationCoordinate2D(latitude: 37.7576, longitude: -122.4194)),
            Detector(id: "8", deviceName: "Frontyard", deviceBattery: 63.0, coordinate: CLLocationCoordinate2D(latitude: 47.6131742, longitude: -122.4824903)),
            Detector(id: "9", deviceName: "Frontyard", deviceBattery: 63.0, coordinate: CLLocationCoordinate2D(latitude: 1.3440852, longitude: 103.6836164)),
            Detector(id: "10", deviceName: "Backyard", deviceBattery: 87.0, coordinate: CLLocationCoordinate2D(latitude: -33.8473552, longitude: 150.6511076)),
            Detector(id: "11", deviceName: "Frontyard", deviceBattery: 63.0, coordinate: CLLocationCoordinate2D(latitude: 35.6684411, longitude: 139.6004407)),
            Detector(id: "12", deviceName: "Frontyard", deviceBattery: 63.0, coordinate: CLLocationCoordinate2D(latitude: 35.02, longitude: 136)),
            Detector(id: "13", deviceName: "Backyard", deviceBattery: 87.0, coordinate: CLLocationCoordinate2D(latitude: 37.7576, longitude: -122.4194)),
            Detector(id: "14", deviceName: "Frontyard", deviceBattery: 63.0, coordinate: CLLocationCoordinate2D(latitude: 47.6131742, longitude: -122.4824903), connected: false)
        ])
        
        self.properties.append(property)
        
        for _ in 0..<10 {
            self.properties.append(property)
        }
        
        self.selectedProperty = property
        
        self.newProperty = Property(id: "1", propertyName: "Mom's house", propertyAddress: "2237 Kamp Court, Pleasanton, CA 94588", propertyImage: "https://maps.googleapis.com/maps/api/staticmap?key=AIzaSyBevmebTmlyD-kftwvRqqRItgh07CDiwx0&size=180x180&scale=2&maptype=satellite&zoom=19&center=2237 Kamp Court, Pleasanton, CA 94588")
    }
    
    func createUserData(email: String, deviceToken: String?) {
        // print("Creating user data")
        
        
        var req = SocketRequest(
            route: "createUserDB",
            data: [
                "user_id": AuthenticationManager.shared.authUser?.userId ?? "",
                "email": email
            ],
            completion: { data in
                AuthenticationManager.shared.authState = .authenticated
            })
        if deviceToken != nil {
            req.data["device_token"] = deviceToken!
        }
        
        print("Sending create user req: \(req.data)")
        
        // Send request through socket
        WebSocketManager.shared.sendData(socketRequest: req)
    }
    
    func loadUserProperties() {
        
        let userID = AuthenticationManager.shared.authUser?.userId ?? ""
        let req = SocketRequest(
            route: "getPropertiesDevicesData",
            data: [
                "user_id": userID
            ],
            completion: { data in
                
                guard let result = data["result"] as? [String: Any] else {
                    DispatchQueue.main.async {
                        print("couldn't parse:", data)
                        guard let resultString = data["result"] as? String else {
                            self.propertiesLoaded = true
                            return
                        }
                        
                        if resultString.contains("properties not found") {
                            self.propertiesLoaded = true
                            self.properties = []
                            self.alerts = []
                        }
//                        self.propertiesLoaded = true
                    }
                    self.loadUserProperties()
                    //                }
                    return
                }
                
                guard let properties = result["properties"] as? [String : [String: Any]] else {
                    DispatchQueue.main.async {
                        print("couldn't parse:", data)
                        self.propertiesLoaded = true
                    }
                    self.loadUserProperties()
                    //                }
                    return
                }
                
                if self.firstTimeLoaded && self.properties.count == properties.count {
                    self.updateDevices(properties: properties)
                    Task {
                        self.pullDeviceAnalytics(properties: properties)
                    }
                } else {
                    if (self.newProperty == nil) {
                        print("DIFF PROPERTIES, \(self.properties.count), \(properties.count), \(self.properties), \(properties)")
                        self.clearProperties()
                        var deletedProperties = 0
                        for (id, property) in properties {
                            if (self.deletedProperties.contains(id)) {
                                deletedProperties += 1
                                continue
                            }
                            self.parseProperty(id: id, property: property)
                        }
                        Task {
                            self.pullDeviceAnalytics(properties: properties)
                        }
                        
                        self.unparsedProperties = properties.count - deletedProperties
                        DispatchQueue.main.async {
                            self.propertiesLoaded = true
                            self.firstTimeLoaded = true
                        }
                    }
                }
                self.loadUserProperties() // mubashir
            })
        
        // Send request through socket
        WebSocketManager.shared.sendData(socketRequest: req)
    }
    
    func uploadNewProperty() {
        
        let userID = AuthenticationManager.shared.authUser?.userId ?? ""
        if let property = self.newProperty {
            
            let req = SocketRequest(
                route: "createPropertyDB",
                data: [
                    "user_id": userID,
                    "property_name": property.propertyName,
                    "property_address": property.propertyAddress,
                    "property_image": property.propertyImage,
                ],
                completion: { data in
                    
                    guard let result = data["result"] as? [String: Any] else {
                        return
                    }
                    
                    guard let property_id = result["property_id"] as? String else {
                        return
                    }
                    
                    self.newProperty?.id = property_id
                    if let newProperty = self.newProperty {
                        self.properties.append(newProperty)
                    }
                    self.properties[self.properties.count - 1].loadingData = true
                    self.selectedPropertyIndex = self.properties.count - 1
                    print("Set property index: \(self.selectedPropertyIndex) \(self.properties.count)")
                })
            
            // Send request through socket
            WebSocketManager.shared.sendData(socketRequest: req)
        }
    }
    
    
    func uploadPropertyImage(image: UIImage, imageKey: String, completion: @escaping (Result<String, Error>) -> Void) async {
        do {
            guard let houseImageData = image.jpegData(compressionQuality: 0.4) else {
                return
            }
            
            let uploadTask = Amplify.Storage.uploadData(
                key: imageKey,
                data: houseImageData
            )
            
            let value = try await uploadTask.value
            print("Completed: \(value)")
            //            DispatchQueue.main.async {
            completion(.success(value))
            //            }
            
        } catch {
            print("Error: \(error)")
            //            DispatchQueue.main.async {
            completion(.failure(error))
            //            }
        }
    }
    
    func getPropertyImageUrl(imageKey: String, completion: @escaping (Result<URL, Error>) -> Void) async {
        do {
            let url = try await Amplify.Storage.getURL(key: imageKey)
            print("Completed: \(url)")
            //            DispatchQueue.main.async {
            completion(.success(url))
            //            }
        } catch {
            print("Error: \(error)")
            //            DispatchQueue.main.async {
            completion(.failure(error))
            //            }
        }
        
    }
    
    func updateDevices(properties: [String : [String: Any]]) {
        
        var redAlert: AlertModel? = nil
        var yellowAlert: AlertModel? = nil
        var alertsAdded: Bool = false
        
        print("Got updated properties: \(properties.keys)")
        
        for (id, new_property) in properties {
            print("Checking property \(id), del \(self.deletedProperties)")
            if self.deletedProperties.contains(id) {
                print("Ignoring new property \(id)")
                continue
            }
            
            for i in 0..<self.properties.count {
                if self.properties[i].id == id {
                    // We found property with same ID, update device measurements
                    guard let devices = new_property["devices"] as? [[String: Any]] else {
                        return
                    }
                    
                    var propertyStatus = "All sensors are normal"
                    for j in 0..<self.properties[i].detectors.count {
                        for new_device in devices {
                            if self.properties[i].detectors[j].id == new_device["device_id"] as? String {
                                
                                let deviceID = new_device["device_id"] as? String ?? ""
                                let deviceMeasurements = new_device["measurements"] as? [String: Any] ?? [:]
                                let latitude = new_device["latitude"] as? Double ?? 0.0
                                let longitude = new_device["longitude"] as? Double ?? 0.0
                                let muted = new_device["mute"] as? Bool ?? false
                                
                                var deviceBattery = 0.0
                                var fireRatingNumber = 0
                                var fireRating = "0"
                                var temperature = "0"
                                var humidity = "0"
                                var thermalStatus = Threat.Green
                                var spectralStatus = Threat.Green
                                var smokeStatus = Threat.Green
                                var overallStatus = Threat.Green
                                var lastTimestamp: Date? = nil
                                var irHot: [[Double]] = []
                                
                                
                                if let batteryString = deviceMeasurements["battery"] as? String {
                                    deviceBattery = Double(batteryString) ?? 0.0
                                }
                                if let fireRatingString = deviceMeasurements["risk_probability"] as? String {
                                    fireRatingNumber = Int(Double(fireRatingString) ?? 0)
                                    fireRating = String(fireRatingNumber)
                                }
                                if let temperatureString = deviceMeasurements["temperature"] as? String {
                                    let tmp = Int(Double(temperatureString) ?? 0)
                                    temperature = String(tmp)
                                }
                                
                                if let humidityString = deviceMeasurements["humidity"] as? String {
                                    let tmp = Int(Double(humidityString) ?? 0.0)
                                    humidity = String(tmp)
                                }
                                
                                if let thermalStatusString = deviceMeasurements["thermal_status"] as? String {
                                    let tmp = String(thermalStatusString)
                                    if tmp == "YELLOW" {
                                        thermalStatus = Threat.Yellow
                                    } else if tmp == "RED" {
                                        thermalStatus = Threat.Red
                                    }
                                }
                                
                                if let spectralStatusString = deviceMeasurements["spectral_status"] as? String {
                                    let tmp = String(spectralStatusString)
                                    if tmp == "YELLOW" {
                                        spectralStatus = Threat.Yellow
                                    } else if tmp == "RED" {
                                        spectralStatus = Threat.Red
                                    }
                                }
                                
                                if let smokeStatusString = deviceMeasurements["smoke_status"] as? String {
                                    let tmp = String(smokeStatusString)
                                    // print("SmokeStatusString \(tmp)")
                                    if tmp == "YELLOW" {
                                        smokeStatus = Threat.Yellow
                                    } else if tmp == "RED" {
                                        smokeStatus = Threat.Red
                                    }
                                }
                                
                                if let irHotTmp = deviceMeasurements["ir_hot"] as? [[Double]] {
                                    irHot = irHotTmp
                                    print("Got irHot: \(irHot) for device id \(deviceID)")
                                }
                                
                                if let timeString = deviceMeasurements["sensor_time"] as? String {
                                    let timestamp = String(timeString)
                                    
                                    let formatter = DateFormatter()
                                    formatter.timeZone = TimeZone(abbreviation: "UTC")
                                    
                                    // Set the format to match your timestamp
                                    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSSSSS"
                                    
                                    if let date = formatter.date(from: timestamp) {
                                        lastTimestamp = date
                                        print("Converted timestamp from \(timestamp) to \(lastTimestamp)")
                                        // Now you can use this 'date' object as needed in your app
                                    } else {
                                        // print("Failed to parse date")
                                    }
                                    
                                }
                                
                                var redFlag = false
                                var yellowFlag = false
                                if let overallStatusString = deviceMeasurements["overall_status"] as? String {
                                    let tmp = String(overallStatusString)
                                    // print("[OverallStatusString] \(tmp)")
                                    if tmp == "YELLOW" {
                                        overallStatus = Threat.Yellow
                                        propertyStatus = "Warning"
                                        yellowFlag = true
                                    } else if tmp == "RED" {
                                        overallStatus = Threat.Red
                                        propertyStatus = "Red alert"
                                        redFlag = true
                                    }
                                }
                                
                                if redFlag {
                                    redAlert = AlertModel(property: self.properties[i], detector: self.properties[i].detectors[j], threat: Threat.Red)
                                    //                                    print("RED FLAG TRUE")
                                }
                                if yellowFlag {
                                    yellowAlert = AlertModel(property: self.properties[i], detector: self.properties[i].detectors[j], threat: Threat.Yellow)
                                    //                                    print("YELLOW FLAG TRUE")
                                }
                                
                                self.properties[i].detectors[j].measurements["fire_rating"] = fireRating
                                self.properties[i].detectors[j].measurements["temperature"] = temperature
                                self.properties[i].detectors[j].measurements["humidity"] = humidity
                                //                                self.properties[i].detectors[j].muted = muted
                                self.properties[i].detectors[j].irHot = irHot
                                self.properties[i].detectors[j].spectralStatus = spectralStatus
                                self.properties[i].detectors[j].smokeStatus = smokeStatus
                                self.properties[i].detectors[j].thermalStatus = thermalStatus
                                //                                self.properties[i].detectors[j].coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                print("SENS UPDATE SESS \(deviceID) \(self.properties[i].detectors[j].coordinate)")
                                self.properties[i].detectors[j].deviceBattery = deviceBattery
                                self.properties[i].detectors[j].irHot = irHot
                                //                                self.properties[i].detectors[j].lastTimestamp = lastTimestamp
                                self.latestTimestampDict[deviceID] = lastTimestamp
                                
                                self.properties[i].detectors[j].threat = overallStatus
                                self.properties[i].threat = overallStatus
                                self.properties[i].propertyDescription = propertyStatus
                                
                            }
                        }
                    }
                    
                    for new_device in devices {
                        var found = false
                        for j in 0..<self.properties[i].detectors.count {
                            if new_device["device_id"] as? String == self.properties[i].detectors[j].id {
                                found = true
                                break
                            }
                        }
                        
                        if !found {
                            let deviceID = new_device["device_id"] as? String ?? ""
                            
                            if (self.deletedDetectors.contains(deviceID)) {
                                continue
                            } else {
                                print("added fresh detector, \(deviceID), \(self.deletedDetectors)")
                            }
                            
                            let deviceName = new_device["device_name"] as? String ?? ""
                            let deviceMeasurements = new_device["measurements"] as? [String: Any] ?? [:]
                            let latitude = new_device["latitude"] as? Double ?? 0.0
                            let longitude = new_device["longitude"] as? Double ?? 0.0
                            let muted = new_device["mute"] as? Bool ?? false
                            
                            var deviceBattery = 0.0
                            var fireRatingNumber = 0
                            var fireRating = "0"
                            var temperature = "0"
                            var humidity = "0"
                            var thermalStatus = Threat.Green
                            var spectralStatus = Threat.Green
                            var smokeStatus = Threat.Green
                            var overallStatus = Threat.Green
                            var lastTimestamp: Date? = nil
                            var irHot: [[Double]] = []
                            
                            
                            if let batteryString = deviceMeasurements["battery"] as? String {
                                deviceBattery = Double(batteryString) ?? 0.0
                            }
                            if let fireRatingString = deviceMeasurements["risk_probability"] as? String {
                                fireRatingNumber = Int(Double(fireRatingString) ?? 0.0)
                                fireRating = String(fireRatingNumber)
                            }
                            if let temperatureString = deviceMeasurements["temperature"] as? String {
                                let tmp = Int(Double(temperatureString) ?? 0.0)
                                temperature = String(tmp)
                            }
                            
                            if let humidityString = deviceMeasurements["humidity"] as? String {
                                let tmp = Int(Double(humidityString) ?? 0.0)
                                humidity = String(tmp)
                            }
                            
                            if let thermalStatusString = deviceMeasurements["thermal_status"] as? String {
                                let tmp = String(thermalStatusString)
                                if tmp == "YELLOW" {
                                    thermalStatus = Threat.Yellow
                                } else if tmp == "RED" {
                                    thermalStatus = Threat.Red
                                }
                            }
                            
                            if let spectralStatusString = deviceMeasurements["spectral_status"] as? String {
                                let tmp = String(spectralStatusString)
                                if tmp == "YELLOW" {
                                    spectralStatus = Threat.Yellow
                                } else if tmp == "RED" {
                                    spectralStatus = Threat.Red
                                }
                            }
                            
                            if let smokeStatusString = deviceMeasurements["smoke_status"] as? String {
                                let tmp = String(smokeStatusString)
                                if tmp == "YELLOW" {
                                    smokeStatus = Threat.Yellow
                                } else if tmp == "RED" {
                                    smokeStatus = Threat.Red
                                }
                            }
                            
                            if let irHotTmp = deviceMeasurements["ir_hot"] as? [[Double]] {
                                irHot = irHotTmp
                                print("Got irHot: \(irHot) for device id \(deviceID)")
                            }
                            
                            if let timeString = deviceMeasurements["sensor_time"] as? String {
                                let timestamp = String(timeString)
                                
                                let formatter = DateFormatter()
                                formatter.timeZone = TimeZone(abbreviation: "UTC")
                                
                                // Set the format to match your timestamp
                                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSSSSS"
                                
                                if let date = formatter.date(from: timestamp) {
                                    lastTimestamp = date
                                    print("Converted timestamp from \(timestamp) to \(lastTimestamp)")
                                    // Now you can use this 'date' object as needed in your app
                                } else {
                                    // print("Failed to parse date")
                                }
                                
                            }
                            
                            var redFlag = false
                            var yellowFlag = false
                            if let overallStatusString = deviceMeasurements["overall_status"] as? String {
                                let tmp = String(overallStatusString)
                                //                                // print("[OverallStatusString] \(tmp)")
                                if tmp == "YELLOW" {
                                    overallStatus = Threat.Yellow
                                    propertyStatus = "Warning"
                                    yellowFlag = true
                                } else if tmp == "RED" {
                                    overallStatus = Threat.Red
                                    propertyStatus = "Red alert"
                                    redFlag = true
                                }
                            }
                            
                            var detector = Detector(id: deviceID, deviceName: deviceName, deviceBattery: deviceBattery)
                            detector.measurements["fire_rating"] = fireRating
                            detector.measurements["temperature"] = temperature
                            detector.measurements["humidity"] = humidity
                            detector.muted = muted
                            detector.irHot = irHot
                            detector.spectralStatus = spectralStatus
                            detector.smokeStatus = smokeStatus
                            detector.thermalStatus = thermalStatus
                            detector.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                            print("SENS UPDATE SESS \(deviceID) \(detector.coordinate)")
                            detector.sensorIdx = self.properties[i].detectors.count + 1
                            detector.deviceBattery = deviceBattery
                            //                            detector.lastTimestamp = lastTimestamp
                            self.latestTimestampDict[deviceID] = lastTimestamp
                            self.properties[i].threat = overallStatus
                            self.properties[i].propertyDescription = propertyStatus
                            self.properties[i].detectors.append(detector)
                            
                            if let detectors = self.properties[i].detectors.last {
                                
                                if redFlag {
                                    redAlert = AlertModel(property: self.properties[i], detector: detectors, threat: Threat.Red)
                                }
                                
                                if yellowFlag {
                                    yellowAlert = AlertModel(property: self.properties[i], detector: detectors, threat: Threat.Yellow)
                                }
                            }
                        }
                    }
                    
                    if yellowAlert != nil {
                        alertsAdded = true
                    }
                    
                    if redAlert != nil {
                        alertsAdded = true
                    }
                    
                    // Show red alert, if none then show yellow alert
                    if redAlert != nil {
                        
                        redAlert?.property = self.properties[i]
                        
                        var flag = true
                        for (idx, alert) in self.alerts.enumerated() {
                            let alert_prop_id = alert.property.id
                            if redAlert?.property.id == alert_prop_id {
                                flag = false
                                
                                if let redAlert = redAlert, redAlert.threat != alert.threat {
                                    self.alerts.remove(at: idx)
                                    self.alerts.append(redAlert);
                                }
                                break
                            }
                        }
                        
                        if flag {
                            if let redAlert = redAlert {
                                self.alerts.append(redAlert)
                            }
                        }
                    } else if var yellowAlert = yellowAlert {
                        yellowAlert.property = self.properties[i]
                        
                        var flag = true
                        for (idx, alert) in self.alerts.enumerated() {
                            let alert_prop_id = alert.property.id
                            if yellowAlert.property.id == alert_prop_id {
                                flag = false
                                
                                if yellowAlert.threat != alert.threat {
                                    self.alerts.remove(at: idx)
                                    self.alerts.append(yellowAlert)
                                }
                                
                                break
                            }
                        }
                        
                        if flag {
                            self.alerts.append(yellowAlert)
                        }
                    }
                    
                    self.properties[i].loadingData = false
                }
                
                redAlert = nil
                yellowAlert = nil
            }
        }
        
        for i in 0..<self.properties.count {
            var flag = false
            for (id, _) in properties {
                if (i < self.properties.count && id == self.properties[i].id) {
                    flag = true
                    break
                }
            }
            if !flag {
                self.properties.remove(at: i)
            }
        }
        
        
        if !alertsAdded {
            self.alerts = []
        }
    }
    
    func muteProperty(property_id: String) {
        for (i, property) in SessionManager.shared.properties.enumerated() {
            if property.id == property_id {
                // iterate over property sensors and mute each
                var count = 0
                for detector in property.detectors {
                    SessionManager.shared.muteSensor(device_id: detector.id, property_id: property.id)
                    count += 1
                }
                //                SessionManager.shared.properties[i].muted = true
                print("[MuteProperty] Sent mute requests for \(count) sensors for property_id \(property_id)")
            }
        }
    }
    
    func unmuteProperty(property_id: String) {
        for (i, property) in SessionManager.shared.properties.enumerated() {
            if property.id == property_id {
                // iterate over property sensors and unmute each
                var count = 0
                for detector in property.detectors {
                    SessionManager.shared.unmuteSensor(device_id: detector.id, property_id: property.id)
                    count += 1
                }
                //                SessionManager.shared.properties[i].muted = false
                print("[MuteProperty] Sent unmute requests for \(count) sensors for property_id \(property_id)")
            }
        }
    }
    
    func muteSensor(device_id: String, property_id: String) {
        let req = SocketRequest(route: "muteSensor",
                                data: [
                                    "device_id": device_id,
                                    "property_id": property_id,
                                    "mute": true
                                ],
                                completion: { data in
            print("MuteSensor: \(data)")
        })
        
        // Send request through socket
        WebSocketManager.shared.sendData(socketRequest: req)
        
        for (property_idx, property) in SessionManager.shared.properties.enumerated() {
            if (property_id == property.id) {
                for (detector_idx, detector) in SessionManager.shared.properties[property_idx].detectors.enumerated() {
                    if (detector.id == device_id) {
                        SessionManager.shared.properties[property_idx].detectors[detector_idx].muted = true
                        print("[MuteSensor] Complete")
                        return
                    }
                }
            }
        }
    }
    
    func unmuteSensor(device_id: String, property_id: String) {
        let req = SocketRequest(route: "muteSensor",
                                data: [
                                    "device_id": device_id,
                                    "property_id": property_id,
                                    "mute": false
                                ],
                                completion: { data in
            print("UnmuteSensor: \(data)")
        })
        
        // Send request through socket
        WebSocketManager.shared.sendData(socketRequest: req)
        
        for (property_idx, property) in SessionManager.shared.properties.enumerated() {
            if (property_id == property.id) {
                for (detector_idx, detector) in SessionManager.shared.properties[property_idx].detectors.enumerated() {
                    if (detector.id == device_id) {
                        SessionManager.shared.properties[property_idx].detectors[detector_idx].muted = false
                        print("[UnmuteSensor] Complete")
                        return
                    }
                }
            }
        }
    }
    
    func registerUserEndpoint(deviceToken: String, userID: String) {
        let req = SocketRequest(route: "registerUserEndpoint",
                                data: [
                                    "device_token": deviceToken,
                                    "user_id": userID
                                ],
                                completion: { data in
            print("RegisterUserEndpoint: \(data)")
        })
        
        // Send request through socket
        WebSocketManager.shared.sendData(socketRequest: req)
    }
    
    func uploadNewDetectors() {
        //        SessionManager.shared.properties[selectedPropertyIndex].loadingData = true
        self.newProperty?.loadingData = true
        var user_id = AuthenticationManager.shared.authUser?.userId ?? ""
        if let detectors = self.newProperty?.detectors {
            for newDetector in detectors {
                if let newProperty = self.newProperty {
                    self.registerDevice(userID: user_id, property: newProperty, detector: newDetector)
                }
            }
        }
    }
    
    func deleteProperty() {
        
        let property_id = self.properties[self.selectedPropertyIndex].id
        let user_id = AuthenticationManager.shared.authUser?.userId ?? ""
        
        let req = SocketRequest(
            route: "deleteProperty",
            data: [
                "property_id": property_id,
                "user_id": user_id
            ],
            completion: { data in
                print("DeleteProperty: \(data)")
            })
        
        // Send request through socket
        WebSocketManager.shared.sendData(socketRequest: req)
        
        self.deletedProperties.insert(property_id)
        self.properties.remove(at: self.selectedPropertyIndex)
        self.selectedPropertyIndex = min(0, self.properties.count - 1)
    }
    
    func deleteDetector() {
        
        let property_id = self.properties[self.selectedPropertyIndex].id
        let device_id = self.properties[self.selectedPropertyIndex].detectors[self.selectedDetectorIndex].id
        
        //        DispatchQueue.main.async {
        self.deletedDetectors.insert(device_id)
        print("deleting detector: \(device_id)")
        self.selectedDetectorIndex -= 1
        self.properties[self.selectedPropertyIndex].detectors.remove(at: self.selectedDetectorIndex + 1)
        //        }
        
        let req = SocketRequest(
            route: "deleteDevice",
            data: [
                "property_id": property_id,
                "device_id": device_id,
            ],
            completion: { data in
                print("DeleteDetector: \(data)")
            })
        
        print("Deleting detector", req)
        
        // Send request through socket
        WebSocketManager.shared.sendData(socketRequest: req)
    }
    
    func registerDevice(userID: String, property: Property, detector: Detector) {
        // print("Registering new device")
        
        var property = property
        var detector = detector
        
        //        // print("Got new property id: \(self.newProperty!.id) from \(self)")
        
        let req = SocketRequest(route: "registerDeviceToProperty",
                                data: [
                                    "user_id": userID,
                                    "property_id": property.id,
                                    "device_id": detector.id,
                                    "property_name": property.propertyName,
                                    "device_name": detector.deviceName,
                                    "property_image": property.propertyImage,
                                    "property_address": property.propertyAddress,
                                    "latitude": detector.coordinate!.latitude,
                                    "longitude": detector.coordinate!.longitude
                                ],
                                completion: { data in
            
            detector.sensorIdx = property.detectors.count
            self.loadUserProperties()
        })
        // Send request through socket
        WebSocketManager.shared.sendData(socketRequest: req)
    }
    
    func updateSensor(property_id: String, device_id: String, coordinate: CLLocationCoordinate2D?, deviceName: String?) {
        // print("Registering new device")
        
        //        // print("Got new property id: \(self.newProperty!.id) from \(self)")
        
        let req = SocketRequest(route: "updateSensor",
                                data: [
                                    "property_id": property_id,
                                    "device_id": device_id,
                                    "latitude": coordinate!.latitude,
                                    "longitude": coordinate!.longitude,
                                    "device_name": deviceName!
                                ],
                                completion: { data in
            
            //            detector.sensorIdx = property.detectors.count
            //            self.loadUserProperties()
            print("UpdateSensor: \(data)")
        })
        // Send request through socket
        WebSocketManager.shared.sendData(socketRequest: req)
    }
    
    func parseProperty(id: String, property: [String: Any]) {
        
        guard let devices = property["devices"] as? [[String: Any]] else {
            self.unparsedProperties -= 1
            return
        }
        
        guard let name = property["name"] as? String else {
            self.unparsedProperties -= 1
            return
        }
        
        guard let address = property["property_address"] as? String else {
            self.unparsedProperties -= 1
            return
        }
        
        guard let image = property["property_image"] as? String else {
            self.unparsedProperties -= 1
            return
        }
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(address) {
            placemarks, error in
            if error != nil {
                print("GEOCODER ERROR \(address) \(error?.localizedDescription ?? "unkown error")")
            }
            let lat = (placemarks?.first?.location?.coordinate.latitude) ?? 0.0
            let lon = (placemarks?.first?.location?.coordinate.longitude) ?? 0.0
            
            var parsedProperty = Property(id: id, propertyName: name, propertyAddress: address, propertyImage: image, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
            var sensorIdx = 0
            var redAlert: AlertModel? = nil
            var yellowAlert: AlertModel? = nil
            var propertyStatus = "All sensors are normal"
            
            for device in devices {
                sensorIdx += 1
                
                let deviceID = device["device_id"] as? String
                let deviceName = device["device_name"] as? String
                let deviceMeasurements = device["measurements"] as? [String: Any]
                let latitude = device["latitude"] as? Double
                let longitude = device["longitude"] as? Double
                let muted = device["mute"] as? Bool ?? false
                
                var deviceBattery = 0.0
                var fireRatingNumber = 0
                var fireRating = "0"
                var temperature = "0"
                var humidity = "0"
                var thermalStatus = Threat.Green
                var spectralStatus = Threat.Green
                var smokeStatus = Threat.Green
                var overallStatus = Threat.Green
                var lastTimestamp: Date? = nil
                var irHot: [[Double]] = []
                
                if let batteryString = deviceMeasurements?["battery"] as? String {
                    deviceBattery = Double(batteryString) ?? 0.0
                }
                if let fireRatingString = deviceMeasurements?["risk_probability"] as? String {
                    fireRatingNumber = Int(Double(fireRatingString) ?? 0.0)
                    fireRating = String(fireRatingNumber)
                }
                if let temperatureString = deviceMeasurements?["temperature"] as? String {
                    let tmp = Int(Double(temperatureString) ?? 0.0)
                    temperature = String(tmp)
                }
                
                if let humidityString = deviceMeasurements?["humidity"] as? String {
                    let tmp = Int(Double(humidityString) ?? 0.0)
                    humidity = String(tmp)
                }
                
                if let thermalStatusString = deviceMeasurements?["thermal_status"] as? String {
                    let tmp = String(thermalStatusString)
                    if tmp == "YELLOW" {
                        thermalStatus = Threat.Yellow
                    } else if tmp == "RED" {
                        thermalStatus = Threat.Red
                    }
                }
                
                if let spectralStatusString = deviceMeasurements?["spectral_status"] as? String {
                    let tmp = String(spectralStatusString)
                    if tmp == "YELLOW" {
                        spectralStatus = Threat.Yellow
                    } else if tmp == "RED" {
                        spectralStatus = Threat.Red
                    }
                }
                
                if let smokeStatusString = deviceMeasurements?["smoke_status"] as? String {
                    let tmp = String(smokeStatusString)
                    if tmp == "YELLOW" {
                        smokeStatus = Threat.Yellow
                    } else if tmp == "RED" {
                        smokeStatus = Threat.Red
                    }
                }
                
                if let timeString = deviceMeasurements?["sensor_time"] as? String {
                    
                    let timestamp = String(timeString)
                    let formatter = DateFormatter()
                    formatter.timeZone = TimeZone(abbreviation: "UTC")
                    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSSSSS"
                    
                    if let date = formatter.date(from: timestamp) {
                        lastTimestamp = date
                        print("Converted timestamp from \(timestamp) to \(lastTimestamp)")
                    }
                }
                
                if let irHotTmp = deviceMeasurements?["ir_hot"] as? [[Double]] {
                    irHot = irHotTmp
                    print("Got irHot: \(irHot) for device id \(deviceID)")
                }
                
                var redFlag = false
                var yellowFlag = false
                if let overallStatusString = deviceMeasurements?["overall_status"] as? String {
                    let tmp = String(overallStatusString)
                    if tmp == "YELLOW" {
                        overallStatus = Threat.Yellow
                        propertyStatus = "Warning"
                        yellowFlag = true
                    } else if tmp == "RED" {
                        overallStatus = Threat.Red
                        propertyStatus = "Red alert"
                        redFlag = true
                    }
                }
                parsedProperty.propertyDescription = propertyStatus
                
                var detector = Detector(id: deviceID ?? "", deviceName: deviceName ?? "", deviceBattery: deviceBattery)
                detector.measurements["fire_rating"] = fireRating
                detector.measurements["temperature"] = temperature
                detector.measurements["humidity"] = humidity
                detector.muted = muted
                detector.irHot = irHot
                detector.spectralStatus = spectralStatus
                detector.smokeStatus = smokeStatus
                detector.thermalStatus = thermalStatus
                detector.coordinate = CLLocationCoordinate2D(latitude: latitude ?? 0.0, longitude: longitude ?? 0.0)
                //                print("SENS UPDATE SESS \(deviceID) \(detector.coordinate)")
                detector.sensorIdx = sensorIdx
                detector.deviceBattery = deviceBattery
                self.latestTimestampDict[deviceID ?? ""] = lastTimestamp
                detector.threat = overallStatus
                
                if redFlag {
                    redAlert = AlertModel(property: parsedProperty, detector: detector, threat: Threat.Red)
                }
                
                if yellowFlag {
                    yellowAlert = AlertModel(property: parsedProperty, detector: detector, threat: Threat.Yellow)
                }
                parsedProperty.detectors.append(detector)
            }
            
            // Show red alert, if none then show yellow alert
            if var redAlert = redAlert {
                redAlert.property = parsedProperty
                self.alerts.append(redAlert)
            } else if var yellowAlert = yellowAlert {
                yellowAlert.property = parsedProperty
                self.alerts.append(yellowAlert)
            }
            self.properties.append(parsedProperty)
            self.unparsedProperties -= 1
        }
    }
    
    func checkRedAlert(property: Property) {
        
    }
    
    func addNewDetector(detector: Detector) {
        
        for i in 0..<(self.newProperty?.detectors.count ?? 0) {
            self.newProperty?.detectors[i].selected = false
        }
        self.newProperty?.detectors.append(detector)
    }
    
    func setSelectedDetectorNewProperty(detector: Detector) {
        for i in 0..<(self.newProperty?.detectors.count ?? 0) {
            if (self.newProperty!.detectors[i].id == detector.id) {
                self.newProperty!.detectors[i].selected = true
            } else {
                self.newProperty!.detectors[i].selected = false
            }
        }
    }
    
    func deleteNewDetector(detector: Detector) {
        for i in 0..<(self.newProperty?.detectors.count ?? 0) {
            if self.newProperty?.detectors[i].id == detector.id {
                self.newProperty?.detectors.remove(at: i)
                
                return
            }
        }
    }
    
    func setDetectorCoordinate(detector: Detector, coordinate: CLLocationCoordinate2D) {
        
        if self.newProperty == nil {
            return
        }
        
        for i in 0..<(self.newProperty?.detectors.count ?? 0) {
            if self.newProperty?.detectors[i].id == detector.id {
                self.newProperty?.detectors[i].coordinate = coordinate
                
                return
            }
        }
    }
    
    func pullLatestDeviceData(deviceId: String) {
        
        let request = SocketRequest(
            route: "pullLatestDeviceData",
            data: ["device_id" : deviceId],
            completion: { data in
                print(data)
            })
        WebSocketManager.shared.sendData(socketRequest: request)
    }
    
    func pullDeviceAnalytics(properties: [String : [String: Any]]) {
        print("pull device analytics \(self.properties.count)")
        
        for i in 0..<self.properties.count {
            for j in 0..<self.properties[i].detectors.count {
                let deviceId = self.properties[i].detectors[j].id
                
                //                self.getDeviceAnalyticsData(deviceId: deviceId, timespan: AnalyticsTimespanSelection.tenMinutes)
                self.getDeviceAnalyticsData(deviceId: deviceId, timespan: AnalyticsTimespanSelection.oneHour)
                self.getDeviceAnalyticsData(deviceId: deviceId, timespan: AnalyticsTimespanSelection.oneDay)
                self.getDeviceAnalyticsData(deviceId: deviceId, timespan: AnalyticsTimespanSelection.oneWeek)
                self.getDeviceAnalyticsData(deviceId: deviceId, timespan: AnalyticsTimespanSelection.oneMonth)
            }
        }
    }
    
    func updateProperty(propertyIndex: Int, propertyName: String, propertyAddress: String, propertyImage: String, placemark: CLLocationCoordinate2D) {
        
        print("update property, got: \(propertyName) \(propertyAddress) \(propertyImage)")
        
        let request = SocketRequest(
            route: "updateProperty",
            data: [
                "property_id" : self.properties[self.selectedPropertyIndex].id,
                "property_name": propertyName,
                "property_address": propertyAddress,
                "property_image": propertyImage
            ],
            completion: { data in
                print("Update Property: \(data)")
                self.properties[self.selectedPropertyIndex].coordinate = placemark
                self.properties[self.selectedPropertyIndex].propertyName = propertyName
                self.properties[self.selectedPropertyIndex].propertyAddress = propertyAddress
                self.properties[self.selectedPropertyIndex].propertyImage = propertyImage
                self.propertyUpdated = true
            })
        WebSocketManager.shared.sendData(socketRequest: request)
    }
    
    
    func getDeviceAnalyticsData(deviceId: String, timespan: AnalyticsTimespanSelection) {
        
        print("get device analytics \(deviceId)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        let endDate = Date()
        if let startDate = Calendar.current.date(byAdding: .second, value: timespan.timeInterval, to: endDate) {
            
            let userID = AuthenticationManager.shared.authUser?.userId ?? ""
            let request = SocketRequest(
                route: "getHistoricalDeviceAnalytics",
                data: [
                    "device_id": deviceId,
                    "start_interval": dateFormatter.string(from: startDate),
                    "end_interval": dateFormatter.string(from: endDate),
                    "skip": timespan.stringStep
                ],
                completion: { data in
                    guard let measurements = data["measurements"] as? [String: [[String: String]]] else {
                        print("couldn't cast measurements")
                        return
                    }
                    
                    print("got \(measurements.count) categories of measurements")
                    
                    if !(self.deviceAnalytics.keys.contains(deviceId)) {
                        self.deviceAnalytics[deviceId] = [:]
                    }
                    
                    if !(self.deviceAnalytics[deviceId]!.keys.contains(timespan.stringSpan)) {
                        self.deviceAnalytics[deviceId]![timespan.stringSpan] = [:]
                    }
                    let dateFormatter = DateFormatter()
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // Use POSIX locale for fixed-format date strings
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSSSSS"
                    
                    for k in measurements.keys {
                        if let measurement = measurements[k] {
                            var data: [AnalyticDatapoint] = []
                            var parsedMeasurements = 0
                            for i in 0..<measurement.count {
                                guard let date = dateFormatter.date(from: measurement[i]["timestamp"] ?? "") else {
                                    continue
                                }
                                
                                if let point = Double(measurement[i]["value"] ?? "") {
                                    parsedMeasurements += 1
                                    data.append(AnalyticDatapoint(datapoint: point, timestamp: date))
                                }
                            }
                            
                            //                            for _ in parsedMeasurements..<60 {
                            //                                data.insert(AnalyticDatapoint(datapoint: 0.0, timestamp: self.getCurrentDateInUTC()), at: 0)
                            //                                break
                            //                            }
                            
                            self.deviceAnalytics[deviceId]?[timespan.stringSpan]?[k] = data
                        }
                    }
                    NotificationCenter.default.post(name: NSNotification.updatedData, object: nil, userInfo: nil)
                })
            WebSocketManager.shared.sendData(socketRequest: request)
        }
    }
    
    func getCurrentDateInUTC() -> Date {
        let currentDate = Date()
        let localTimeZone = TimeZone.current
        let utcTimeZone = TimeZone(identifier: "UTC")!
        let currentOffset = localTimeZone.secondsFromGMT(for: currentDate)
        let utcOffset = utcTimeZone.secondsFromGMT(for: currentDate)
        let interval = TimeInterval(utcOffset - currentOffset)
        let utcDate = currentDate.addingTimeInterval(interval)
        return utcDate
    }
}
