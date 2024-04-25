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
    @ObservedObject var sessionManager = SessionManager.shared
    @State private var propertiesIsSwipeGestureActive: [String: Bool]
    
    init(showingSheet: Binding<Bool>) {
        self._showingSheet = showingSheet
        let initialStates = SessionManager.shared.properties.map { ($0.id, false) }
        self._propertiesIsSwipeGestureActive = State(initialValue: Dictionary(uniqueKeysWithValues: initialStates))
    }
    
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
                            
                            ForEach(SessionManager.shared.properties.indices, id: \.self) { index in
                                HStack(spacing: 0) {
                                    PropertyView(property: SessionManager.shared.properties[index])
                                        .equatable()
                                        .padding(.leading, self.propertiesIsSwipeGestureActive[SessionManager.shared.properties[index].id, default: false] ? -168 : 0)
                                        .animation(.default)
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                            impactMed.impactOccurred()
                                            SessionManager.shared.selectedProperty = SessionManager.shared.properties[index]
                                            SessionManager.shared.selectedPropertyIndex = index
                                            withAnimation {
                                                SessionManager.shared.appState = .viewProperty
                                            }
                                        }
                                        .gesture(
                                            DragGesture()
                                                .onChanged { value in
                                                    if value.translation.width < 0 {
                                                        self.propertiesIsSwipeGestureActive[SessionManager.shared.properties[index].id] = true
                                                    } else {
                                                        self.propertiesIsSwipeGestureActive[SessionManager.shared.properties[index].id] = false
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
                                            print("Delete property action tapped")
                                            SessionManager.shared.selectedProperty = SessionManager.shared.properties[index]
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
                                        .frame(width: self.propertiesIsSwipeGestureActive[SessionManager.shared.properties[index].id, default: false] ? 84 : 0, height: 84)
                                        .opacity(self.propertiesIsSwipeGestureActive[SessionManager.shared.properties[index].id, default: false] ? 1 : 0)
                                        .background(CustomColors.TorchRed)
                                        .animation(.default)
                                        
                                        Button(action: {
                                            if (SessionManager.shared.properties[index].muted) {
                                                print("Unmute property action tapped")
                                                SessionManager.shared.unmuteProperty(property_id: SessionManager.shared.properties[index].id)
                                            } else {
                                                print("Mute property action tapped")
                                                SessionManager.shared.muteProperty(property_id: SessionManager.shared.properties[index].id)
                                            }
                                        }) {
                                            VStack {
                                                Image(SessionManager.shared.properties[index].muted ? "volume-max" : "volume-x")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundColor(.white)
                                                    .frame(width: 20, height: 20)
                                                Text(SessionManager.shared.properties[index].muted ? "Unmute" : "Mute")
                                                    .font(.custom("Manrope-SemiBold", size: 16))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        .frame(width: self.propertiesIsSwipeGestureActive[SessionManager.shared.properties[index].id, default: false] ? 84 : 0, height: 84)
                                        .opacity(self.propertiesIsSwipeGestureActive[SessionManager.shared.properties[index].id, default: false] ? 1 : 0)
                                        .background(CustomColors.WarningYellow)
                                        .animation(.default)
                                }
                                .frame(height: 84)
                                if index < SessionManager.shared.properties.count - 1 {
                                    Divider()
                                        .padding(.vertical, 0)
                                }
                            }
                            
//                            ForEach(properties.indices, id: \.self) { index in
//                                HStack(spacing: 0) {
//                                    PropertyView(property: properties[index].property)
//                                        .equatable()
//                                        .padding(.leading, properties[index].isSwipeGestureActive ? -168 : 0)
//                                        .animation(.default)
//                                        .contentShape(Rectangle())
//                                        .onTapGesture {
//                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
//                                            impactMed.impactOccurred()
//                                            SessionManager.shared.selectedProperty = properties[index].property
//                                            SessionManager.shared.selectedPropertyIndex = index
//                                            withAnimation {
//                                                SessionManager.shared.appState = .viewProperty
//                                            }
//                                        }
//                                        .gesture(
//                                            DragGesture()
//                                                .onChanged { value in
//                                                    if value.translation.width < 0 {
//                                                        properties[index].isSwipeGestureActive = true
//                                                    } else {
//                                                        properties[index].isSwipeGestureActive = false
//                                                    }
//                                                }
//                                                .onEnded { value in
//                                                    if value.translation.width < -50 {
//                                                        print("Left swipe action")
//                                                    }
//                                                }
//                                        )
//                                    
//                                    Spacer()
//                                        .frame(width: 16)
//                                    
//                                        Button(action: {
//                                            print("Delete property action tapped")
//                                            SessionManager.shared.selectedProperty = properties[index].property
//                                            SessionManager.shared.selectedPropertyIndex = index
//                                            SessionManager.shared.deleteProperty()
//                                            withAnimation {
//                                                SessionManager.shared.appState = .properties
//                                            }
//                                        }) {
//                                            VStack {
//                                                Image("trash-03")
//                                                    .resizable()
//                                                    .renderingMode(.template)
//                                                    .foregroundColor(.white)
//                                                    .frame(width: 20, height: 20)
//                                                Text("Delete")
//                                                    .font(.custom("Manrope-SemiBold", size: 16))
//                                                    .foregroundColor(.white)
//                                            }
//                                        }
//                                        .frame(width: properties[index].isSwipeGestureActive ? 84 : 0, height: 84)
//                                        .opacity(properties[index].isSwipeGestureActive ? 1 : 0)
//                                        .background(CustomColors.TorchRed)
//                                        .animation(.default)
//                                        
//                                        Button(action: {
//                                            if (properties[index].property.muted) {
//                                                print("Mute property action tapped")
//                                                SessionManager.shared.muteProperty(property_id: properties[index].property.id)
//                                            } else {
//                                                print("Unmute property action tapped")
//                                                SessionManager.shared.unmuteProperty(property_id: properties[index].property.id)
//                                            }
//                                        }) {
//                                            VStack {
//                                                Image(properties[index].property.muted ? "volume-max" : "volume-x")
//                                                    .resizable()
//                                                    .renderingMode(.template)
//                                                    .foregroundColor(.white)
//                                                    .frame(width: 20, height: 20)
//                                                Text(properties[index].property.muted ? "Unmute" : "Mute")
//                                                    .font(.custom("Manrope-SemiBold", size: 16))
//                                                    .foregroundColor(.white)
//                                            }
//                                        }
//                                        .frame(width: properties[index].isSwipeGestureActive ? 84 : 0, height: 84)
//                                        .opacity(properties[index].isSwipeGestureActive ? 1 : 0)
//                                        .background(CustomColors.WarningYellow)
//                                        .animation(.default)
//                                }
//                                .frame(height: 84)
//                                if index < properties.count - 1 {
//                                    Divider()
//                                        .padding(.vertical, 0)
//                                }
//                            }
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
                for property in properties {
                    if (self.propertiesIsSwipeGestureActive[property.id] == nil) {
                        self.propertiesIsSwipeGestureActive[property.id] = false
                    }
                }
            }
        }
    }
}
