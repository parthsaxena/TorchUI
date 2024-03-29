//
//  CustomColors.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 13/11/2023.
//

import SwiftUI

struct CustomColors {
    /*background: rgba(21, 112, 239, 1);*/
    static let TorchRed = Color(red: 0.94, green: 0.27, blue: 0.22)
    static let TorchGreen = Color(red: 0.27, green: 0.32, blue: 0.33)
    static let TorchBlue = Color(red: 0.08301673084, green: 0.4385043383, blue: 0.9358554482)

    static let LightGray = Color(red: 0.56, green: 0.63, blue: 0.64)
    static let UltraLightGray = Color(red: 0.67, green: 0.72, blue: 0.73)
    static let NormalSensorGray = Color(red: 0.95, green: 0.95, blue: 0.95)
    static let DetectorDetailsShadow = Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.08)
    static let DetectorDetailsRedShadow = Color(red: 0.962533772, green: 0.3612903357, blue: 0.2801753879).opacity(0.51)
    static let GoodGreen = Color(red: 0.09, green: 0.7, blue: 0.39)
    static let WarningYellow = Color(red: 0.97, green: 0.56, blue: 0.03)
    
    static let DisabledButtonColor: Color = Color(red: 0.78, green: 0.81, blue: 0.82)
    static let EnabledButtonColor: Color = Color(red: 0.18, green: 0.21, blue: 0.22)
    
    static let DarkModeBackground = Color(red: 0.17, green: 0.18, blue: 0.2)
    static let DarkModeMainTestColor = Color(red: 1, green: 0.36, blue: 0.14)
    static let DarkModeOverlayBackground = Color(red: 55/255, green: 58/255, blue: 61/255)
    
    static let SegmentBottomLineColor = Color.gray.opacity(0.5)
}
