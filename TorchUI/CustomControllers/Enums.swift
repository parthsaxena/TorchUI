//
//  Enums.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import Foundation

enum Threat {
    case Red
    case Yellow
    case Green
}

enum AuthState: Int {
    case welcome
    case login
    case accountName
    case accountEmail
    case companyName
    case accountPassword
    case accountVerificationCode
    case authenticated
}

enum AppState {
    case properties
    case viewProperty
}

enum FocusField: Hashable {
    case field
}

enum OnboardingState: Int {
    case propertyName
    case propertyAddress
    case propertyPhoto
    case connectToHub
    case promptInstallation
    case placeSensors
}

enum AccountState: Int {
    case welcome
    case login
    
    case accountName
    case accountEmail
    case companyName
    case accountPassword
    case accountVerificationCode
    
    case authenticated
}
