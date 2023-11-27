//
//  NoPropertiesView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI


struct NoPropertiesView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var showingSheet: Bool
    @ObservedObject var sessionManager = SessionManager.shared
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                                .frame(width: 200, height: 200)
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                            Button {
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                                
                                self.showingSheet.toggle()
                            } label: {
                                Circle()
                                    .fill(Color.clear)
                                    .frame(width: 200, height: 200)
                            }
                        }
                        .shadow(color: CustomColors.LightGray.opacity(0.3), radius: 5.0)
                        Spacer()
                    }
                    Text("Add your first property")
                        .font(Font.custom(("Manrope-Semibold"), size: 20.0))
                        .foregroundColor(CustomColors.TorchGreen)
                        .padding(.top, 20)
                }
                .padding(.bottom, 40)
                Spacer()
            }
            if (!sessionManager.propertiesLoaded) {
                LoadingSplashScreen()
            }
        }
    }
}
