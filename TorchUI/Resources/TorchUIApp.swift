//
//  TorchUIApp.swift
//  TorchUI
//
//  Created by Parth Saxena on 6/28/23.
//

import SwiftUI
import Amplify
import AWSCognitoAuthPlugin
import AWSPinpointPushNotificationsPlugin
import AWSS3StoragePlugin

@main
struct TorchUIApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    @ObservedObject var sessionManager = SessionManager.shared
    @ObservedObject var authenticationManager = AuthenticationManager.shared
    
    var body: some Scene {
        WindowGroup {
            switch authenticationManager.authState {
            case .login:
                AccountView()
            case .authenticated:
                AccountView()
            default:
                AccountView()
            }
        }
    }
    
    init() {
        do {
            print("GPTTT1")
            Amplify.Logging.logLevel = .debug

            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSS3StoragePlugin())
            try Amplify.add(
                plugin: AWSPinpointPushNotificationsPlugin(options: [.badge, .alert, .sound])
            )
            print("GPTTT2")
            try Amplify.configure()
            print("GPTTT3")
            WebSocketManager.shared.connect()
            print("GPTTT4")
            
            Task {
                await AuthenticationManager.shared.fetchCurrentAuthSession()
                print("GPTTT5")
            }
        } catch {
             print("Failed to initialize Amplify with error: \(error)")
        }
    }
}
