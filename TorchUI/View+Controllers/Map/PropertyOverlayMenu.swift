//
//  PropertyOverlayMenu.swift
//  TorchUI
//
//  Created by Saeed Hajizadeh.
//

import Foundation
import SwiftUI

struct PropertyOverlayMenu: View {
    
    @ObservedObject var sessionManager: SessionManager
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    @Binding var showMenu: Bool
    @State var isPropertyMuted: Bool = false
    
    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading, spacing: 0) {
                
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    isPropertyMuted.toggle()
                    print(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName)
                    showMenu = false
                }) {
                    HStack(alignment: .center, spacing: 12) {
                        Image("volume-x")
                            .resizable()
                            .renderingMode(.template)
                        //TODO: - Replace the 'isPropertyMuted' with the muted state flag of selected property
                            .foregroundColor(isPropertyMuted ? CustomColors.torchBlue : CustomColors.TorchGreen)
                            .frame(width: 20, height: 20)
                        HStack(spacing: 2) {
                            Text(isPropertyMuted ? "Unmute property" : "Mute property")
                                .font(.custom("Manrope-SemiBold", size: 16))
                                .foregroundColor(isPropertyMuted ? CustomColors.torchBlue : CustomColors.TorchGreen)
//                                .kerning(-0.7)
                        }
                        Spacer(minLength: 4)
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    showMenu = false
                    SessionManager.shared.appState = .updateProperty
                }) {
                    HStack(alignment: .center, spacing: 12) {
                        Image("edit")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(CustomColors.TorchGreen)
                            .frame(width: 20, height: 20)
                        HStack(spacing: 2) {
                            Text("Edit property")
                                .font(.custom("Manrope-SemiBold", size: 16))
                                .foregroundColor(CustomColors.TorchGreen)
//                                .kerning(-0.7)
                        }
                        Spacer(minLength: 4)
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    showMenu = false
//                    SessionManager.shared.selectedProperty = properties[index].property
//                    SessionManager.shared.selectedPropertyIndex = index
                    SessionManager.shared.deleteProperty()
                    withAnimation {
                        SessionManager.shared.appState = .properties
                    }
                }) {
                    HStack(alignment: .center, spacing: 12) {
                        Image("trash-03")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(CustomColors.TorchRed)
                            .frame(width: 20, height: 20)
                        HStack(spacing: 2) {
                            Text("Delete property")
                                .font(.custom("Manrope-SemiBold", size: 16))
                                .foregroundColor(CustomColors.TorchRed)
//                                .kerning(-0.7)
                        }
                        Spacer(minLength: 4)
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity, alignment: .center)
                }

            }
            //                                .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .frame(width: 240, alignment: .topLeading)
            .background(.white)
            .cornerRadius(16)
            .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.4), radius: 90, x: 0, y: 32)
            .position(x: width - 145, y: 90)
            Spacer()
        }
        .frame(width: width)
        .background(Color.gray.opacity(0.05))
        .gesture(
            TapGesture()
                .onEnded { _ in
                    showMenu = false
                }
        )
        
    }
}

#Preview {
    
    let showMenu = Binding<Bool>(
        get: { false },
        set: { _ in }
    )
    
    let annotationsStatus = Binding<DetectorInfoStatus>(
        get: { .fire },
        set: { _ in }
    )
    
    return PropertyOverlayMenu(sessionManager: SessionManager(), showMenu: showMenu)
}
