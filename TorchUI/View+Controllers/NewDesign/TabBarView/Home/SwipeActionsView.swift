//
//  SwipeActionsView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 31/05/2024.
//

import SwiftUI

struct SwipeActionsView: View {
    
    var onMuteButtonTap: () -> Void
    var onDeleteButtonTap: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .fill(CustomColors.WarningYellow)
                    VStack {
                        Text("")
                        Image("property-mute")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .padding(.leading, 10)
                        Text("Edit")
                            .font(.custom("Manrope-SemiBold", size: 14))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                        Text("")
                    }
                }
                .frame(width: 80, height: geometry.size.height + 15)
                .onAppear {
                    self.onMuteButtonTap()
                }
                ZStack {
                    Rectangle()
                        .fill(CustomColors.TorchRed)
                    VStack {
                        Text("")
                        Image("property-trash")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                        Text("Delete")
                            .font(.custom("Manrope-SemiBold", size: 14))
                            .foregroundColor(.white)
                        Text("")
                    }
                }
                .frame(width: 80, height: geometry.size.height + 15)
                .onAppear {
                    self.onDeleteButtonTap()
                }
            }
            .clipShape(RoundedCorner(topLeft: 0, topRight: 22, bottomLeft: 0, bottomRight: 22))
            .padding(.leading, 5)
            .padding(.top, -7.5)
        }
    }
}

#Preview {
    SwipeActionsView(onMuteButtonTap: {
        
    }, onDeleteButtonTap: {
        
    })
}
