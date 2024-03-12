//
//  MainPropertiesView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

struct PropertyRow: Identifiable, Equatable {
    let id = UUID()
    var property: Property
    var isSwipeGestureActive = false
    static func == (lhs: PropertyRow, rhs: PropertyRow) -> Bool {
        return lhs.property == rhs.property && lhs.isSwipeGestureActive == rhs.isSwipeGestureActive
    }
}

struct MainPropertiesView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var showingSheet: Bool
    @State private var properties: [PropertyRow] = []
    @ObservedObject var sessionManager = SessionManager.shared
    @State private var lastProps: [Property] = []
    @State private var isSwipeGestureActive = false
    
    var body: some View {
        VStack {
            ScrollView {
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
                        
                        VStack(spacing: 0) {
                            
                            ForEach(properties.indices, id: \.self) { index in
                                HStack(spacing: 0) {
                                    PropertyView(property: properties[index].property)
                                        .equatable()
                                        .padding(.leading, properties[index].isSwipeGestureActive ? -168 : 0)
                                        .animation(.default)
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                            impactMed.impactOccurred()
                                            SessionManager.shared.selectedProperty = properties[index].property
                                            SessionManager.shared.selectedPropertyIndex = index
                                            withAnimation {
                                                SessionManager.shared.appState = .viewProperty
                                            }
                                        }
                                        .gesture(
                                            DragGesture()
                                                .onChanged { value in
                                                    if value.translation.width < 0 {
                                                        properties[index].isSwipeGestureActive = true
                                                    } else {
                                                        properties[index].isSwipeGestureActive = false
                                                    }
                                                }
                                                .onEnded { value in
                                                    if value.translation.width < -50 {
                                                        print("Left swipe action")
                                                    }
                                                }
                                        )
                                    
                                    Spacer()
                                        .frame(width: 16)
                                    
                                        Button(action: {
                                            print("First action tapped")
                                            SessionManager.shared.selectedProperty = properties[index].property
                                            SessionManager.shared.selectedPropertyIndex = index
                                            SessionManager.shared.deleteProperty()
                                            withAnimation {
                                                SessionManager.shared.appState = .properties
                                            }
                                        }) {
                                            VStack {
                                                Image("trash-03")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundColor(.white)
                                                    .frame(width: 20, height: 20)
                                                Text("Delete")
                                                    .font(.custom("Manrope-SemiBold", size: 16))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        .frame(width: properties[index].isSwipeGestureActive ? 84 : 0, height: 84)
                                        .opacity(properties[index].isSwipeGestureActive ? 1 : 0)
                                        .background(CustomColors.TorchRed)
                                        .animation(.default)
                                        
                                        Button(action: {
                                            print("Second action tapped")
                                        }) {
                                            VStack {
                                                Image("volume-x")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundColor(.white)
                                                    .frame(width: 20, height: 20)
                                                Text("Mute")
                                                    .font(.custom("Manrope-SemiBold", size: 16))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        .frame(width: properties[index].isSwipeGestureActive ? 84 : 0, height: 84)
                                        .opacity(properties[index].isSwipeGestureActive ? 1 : 0)
                                        .background(CustomColors.WarningYellow)
                                        .animation(.default)
                                }
                                .frame(height: 84)
                                if index < properties.count - 1 {
                                    Divider()
                                        .padding(.vertical, 0)
                                }
                            }
                        }

                        //                        List {
                        //                            ForEach(Array(SessionManager.shared.properties.enumerated()), id: \.element) { idx, property in
                        //                                PropertyView(property: property)
                        //                                    .equatable()
                        //                                    .onTapGesture {
                        //                                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        //                                        impactMed.impactOccurred()
                        //
                        //                                        SessionManager.shared.selectedProperty = property
                        //                                        SessionManager.shared.selectedPropertyIndex = idx
                        //                                        withAnimation {
                        //                                            SessionManager.shared.appState = .viewProperty
                        //                                        }
                        //                                    }
                        ////                                if idx < sessionManager.properties.count - 1 {
                        ////                                    Divider()
                        ////                                        .padding(.vertical, 4)
                        ////                                }
                        //                            }
                        //                            .onDelete { indexSet in
                        //                                for index in indexSet {
                        //                                    // Delete item at index from your data source
                        //                                    sessionManager.properties.remove(at: index)
                        //                                }
                        //                            }
                        //                        }
                        //                        .listStyle(PlainListStyle())
                        //                        .frame(maxWidth: .infinity, maxHeight: CGFloat(sessionManager.properties.count * 60))
                        //                        .scrollContentBackground(.hidden)
                        //                        .background(.white)
                        ////                        .frame(width: 200, height: 200)
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
            .onReceive(sessionManager.$properties) { properties in
//                if properties.count != lastProps.count {
                if properties != lastProps {
                    print("******************** \n \(properties) \n \(properties)")
                    self.properties = properties.map { PropertyRow(property: $0) }
                    self.lastProps = properties
                }
            }
        }
    }
}
