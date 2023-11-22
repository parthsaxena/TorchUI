//
//  TorchUIApp.swift
//  TorchUI
//
//  Created by Parth Saxena on 6/28/23.
//

import SwiftUI
import Amplify
import AWSCognitoAuthPlugin

@main
struct TorchUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
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
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            try Amplify.configure()
            WebSocketManager.shared.connect()
            
            Task {
                await AuthenticationManager.shared.fetchCurrentAuthSession()
            }
        } catch {
            // print("Failed to initialize Amplify with error: \(error)")
        }
    }
}
