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
    case viewAnalytics
    case updateProperty
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

enum AnalyticsTypeSelection: String, CaseIterable {
    case thermalCameras = "Thermal cameras"
    case spectralAnalysis = "Spectral analysis"
    case smoke = "Smoke"
    case temperatureHumidity = "Temperature & Humidity"
}

enum AnalyticsTimespanSelection: CaseIterable {
    case tenMinutes
    case oneHour
    case oneDay
    case oneWeek
    case oneMonth
    
    var stringSpan: String {
        switch self {
            case .tenMinutes: return "10m"
            case .oneHour:    return "1h"
            case .oneDay:     return "1d"
            case .oneWeek:    return "1w"
            case .oneMonth:   return "1mo"
        }
    }
    
    var stringStep: String {
        switch self {
            case .tenMinutes: return "10s"
            case .oneHour:    return "1m"
            case .oneDay:     return "24m"
            case .oneWeek:    return "168m"
            case .oneMonth:   return "12h"
        }
    }

    var timeInterval: Int {
        switch self {
            case .tenMinutes: return -10 * 60
            case .oneHour:    return -60 * 60
            case .oneDay:     return -24 * 60 * 60
            case .oneWeek:    return -7 * 24 * 60 * 60
            case .oneMonth:   return -30 * 24 * 60 * 60
        }
    }
}
