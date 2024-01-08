//
//  MainPropertiesView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

struct MainPropertiesView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var showingSheet: Bool
    @ObservedObject var sessionManager = SessionManager.shared
    
    var body: some View {
        VStack {
//            ScrollView {
                Rectangle()
                    .fill(.clear)
                    .frame(height: 90)
                    .contentShape(Rectangle())
                
                VStack {
                    ForEach(SessionManager.shared.alerts) { alert in
                        AlertView(model: alert)
                    }
                    VStack {
                        HStack {
                            Text("All properties")
                                .font(Font.custom("Manrope-SemiBold", size: 18))
                                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                                .multilineTextAlignment(.center)
                            
                            Text("\(SessionManager.shared.properties.count)")
                                .font(Font.custom("Manrope-SemiBold", size: 16))
                                .foregroundColor(CustomColors.LightGray)
                                .multilineTextAlignment(.center)
                            
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
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(CustomColors.LightGray)
                                        .font(Font.system(size: 14.0))
                                }
                            }
                        }
                        
                        List {
                            
                            ForEach(Array(sessionManager.properties.enumerated()), id: \.element) { idx, property in
                                PropertyView(property: property)
//                                    .equatable()
                                    .listRowSeparator(.hidden)
                                    .onTapGesture {
                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                        impactMed.impactOccurred()
                                        
                                        SessionManager.shared.selectedProperty = property
                                        SessionManager.shared.selectedPropertyIndex = idx
                                        withAnimation {
                                            SessionManager.shared.appState = .viewProperty
                                        }
                                    }
                                    .swipeActions {
                                        Button(action: {
                                            SessionManager.shared.muteAllSensorOfProperty(property: property)
                                        }) {
                                            VStack(spacing: 4) {
                                                Image("mute")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 11, height: 11)
                                                
                                                Text("Mute")
                                                    .font(Font.custom("Manrope-Bold", size: 14))
                                            }
                                        }
                                        .tint(Color(uiColor: UIColor(red: 247/255, green: 144/255, blue: 9/255, alpha: 1)))
                                    }
                                    .swipeActions {
                                        Button(action: {}) {
                                            VStack(spacing: 4) {
                                                Image("delete")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 28, height: 28)
                                                
                                                Text("Delete")
                                                    .font(Font.custom("Manrope-Bold", size: 14))
                                            }
                                        }
                                        .tint(Color(uiColor: UIColor(red: 240/255, green: 68/255, blue: 56/255, alpha: 1)))
                                    }
                                
                                if idx < SessionManager.shared.properties.count - 1 {
                                    Divider()
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                        .listStyle(PlainListStyle())
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
//            }
        }
    }
}
