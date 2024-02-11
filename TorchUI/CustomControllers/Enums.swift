//
//  Enums.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import Foundation

struct AnalyticDatapoint: Hashable {
    var datapoint: CGFloat
    var timestamp: Date
}

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
    case oneYear
    
    var stringSpan: String {
        switch self {
            case .tenMinutes: return "10m"
            case .oneHour:    return "1h"
            case .oneDay:     return "1d"
            case .oneWeek:    return "1w"
            case .oneMonth:   return "1mo"
            case .oneYear:    return "1y"
        }
    }
    
    var stringTimeSpan: String {
        switch self {
            case .tenMinutes: return "10 Min"
            case .oneHour:    return "1 Hour"
            case .oneDay:     return "1 Day"
            case .oneWeek:    return "1 Week"
            case .oneMonth:   return "1 Month"
            case .oneYear:    return "1 Year"
        }
    }
    
    var stringStep: String {
        switch self {
            case .tenMinutes: return "10s"
            case .oneHour:    return "1m"
            case .oneDay:     return "24m"
            case .oneWeek:    return "168m"
            case .oneMonth:   return "12h"
            case .oneYear:    return "146h"
        }
    }

    var timeInterval: Int {
        switch self {
            case .tenMinutes: return -10 * 60
            case .oneHour:    return -60 * 60
            case .oneDay:     return -24 * 60 * 60
            case .oneWeek:    return -7 * 24 * 60 * 60
            case .oneMonth:   return -30 * 24 * 60 * 60
            case .oneYear:    return -30 * 24 * 60 * 60 * 12
        }
    }
}

enum DetectorInfoStatus {
    case fire
    case battery
    case connection
    case temperature
    case humidity
}
