//
//  View+Extension.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

extension View {
    
    func toast(isPresented: Binding<Bool>, message: String, coordinates: CGPoint) -> some View {
        ZStack {
            self
            if isPresented.wrappedValue {
                VStack {
                    HStack {
                        ToastView(message: message)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .position(x: CGFloat(coordinates.x + adjustLeadingTrailing(coordinates.x)), y: coordinates.y)
            }
        }
        .animation(nil)
    }
    
    func adjustLeadingTrailing(_ x: CGFloat) -> CGFloat {
        
        if x < 40 { return 30 }
        return (x * -0.11)
    }
}
