//
//  LoadingPropertiesView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

struct LoadingPropertiesView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var showingSheet: Bool
    @ObservedObject var sessionManager = SessionManager.shared
    
    var body: some View {
        VStack {
            ScrollView {
                Rectangle()
                    .fill(.clear)
                    .frame(height: 90)
                    .contentShape(Rectangle())
                VStack {
                    VStack {
                        HStack {
                            Text("All properties")
                                .font(Font.custom("Manrope-SemiBold", size: 18))
                                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                                .multilineTextAlignment(.center)
                                .redacted(reason: .placeholder)
                                .shimmering()
                            
                            Text("\(SessionManager.shared.properties.count)")
                                .font(Font.custom("Manrope-SemiBold", size: 16))
                                .foregroundColor(CustomColors.LightGray)
                                .multilineTextAlignment(.center)
                                .redacted(reason: .placeholder)
                                .shimmering()
                            Spacer()
                            Button {
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                                
                                self.showingSheet.toggle()
                            } label: {
                                HStack {
                                    Text("Add")
                                        .font(Font.custom("Manrope-SemiBold", size: 14))
                                        .foregroundColor(CustomColors.LightGray)
                                        .multilineTextAlignment(.center)
                                        .redacted(reason: .placeholder)
                                        .shimmering()
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(CustomColors.LightGray)
                                        .font(Font.system(size: 14.0))
                                        .shimmering()
                                }
                            }
                        }
                        VStack {
                            ForEach(Array(sessionManager.loadingProperties.enumerated()), id: \.element) { idx, property in
                                PropertyView(property: property, loading: true)
                                if idx < SessionManager.shared.properties.count - 1 {
                                    Divider()
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                    .cornerRadius(24)
                    .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.08), radius: 12, x: 0, y: 4)
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    Spacer()
                }
                Rectangle()
                    .fill(.clear)
                    .frame(height: 100)
                    .contentShape(Rectangle())
            }
        }
    }
}
