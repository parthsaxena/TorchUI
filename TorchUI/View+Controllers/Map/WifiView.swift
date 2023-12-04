//
//  WifiView.swift
//  TorchUI
//
//  Created by Yash Bhalala on 30/11/23.
//

import SwiftUI

struct WiFiIcon: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(systemName: "wifi")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width / 2.5, height: geo.size.height / 2.5)
                    .foregroundColor(.green)
            }
        }
    }
}
