//
//  ToastView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 23/04/2024.
//

import SwiftUI

struct ToastView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .padding(.all, 7)
            .font(Font.custom("Manrope-SemiBold", size: 14.0))
            .background(message == "" ? .clear : .black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .frame(height: 50)
    }
}
