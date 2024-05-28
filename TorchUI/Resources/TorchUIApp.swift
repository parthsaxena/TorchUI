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
                TabBarsView()
            default:
                TabBarsView()
            }
        }
    }
    
    init() {
        do {
            
            Amplify.Logging.logLevel = .debug

            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.add(plugin: AWSS3StoragePlugin())
            try Amplify.add(
                plugin: AWSPinpointPushNotificationsPlugin(options: [.badge, .alert, .sound])
            )

            try Amplify.configure()
            WebSocketManager.shared.connect()
            Task {
                await AuthenticationManager.shared.fetchCurrentAuthSession()
            }
        } catch {
             print("Failed to initialize Amplify with error: \(error)")
        }
    }
}
