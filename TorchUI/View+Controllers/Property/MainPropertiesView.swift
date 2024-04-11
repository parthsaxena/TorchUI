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
    @State private var propertiesIsSwipeGestureActive: [String: Bool]
    @State var isDeleting: Bool = false
    @State var selectedIndex: Int?
    
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
                        .padding(.horizontal, 16)
                        List {
                            Section {
                                ForEach(Array(SessionManager.shared.properties.enumerated()), id: \.element) { idx, property in
                                    PropertyView(property: property)
                                        .equatable()
                                        .onTapGesture {
                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                            impactMed.impactOccurred()
                                            SessionManager.shared.selectedProperty = property
                                            SessionManager.shared.selectedPropertyIndex = idx
                                            withAnimation {
                                                SessionManager.shared.appState = .viewProperty
                                            }
                                        }
                                        .swipeActions(allowsFullSwipe: true) {
                                            Button(role: .destructive) {
                                                print("Deleting row")
                                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                impactMed.impactOccurred()
                                                selectedIndex = idx
                                                isDeleting = true
                                            } label: {
                                                deleteIcon
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .foregroundColor(.white)
                                                    .font(.custom("Manrope-SemiBold", size: 16))
                                            }
                                            .tint(CustomColors.TorchRed)
                                            Button {
                                                print("Muting row")
                                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                impactMed.impactOccurred()
                                                if (property.muted) {
                                                    print("Unmute property action tapped")
                                                    SessionManager.shared.unmuteProperty(property_id: property.id)
                                                } else {
                                                    print("Mute property action tapped")
                                                    SessionManager.shared.muteProperty(property_id: property.id)
                                                }
                                            } label: {
                                                MuteIcon(isMuted: property.muted)
                                                
                                            }
                                            .tint(property.muted ? CustomColors.TorchBlue : CustomColors.WarningYellow)
                                        }
                                        .confirmationDialog("Are you sure you want to delete this property?", isPresented: $isDeleting, titleVisibility: .visible) {
                                            Button("Delete", role: .destructive) {
                                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                impactMed.impactOccurred()
                                                SessionManager.shared.selectedPropertyIndex = selectedIndex ?? 0
                                                SessionManager.shared.deleteProperty()
                                                withAnimation {
                                                    SessionManager.shared.appState = .properties
                                                }
                                            }
                                            Button("Cancel", role: .cancel) {
                                            }
                                        }
                                }
                            }
                            .listSectionSeparator(.hidden, edges: .bottom)
                        }
                        .listStyle(PlainListStyle())
                        .frame(maxWidth: .infinity)
                        .scrollContentBackground(.hidden)
                        .background(.white)
                        .frame(height: CGFloat(sessionManager.properties.count * 84))
                    }
//                    .padding(.horizontal, 16)
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
    
    private var deleteIcon: Image {
        Image(
            size: CGSize(width: 60, height: 40),
            label: Text("Delete")
        ) { ctx in
            ctx.draw(
                Image("trash-03"),
                at: CGPoint(x: 30, y: -2),
                anchor: .top
            )
            ctx.draw(
                Text("Delete"),
                at: CGPoint(x: 30, y: 22),
                anchor: .top
            )
        }
    }
    
}

struct MuteIcon: View {
    
    @State var isMuted: Bool = false
    
    var body: some View {
        Image(
            size: CGSize(width: 60, height: 40),
            label: Text("Delete")
        ) { ctx in
            ctx.draw(
                Image(isMuted ?  "volume-max" : "volume-x"),
                at: CGPoint(x: 30, y: -2),
                anchor: .top
            )
            ctx.draw(
                Text(isMuted ? "Unmute" : "Mute"),
                at: CGPoint(x: 30, y: 22),
                anchor: .top
            )
        }
        .resizable()
        .renderingMode(.template)
        .foregroundColor(.white)
        .font(.custom("Manrope-SemiBold", size: 16))
    }
}
