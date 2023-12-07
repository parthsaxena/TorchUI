//
//  AccountView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI


struct AccountView: View {
    @ObservedObject var sessionManager = SessionManager.shared
    @ObservedObject var authenticationManager = AuthenticationManager.shared
    
//    @State var state: AccountState = .welcome
    
    @State var accountName: String = ""
    @State var accountEmail: String = ""
    @State var accountCompanyName: String = ""
    @State var accountPassword: String = ""
    
    var body: some View {
        Group {
            let x =  print("pooppp: \(authenticationManager.authStateLoaded) \(authenticationManager.authState)")
            if !authenticationManager.authStateLoaded {
//                LoadingSplashScreen()
//                    .ignoresSafeArea()
                let x = print("1")
                PropertiesView()
                
            } else
            if authenticationManager.authState == .welcome {
                WelcomeView()
            } else if authenticationManager.authState == .login {
                LoginView()
            } else if authenticationManager.authState == .accountName {
                AccountNameView(accountName: $accountName)
            } else if authenticationManager.authState == .accountEmail {
                AccountEmailView(accountEmail: $accountEmail)
            } else if authenticationManager.authState == .companyName {
                AccountCompanyNameView(accountCompanyName: $accountCompanyName)
            } else if authenticationManager.authState == .accountPassword {
                AccountPasswordView(accountEmail: $accountEmail, accountPassword: $accountPassword)
            } else if authenticationManager.authState == .accountVerificationCode {
                AccountVerificationCodeView(accountEmail: $accountEmail, accountPassword: $accountPassword)
            } else if authenticationManager.authState == .authenticated {
                
                if sessionManager.appState == .properties {
//                    let x = // print("State \(sessionManager.appState)")
                    if !sessionManager.firstTransition {
                        let x = print("2")
                        PropertiesView()
    //                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
                            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))                        .zIndex(1)
                    } else {
                        PropertiesView()
                    }
                } else if sessionManager.appState == .viewProperty {
//                    let x = // print("State \(sessionManager.appState)")
                    MainMapView()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
                        .zIndex(2)
                }
            }
        }
        .animation(.easeInOut)
        
    }
}
