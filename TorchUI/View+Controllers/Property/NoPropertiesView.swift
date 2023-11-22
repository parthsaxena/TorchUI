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
//                HStack {
//                    Text("Home")
//                        .font(Font.custom("Manrope-SemiBold", size: 36))
//                        .foregroundColor(colorScheme == .dark ? CustomColors.DarkModeMainTestColor : CustomColors.TorchGreen)
//                        .multilineTextAlignment(.center)
//
//                    Spacer()
//
//                    Image("Avatar")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 48, height: 48)
//                        .clipped()
//                        .cornerRadius(100)
//                        .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.03), radius: 4, x: 0, y: 8)
//                        .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.08), radius: 12, x: 0, y: 20)
//                        .onTapGesture {
//                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
//                            impactMed.impactOccurred()
//
//                            Task {
//                                await AuthenticationManager.shared.signOut()
//                            }
//                        }
//                }
//                .padding(.horizontal, 16)
//                .padding(.top, 20)
                
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
