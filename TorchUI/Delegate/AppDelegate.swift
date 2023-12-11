//
//  AppDelegate.swift
//  TorchUI
//
//  Created by Parth Saxena on 7/6/23.
//

import Foundation
import GoogleMaps
import Amplify
import AWSPinpoint
import AWSPluginsCore

class AppDelegate: NSObject, UIApplicationDelegate {
//    var pinpoint: AWSPinpoint?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("App delegate did finish launching")
//        
//        let pinpointConfig = AWSPinpointConfiguration.defaultPinpointConfiguration(withLaunchOptions: launchOptions)
//        pinpoint = AWSPinpoint(configuration: pinpointConfig)
        
        // Initialize Google Maps SDK
        GMSServices.provideAPIKey("AIzaSyBevmebTmlyD-kftwvRqqRItgh07CDiwx0")
        RunLoop.current.run(until: NSDate(timeIntervalSinceNow:2) as Date)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                // Check for granted permission
                if granted {
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                }
            }
            return true
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("ADRFRNWDT: \(deviceToken.encodeToHexString())")
//        deviceToken.encodeToHexString()
        let tokenParts = deviceToken.map { data -> String in
                return String(format: "%02.2hhx", data)
            }
            
            let tokenString = tokenParts.joined()
            print("Device Token: \(tokenString)")
            AuthenticationManager.shared.deviceToken = tokenString        
        
        Task {
                do {
                    try await Amplify.Notifications.Push.registerDevice(apnsToken: deviceToken)
                    print("Registered with Pinpoint: \(deviceToken)")
                } catch {
                    print("Error registering with Pinpoint: \(error)")
                }
            }
    }
    
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any]
    ) async -> UIBackgroundFetchResult {
        
        do {
            try await Amplify.Notifications.Push.recordNotificationReceived(userInfo)
        } catch {
            print("Error recording receipt of notification: \(error)")
        }
        
        return .newData
    }
}
